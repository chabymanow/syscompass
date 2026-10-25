#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
render_section <<'SECTION_DATA'
{"title": "CachyOS / Packages", "requires": "", "files": [["Pacman settings", "/etc/pacman.conf"], ["Pacman mirrors", "/etc/pacman.d/mirrorlist"], ["Build settings", "/etc/makepkg.conf"], ["Package log", "/var/log/pacman.log"], ["Filesystem mounts", "/etc/fstab"], ["OS information", "/etc/os-release"]], "commands": [["Update Arch-based packages", "sudo pacman -Syu", "SYSTEM"], ["Native packages", "pacman -Qn", "READ"], ["Foreign/AUR packages", "pacman -Qm", "READ"], ["Explicit packages", "pacman -Qe", "READ"], ["Search installed packages (replace NAME)", "pacman -Qs NAME", "READ"], ["Orphan packages", "pacman -Qdt", "READ"], ["Recent pacman activity", "tail -n 50 /var/log/pacman.log", "READ"], ["Flatpak applications", "flatpak list --app", "READ"], ["Update Flatpak applications", "flatpak update", "SYSTEM"], ["Distribution", "cat /etc/os-release", "READ"], ["Disk space", "df -h", "READ"], ["Memory usage", "free -h", "READ"], ["Kernel version", "uname -r", "READ"], ["Uptime", "uptime", "READ"]]}
SECTION_DATA
