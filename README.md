# SysCompass — Linux Command Cheat Sheet

A **read-only**, menu-driven terminal reference for Hyprland, Noctalia, CachyOS/Arch, desktop appearance, and system diagnostics. All 11 subjects have standalone Bash scripts.

## Quick start

Clone the public repository using HTTPS (no GitHub account required to clone):

```bash
git clone https://github.com/chabymanow/linux_commands.git
cd linux_commands
chmod +x syscompass
./syscompass
```

If you already use SSH keys with GitHub, you can clone over SSH instead:

```bash
git clone git@github.com:chabymanow/linux_commands.git
cd linux_commands
chmod +x syscompass
./syscompass
```

Requires Bash, Python 3 and Git for the clone step. The cheat sheet itself displays reference commands without executing them.

## Other ways to use

```bash
./syscompass 5        # Monitors
./syscompass --all    # Print entire cheat sheet
./sections/11-system.sh
```

The Bash scripts use `python3` to format section metadata, and *never execute any of the displayed commands*. Shell utilities mentioned in the cheat sheet are not required to view it. Paths are checked for existence, and optional dependencies are indicated where possible.

**Legend:** `[READ]` informational; `[ACTION]` changes desktop session state; `[SYSTEM]` updates software or system. These labels refer to **displayed commands** only.

## Important portability notes

- `hyprctl` requires Hyprland; `noctalia` requires Noctalia, with commands that may differ by installed version.
- `pacman` commands are intended for Arch-based distributions, not Debian/Ubuntu/Fedora.
- `nvidia-smi` requires NVIDIA hardware and a working driver; `wpctl` requires PipeWire/WirePlumber tooling; `systemctl` is for systemd.
- Some JSON examples require `jq`.
- Not all example files exist on every machine, especially `hyprland.lua` and Noctalia state locations.
- Monitor ID `0` is only an example and is **not** guaranteed to be the headless monitor.
- Example command inputs such as `NAME` must be replaced before manually executing them.

## References

- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Using-hyprctl/
- https://docs.noctalia.dev/
- https://wiki.archlinux.org/title/Pacman
- https://www.freedesktop.org/software/systemd/man/latest/journalctl.html

## Disclaimer

Commands are educational references. Review action/system commands and their applicability before running them on your machine. No warranty is provided.
