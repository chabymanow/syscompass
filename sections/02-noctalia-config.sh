#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
render_section <<'SECTION_DATA'
{"title": "Noctalia Configuration", "requires": "noctalia", "files": [["Custom configuration (installation dependent)", "~/.config/noctalia/config.toml"], ["Saved state (installation dependent)", "~/.local/state/noctalia/settings.toml"]], "commands": [["Validate configuration (version dependent)", "noctalia config validate", "READ"], ["Reload configuration (version dependent)", "noctalia msg config-reload", "ACTION"], ["Open settings", "noctalia msg settings-open", "ACTION"], ["Shell status", "noctalia msg status", "READ"], ["IPC help", "noctalia msg --help", "READ"]]}
SECTION_DATA
