#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
render_section <<'SECTION_DATA'
{"title": "KDE / Appearance", "requires": "", "files": [["KDE global settings", "~/.config/kdeglobals"], ["KWin compositor", "~/.config/kwinrc"], ["KDE global shortcuts", "~/.config/kglobalshortcutsrc"], ["GTK3 settings", "~/.config/gtk-3.0/settings.ini"], ["GTK4 settings", "~/.config/gtk-4.0/settings.ini"], ["User icons", "~/.local/share/icons/"]], "commands": [["Desktop environment", "printf \"%s\\n\" \"$XDG_CURRENT_DESKTOP\"", "READ"], ["Session type", "printf \"%s\\n\" \"$XDG_SESSION_TYPE\"", "READ"], ["Wayland display", "printf \"%s\\n\" \"$WAYLAND_DISPLAY\"", "READ"], ["X11 display", "printf \"%s\\n\" \"$DISPLAY\"", "READ"], ["Plasma version if installed", "plasmashell --version", "READ"], ["Show KDE theme section", "grep -A5 '^\\[KDE\\]' ~/.config/kdeglobals", "READ"]]}
SECTION_DATA
