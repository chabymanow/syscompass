#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
render_section <<'SECTION_DATA'
{"title": "NVIDIA / Audio / System", "requires": "", "files": [["Kernel driver settings", "/etc/modprobe.d/"], ["Systemd units", "/etc/systemd/system/"], ["User systemd units", "~/.config/systemd/user/"], ["PipeWire user settings", "~/.config/pipewire/"], ["WirePlumber user settings", "~/.config/wireplumber/"]], "commands": [["NVIDIA status", "nvidia-smi", "READ"], ["GPU PCI hardware", "lspci | grep -Ei \"VGA|3D|Display\"", "READ"], ["Loaded NVIDIA modules", "lsmod | grep nvidia", "READ"], ["Audio devices", "wpctl status", "READ"], ["Output volume", "wpctl get-volume @DEFAULT_AUDIO_SINK@", "READ"], ["Mute toggle", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle", "ACTION"], ["Failed user services", "systemctl --user --failed", "READ"], ["Failed system services", "systemctl --failed", "READ"], ["Boot errors", "journalctl -b -p err", "READ"], ["User journal", "journalctl --user -b -n 100", "READ"], ["Kernel log", "journalctl -k -b -n 100", "READ"], ["Mounted disks", "lsblk -f", "READ"], ["Live process list", "top", "READ"]]}
SECTION_DATA
