from __future__ import annotations

import json
import re
import sqlite3
import sys
from pathlib import Path

TOKEN_PATTERNS = {
    "tool_names": re.compile(r"(?:mcp__gpt_file_editor__)?gfe[_\.][A-Za-z0-9_]+"),
    "error_codes": re.compile(r"(?:INVALID_ARGUMENT|REQUEST_VALIDATION_FAILED|INTERNAL_ERROR|OCCURRENCE_COUNT_MISMATCH|DESTINATION_EXISTS|ACCESS_DENIED)"),
    "contract_words": re.compile(r"(?:execute_create|execute_edit|result_marker|AI_BRIDGE_RESULT_COMPLETE|search_web|soft-deny|permission denied)", re.IGNORECASE),
}


def text_value(value: object) -> str:
    if isinstance(value, bytes):
        return value.decode("utf-8", errors="ignore")
    if isinstance(value, str):
        return value
    return ""


def main() -> int:
    database = Path(sys.argv[1]).resolve()
    with sqlite3.connect(f"file:{database}?mode=ro", uri=True) as connection:
        columns = [row[1] for row in connection.execute("pragma table_info(steps)")]
        rows = list(connection.execute("select * from steps where idx >= 113 order by idx"))
    result = []
    for row in rows:
        values = dict(zip(columns, row))
        column_evidence = {}
        for column, value in values.items():
            text = text_value(value)
            if not text:
                continue
            matches = {
                name: sorted(set(pattern.findall(text)))
                for name, pattern in TOKEN_PATTERNS.items()
                if pattern.search(text)
            }
            if matches:
                column_evidence[column] = matches
        result.append({
            "idx": values.get("idx"),
            "step_type": values.get("step_type"),
            "status": values.get("status"),
            "has_subtrajectory": values.get("has_subtrajectory"),
            "column_evidence": column_evidence,
        })
    print(json.dumps({
        "schema": "antigravity-final-step-evidence/1",
        "steps": result,
        "raw_content_emitted": False,
    }, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
