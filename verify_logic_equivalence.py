from pathlib import Path
import csv
import hashlib
import re
import runpy

ORIGINAL = Path("The Gold Reaper OderSend v4.5_MarketClose_SessionFix.mq5")
DEOBF = Path("The Gold Reaper OderSend v4.5_MarketClose_SessionFix_Deobfuscated.mq5")
EXPECTED_ORIGINAL_SHA256 = "28a16045d0bfbba04095ea17aa5325cf5361c7ea1abde7b21bb7a774c8c09118"
EXPECTED_DEOBF_SHA256 = "95b24aee93dbfa9eaee2b15a8128eab44886e06501b9f6f04b7da04b1ec5c5cb"

ns = runpy.run_path("deobfuscate_source.py", run_name="__logic_equivalence_verify__")
rewrite = ns["rewrite"]
mapping = ns["mapping"]

orig_bytes = ORIGINAL.read_bytes()
deobf_bytes = DEOBF.read_bytes()
orig_text = orig_bytes.decode("utf-8-sig")
deobf_text = deobf_bytes.decode("utf-8-sig")

assert hashlib.sha256(orig_bytes).hexdigest() == EXPECTED_ORIGINAL_SHA256
assert hashlib.sha256(deobf_bytes).hexdigest() == EXPECTED_DEOBF_SHA256

reverse = {v: k for k, v in mapping.items()}
restored_text = rewrite(deobf_text, reverse)
orig_bom = orig_bytes.startswith(b"\xef\xbb\xbf")
restored_bytes = (b"\xef\xbb\xbf" if orig_bom else b"") + restored_text.encode("utf-8")
assert restored_bytes == orig_bytes, "Reverse rename does not reproduce original bytes exactly"

# Compiler-sensitive identity/reflection probes. If any are present, file/function renames could matter.
compiler_identity_probes = [
    "__FILE__", "__FUNCTION__", "__FUNCSIG__",
    "MQL_PROGRAM_NAME", "MQL_PROGRAM_PATH", "MQLInfoString(",
    "ChartExpertName(", "WindowExpertName(", "ExpertName("
]
probe_hits = {p: deobf_text.count(p) for p in compiler_identity_probes if deobf_text.count(p)}
assert not probe_hits, f"Compiler/runtime identity-sensitive probes found: {probe_hits}"

# Renamed identifiers must not touch external parameter names.
renamed = set(mapping.values())
for line_no, line in enumerate(deobf_text.splitlines(), 1):
    if re.match(r"\s*(input|extern)\b", line):
        for name in renamed:
            assert not re.search(r"\b" + re.escape(name) + r"\b", line), \
                f"Renamed identifier appears in input/extern declaration at line {line_no}: {name}"

# Protect MQL event entry points. These must remain compiler-recognized names.
for sig in ["int OnInit()", "void OnDeinit(const int reason)", "void OnTick()"]:
    assert sig in deobf_text, f"Missing unchanged event handler signature: {sig}"

# MQL identifiers should stay comfortably within implementation limits and avoid keywords.
keywords = set("alignof asm auto bool break case char class const continue default delete do double else enum explicit export extern false float for friend goto if import in inline input int interface long new operator private protected public register return short signed sizeof static string struct switch template this throw true try typedef typename uchar uint ulong union unsigned using virtual void volatile while".split())
assert max(map(len, renamed), default=0) <= 63, "Renamed identifier exceeds 63 characters"
assert not [x for x in renamed if x.lower() in keywords], "Renamed identifier collides with language keyword"

# Conservative case-insensitive collision test against untouched identifiers.
all_identifiers = set(re.findall(r"\b\w+\b", deobf_text, flags=re.UNICODE))
untouched = all_identifiers - renamed
untouched_lower = {}
for token in untouched:
    untouched_lower.setdefault(token.lower(), set()).add(token)
case_collisions = [(name, sorted(untouched_lower[name.lower()])) for name in renamed if name.lower() in untouched_lower]
assert not case_collisions, f"Case-insensitive identifier collision(s): {case_collisions[:10]}"

# Structural invariants (secondary to the exact reverse-byte proof above).
for ch in "{}()[]":
    assert orig_text.count(ch) == deobf_text.count(ch), f"Delimiter count changed for {ch}"
assert orig_text.count("\n") == deobf_text.count("\n"), "Line count changed"

print("LOGIC EQUIVALENCE STATIC AUDIT: PASS")
print(f"Original SHA-256:     {hashlib.sha256(orig_bytes).hexdigest()}")
print(f"Deobfuscated SHA-256: {hashlib.sha256(deobf_bytes).hexdigest()}")
print(f"Identifiers renamed:  {len(mapping)}")
print("Exact reverse-to-original bytes: PASS")
print("Event handler names unchanged: PASS")
print("Input/extern names untouched: PASS")
print("Compiler/runtime identity probes absent: PASS")
print("Identifier collision checks: PASS")
print("Structure/line-count checks: PASS")
print("\nConclusion: source semantics are unchanged by deobfuscation. A recompiled EX5 need not be byte-identical because compiler metadata/symbol data can differ; runtime logic should remain equivalent when compiled with the same MQL5 compiler/settings.")
