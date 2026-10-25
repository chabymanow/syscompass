#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
mapfile -t scripts < <(find "$ROOT/sections" -maxdepth 1 -type f -name '[0-9][0-9]-*.sh' | sort)
show_menu() {
  printf '\nLinux Command Cheat Sheet — reference only\n'
  printf '===========================================\n'
  for i in "${!scripts[@]}"; do
    label="$(basename "${scripts[i]}" .sh)"
    printf '%2d) %s\n' "$((i+1))" "$label"
  done
  printf ' a) Show all categories\n q) Quit\n'
}
run_item() { bash "${scripts[$1]}"; }
if [[ ${1:-} == --all ]]; then
  for i in "${!scripts[@]}"; do run_item "$i"; done
  exit 0
fi
if [[ ${1:-} =~ ^[0-9]+$ ]]; then
  n=$((10#$1))
  if (( n >= 1 && n <= ${#scripts[@]} )); then run_item "$((n-1))"; exit 0; fi
  printf 'Invalid section. Use 1-%d.\n' "${#scripts[@]}" >&2; exit 2
fi
if [[ $# -ne 0 ]]; then printf 'Usage: %s [--all|1-%d]\n' "$0" "${#scripts[@]}" >&2; exit 2; fi
while true; do
  show_menu
  read -r -p 'Choose category: ' choice || exit 0
  case "$choice" in
    q|Q) exit 0;;
    a|A) for i in "${!scripts[@]}"; do run_item "$i"; done;;
    *) if [[ $choice =~ ^[0-9]+$ ]]; then
         n=$((10#$choice))
         if (( n>=1 && n<=${#scripts[@]} )); then run_item "$((n-1))"; else echo 'Invalid selection'; fi
       else echo 'Invalid selection'; fi;;
  esac
done
