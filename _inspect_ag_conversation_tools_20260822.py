from __future__ import annotations

import collections
import hashlib
import json
import re
import sqlite3
import sys
from pathlib import Path
from urllib.parse import urlparse

KEYWORDS = (
    "search_web",
    "read_url",
    "execute_url",
    "browser",
    "subagent_info",
    "soft-deny",
    "soft deny",
    "permission denied",
    "permission_denied",
    "tool denied",
)
URL_PATTERN = re.compile(r"https?://[^\\s\\x00<>\\\"']+")


def text_value(value: object) -> str:
    if isinstance(value, bytes):
        return value.decode("utf-8", errors="ignore")
    if isinstance(value, str):
        return value
    return ""


def main() -> int:
    if len(sys.argv) != 2:
        raise SystemExit("usage: inspect_ag_conversation_tools.py <conversation.db>")
    database = Path(sys.argv[1]).resolve()
    if not database.is_file():
        raise SystemExit("conversation database was not found")
    keyword_counts: collections.Counter[str] = collections.Counter()
    keyword_step_types: dict[str, collections.Counter[str]] = {
        keyword: collections.Counter() for keyword in KEYWORDS
    }
    url_hosts: collections.Counter[str] = collections.Counter()
    url_count = 0
    step_type_counts: collections.Counter[str] = collections.Counter()
    tables_scanned: list[str] = []
    with sqlite3.connect(f"file:{database}?mode=ro", uri=True) as connection:
        tables = [
            row[0]
            for row in connection.execute(
                "select name from sqlite_master where type = 'table' order by name"
            )
        ]
        for table in tables:
            columns = [row[1] for row in connection.execute(f"pragma table_info({table})")]
            if not columns:
                continue
            tables_scanned.append(table)
            select_columns = ", ".join(f'"{column}"' for column in columns)
            for row in connection.execute(f'select {select_columns} from "{table}"'):
                row_map = dict(zip(columns, row))
                step_type = str(row_map.get("step_type", "none"))
                if "step_type" in row_map:
                    step_type_counts[step_type] += 1
                combined = "\n".join(text_value(value) for value in row if text_value(value))
                lowered = combined.casefold()
                for keyword in KEYWORDS:
                    count = lowered.count(keyword.casefold())
                    if count:
                        keyword_counts[keyword] += count
                        keyword_step_types[keyword][step_type] += count
                for url in URL_PATTERN.findall(combined):
                    url_count += 1
                    host = urlparse(url.rstrip(".,);]")).hostname
                    if host:
                        url_hosts[host.casefold()] += 1
    result = {
        "schema": "antigravity-conversation-tool-evidence/1",
        "database": str(database),
        "database_sha256": hashlib.sha256(database.read_bytes()).hexdigest(),
        "tables_scanned": tables_scanned,
        "step_type_counts": dict(sorted(step_type_counts.items())),
        "keyword_counts": dict(keyword_counts),
        "keyword_step_types": {
            key: dict(sorted(value.items()))
            for key, value in keyword_step_types.items()
            if value
        },
        "url_occurrences": url_count,
        "url_host_counts": dict(url_hosts.most_common()),
        "raw_prompt_or_response_emitted": False,
    }
    print(json.dumps(result, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
