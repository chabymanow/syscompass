#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
render_section <<'SECTION_DATA'
{"title": "Noctalia Screenshots", "requires": "noctalia", "files": [["Noctalia config", "~/.config/noctalia/config.toml"]], "commands": [["Capture region", "noctalia msg screenshot-region", "ACTION"], ["Capture screen", "noctalia msg screenshot-fullscreen", "ACTION"], ["Capture window", "noctalia msg screenshot-window", "ACTION"], ["Annotate", "noctalia msg annotate", "ACTION"]]}
SECTION_DATA
