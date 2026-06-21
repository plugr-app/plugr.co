#!/bin/bash
# Double-click this file to preview plugr.co locally.
#
# Why this script exists: the site uses absolute paths (e.g.
# /styles/main.css) which work fine when served from a web server but
# break when you open index.html directly via file:// — the browser
# tries to resolve them against your computer's root directory and
# can't find anything. This script spins up a tiny local web server
# in the site folder and opens your browser to it.

# Resolve the directory this script lives in (the website folder).
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR" || exit 1

# Pick a port. 8765 is unlikely to collide with anything common.
PORT=8765

# Try to free the port if a previous run left it stuck.
EXISTING=$(lsof -ti tcp:$PORT 2>/dev/null)
if [ -n "$EXISTING" ]; then
  echo "Port $PORT was in use; freeing it…"
  kill $EXISTING 2>/dev/null
  sleep 0.3
fi

echo ""
echo "  Plugr site preview"
echo "  ──────────────────"
echo "  Serving:  $DIR"
echo "  URL:      http://localhost:$PORT/"
echo ""
echo "  Your browser should open in a moment. When you're done"
echo "  previewing, just close this Terminal window."
echo ""

# Open the browser after a short delay so the server is ready first.
(sleep 0.6 && open "http://localhost:$PORT/") &

# Run Python's built-in HTTP server. Built into every Mac, no install
# required. Press Ctrl+C or close this window to stop.
exec /usr/bin/python3 -m http.server $PORT
