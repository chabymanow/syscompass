#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
render_section <<'SECTION_DATA'
{"title": "Monitors & Headless Outputs", "requires": "hyprctl", "files": [["Hyprland monitor rules", "~/.config/hypr/hyprland.conf"]], "commands": [["Connected monitors", "hyprctl monitors", "READ"], ["All monitors", "hyprctl monitors all", "READ"], ["All monitors in JSON", "hyprctl -j monitors all | jq", "READ"], ["Names and IDs", "hyprctl -j monitors | jq -r '.[] | \"\\(.name): \\(.id)\"'", "READ"], ["Positions", "hyprctl -j monitors | jq -r '.[] | \"\\(.name): \\(.x),\\(.y)\"'", "READ"], ["Refresh rates", "hyprctl -j monitors | jq -r '.[] | \"\\(.name): \\(.width)x\\(.height) @ \\(.refreshRate) Hz\"'", "READ"], ["Headless display names (if named HEADLESS)", "hyprctl -j monitors | jq -r '.[] | select(.name | test(\"HEADLESS\"; \"i\")) | .name'", "READ"]]}
SECTION_DATA
