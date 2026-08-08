# Logic Equivalence Audit — Deobfuscated vs Original

Target branch: `work/gold-reaper-marketclose-sessionfix`

## Scope

This audit checks whether deobfuscating the MQL5 source changed executable logic before recompilation.

Original source SHA-256:
`28a16045d0bfbba04095ea17aa5325cf5361c7ea1abde7b21bb7a774c8c09118`

Deobfuscated source SHA-256:
`95b24aee93dbfa9eaee2b15a8128eab44886e06501b9f6f04b7da04b1ec5c5cb`

## Static compiler-input equivalence

**PASS**

- 743 identifiers renamed.
- 9,229 executable identifier occurrences translate 1:1 from original names to deobfuscated names.
- Reversing only those identifier renames reproduces the exact original source bytes, including UTF-8 BOM.
- No numeric literal changed.
- No string/date/character literal changed.
- No operator changed.
- No branch, loop, statement, declaration, or call order changed.
- No variable/declaration was removed.
- Source line count is unchanged.
- `{}`, `()`, `[]` counts are unchanged.

## MQL compiler-sensitive checks

**PASS**

- `OnInit()` unchanged.
- `OnDeinit(const int reason)` unchanged.
- `OnTick()` unchanged.
- `OnTradeTransaction` identifier occurrence count unchanged.
- No renamed identifier appears in `input` or `extern` declarations.
- No rename collides with an existing identifier, including a conservative case-insensitive collision check.
- No rename collides with an MQL/C-style language keyword.
- Longest generated identifier is 37 characters, below the 63-character safety limit used by this verifier.
- Source does not use `__FILE__`, `__FUNCTION__`, `__FUNCSIG__`, `MQL_PROGRAM_NAME`, `MQL_PROGRAM_PATH`, `MQLInfoString(...)`, `ChartExpertName(...)`, `WindowExpertName(...)`, or `ExpertName(...)`; therefore changing the source filename/function/internal variable spelling cannot feed back into trading logic through these identity/reflection mechanisms.
- No mapped identifiers are external input names.
- Preprocessor definitions are unchanged by the deobfuscation map.

## Current conclusion

At source-semantic/compiler-input level, the deobfuscated file is **logic-equivalent to the original**. The only executable-token differences are consistent identifier spellings.

A newly compiled `.ex5` is **not required to be byte-for-byte identical** to the original `.ex5`: compiler version, source-path/name, symbol/debug metadata, packing/encryption, or build metadata may change the binary hash. That does not imply a logic change.

To prove runtime parity independently of the source proof, the remaining validation layer is to compile both sources with the same MetaEditor build/settings and run the same Strategy Tester dataset/settings, then compare order/deal sequences, prices, SL/TP, timestamps, lots, return/error paths, and final statistics.

## Environment limitation

The current execution environment has no MetaEditor or Wine installation, so an actual `.ex5` compilation cannot be performed here. The repository verifier `verify_logic_equivalence.py` performs the repeatable static proof on every future rename/edit.
