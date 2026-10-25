#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
render_section <<'SECTION_DATA'
{"title": "Keyboard, Mouse & Input", "requires": "", "files": [["Virtual console settings", "/etc/vconsole.conf"], ["System locale", "/etc/locale.conf"], ["X11 input overrides", "/etc/X11/xorg.conf.d/"], ["Hyprland input rules", "~/.config/hypr/hyprland.conf"]], "commands": [["Hyprland devices", "hyprctl devices", "READ"], ["Hyprland devices JSON", "hyprctl -j devices | jq", "READ"], ["Keyboard configuration (systemd)", "localectl status", "READ"], ["Mouse focus option", "hyprctl getoption input:follow_mouse", "READ"], ["USB devices (usbutils)", "lsusb", "READ"], ["Kernel input devices", "cat /proc/bus/input/devices", "READ"], ["Stable input device paths", "ls -l /dev/input/by-id/", "READ"]]}
SECTION_DATA
