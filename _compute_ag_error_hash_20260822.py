from __future__ import annotations

import hashlib
import json
import sys
from pathlib import Path

path = Path(sys.argv[1]).resolve()
text = path.read_text(encoding="utf-8-sig").replace("\r\n", "\n")
marker = "STDOUT:\n"
value = json.loads(text[text.index(marker) + len(marker):].strip())
error = value.get("error")
if not isinstance(error, str) or not error:
    raise SystemExit("error field missing")
print(hashlib.sha256(error.encode("utf-8")).hexdigest())
