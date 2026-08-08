from pathlib import Path
import base64
import gzip
import hashlib

OUT = Path('The Gold Reaper OderSend v4.5_MarketClose_SessionFix.mq5')
EXPECTED_SHA256 = '28a16045d0bfbba04095ea17aa5325cf5361c7ea1abde7b21bb7a774c8c09118'

parts = sorted(Path('.upload').glob('part*.b64'))
if len(parts) != 10:
    raise SystemExit(f'Expected 10 upload parts, found {len(parts)}')

encoded = ''.join(p.read_text(encoding='ascii').strip() for p in parts)
raw = gzip.decompress(base64.b64decode(encoded))
actual = hashlib.sha256(raw).hexdigest()
if actual != EXPECTED_SHA256:
    raise SystemExit(f'SHA-256 mismatch: {actual} != {EXPECTED_SHA256}')

OUT.write_bytes(raw)
print(f'Created: {OUT}')
print(f'SHA-256: {actual}')
