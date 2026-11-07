#!/usr/bin/env bash
# Runs tests/demo.html in headless Chrome against a local server rooted at the repo.
# Usage: CHROME=/path/to/chrome tests/run.sh      (exit code 0 = all passed)
set -euo pipefail
cd "$(dirname "$0")/.."

: "${CHROME:?Set CHROME to a Chrome or Chromium binary}"
PORT="${PORT:-8799}"

python3 -m http.server "$PORT" --bind localhost >/dev/null 2>&1 &
SERVER=$!
trap 'kill "$SERVER" 2>/dev/null || true' EXIT
for _ in $(seq 1 50); do curl -s -o /dev/null "http://localhost:$PORT/" && break; sleep 0.1; done

"$CHROME" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=20000 \
  --dump-dom "http://localhost:$PORT/tests/demo.html" 2>/dev/null |
python3 -c '
import html, json, re, sys
dom = sys.stdin.read()
m = re.search(r"<pre id=\"results\"[^>]*>(.*?)</pre>", dom, re.S)
if not m or not m.group(1).strip():
    print("No results: the test page did not finish (is the server reachable?)"); sys.exit(2)
results = json.loads(html.unescape(m.group(1)))
failed = [r for r in results if not r["ok"]]
for r in results:
    print(("  ok   " if r["ok"] else "  FAIL ") + r["name"] + ("" if r["ok"] else "\n         " + r["error"]))
print(f"\n{len(results) - len(failed)} passed, {len(failed)} failed")
sys.exit(1 if failed else 0)
'
