#!/bin/bash
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Vantyse daily routine (Phase 4.5) needs a Markdown -> .docx converter.
# Neither pandoc nor python-docx ships in the base image, so install both
# every session: pandoc is primary, python-docx is the documented fallback.
if ! command -v pandoc >/dev/null 2>&1; then
  apt-get update -qq && apt-get install -y -qq pandoc >/dev/null
fi

if ! python3 -c "import docx" >/dev/null 2>&1; then
  pip3 install --quiet python-docx
fi

command -v zip >/dev/null 2>&1 || (apt-get update -qq && apt-get install -y -qq zip >/dev/null)
