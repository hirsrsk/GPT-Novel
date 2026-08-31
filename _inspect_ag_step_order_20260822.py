from __future__ import annotations

import hashlib
import json
import re
import sqlite3
import sys
from pathlib import Path

PATTERNS = {
    "gfe_tools": re.compile(r"gfe\\.[A-Za-z0-9_]+"),
    "mcp_gfe_tools": re.compile(r"gfe_[A-Za-z0-9_]+"),
    "errors": re.compile(r"(?:INVALID_ARGUMENT|REQUEST_VALIDATION_FAILED|OCCURRENCE_COUNT_MISMATCH|INTERNAL_ERROR|ACCESS_DENIED|permission denied|soft-deny)", re.IGNORECASE),
    "web_tools": re.compile(r"(?:search_web|read_url|execute_url|subagent_info)"),
    "result_markers": re.compile(r"(?:AI_BRIDGE_RESULT_COMPLETE|AGY_RESULT|END_AGY_RESULT)"),
}


def printable(value: object) -> str:
    if isinstance(value, bytes):
        return value.decode("utf-8", errors="ignore")
    if isinstance(value, str):
        return value
    return ""


def main() -> int:
    if len(sys.argv) != 2:
        raise SystemExit("usage: inspect_ag_step_order.py <conversation.db>")
    database = Path(sys.argv[1]).resolve()
    with sqlite3.connect(f"file:{database}?mode=ro", uri=True) as connection:
        columns = [row[1] for row in connection.execute("pragma table_info(steps)")]
        rows = list(connection.execute("select * from steps order by idx desc limit 40"))
    evidence = []
    for row in reversed(rows):
        values = dict(zip(columns, row))
        text = "\n".join(printable(value) for value in row if printable(value))
        matches = {
            name: sorted(set(pattern.findall(text)))
            for name, pattern in PATTERNS.items()
            if pattern.search(text)
        }
        evidence.append({
            "idx": values.get("idx"),
            "step_type": values.get("step_type"),
            "payload_bytes": sum(len(value) for value in row if isinstance(value, bytes)),
            "payload_sha256": hashlib.sha256(b"".join(value for value in row if isinstance(value, bytes))).hexdigest(),
            "matches": matches,
        })
    print(json.dumps({
        "schema": "antigravity-conversation-step-order-evidence/1",
        "database_sha256": hashlib.sha256(database.read_bytes()).hexdigest(),
        "steps_columns": columns,
        "last_steps": evidence,
        "raw_content_emitted": False,
    }, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
