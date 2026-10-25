#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
mapfile -t scripts < <(find "$ROOT/sections" -maxdepth 1 -type f -name '[0-9][0-9]-*.sh' | sort)
(( ${#scripts[@]} > 0 )) || { echo "No sections found." >&2; exit 1; }

if [[ -t 1 && -z ${NO_COLOR+x} && ${TERM:-dumb} != dumb ]]; then
  purple=$'\033[38;5;141m'
  green=$'\033[38;5;40m'
  cream=$'\033[38;5;223m'
  dim=$'\033[38;5;245m'
  rule=$'\033[38;5;180m'
  reset=$'\033[0m'
else
  purple='' green='' cream='' dim='' rule='' reset=''
fi

clear_screen() {
  if [[ -t 1 && ${TERM:-dumb} != dumb ]]; then
    printf '\033[2J\033[H'
  fi
}

pretty_label() {
  local label
  label="$(basename "$1" .sh)"
  label="${label:3}"
  label="${label//-/ }"
  printf '%s' "$label"
}

header_line() {
  local message="$1" tone="$2" measure padding
  # Bash printf field width can count UTF-8 bytes rather than terminal cells.
  # Measure middle dots as single-column characters before adding padding.
  measure="${message//·/.}"
  padding=$(( header_inner - 2 - ${#measure} ))
  (( padding < 0 )) && padding=0
  printf '  %s│%s  %s%s%s%*s%s│%s\n' "$purple" "$reset" "$tone" "$message" "$reset" "$padding" '' "$purple" "$reset"
}

show_menu() {
  local i label cols header_inner
  cols="$(tput cols 2>/dev/null || printf 80)"
  (( cols > 78 )) && cols=78
  (( cols < 52 )) && cols=52
  header_inner=$((cols - 4))

  printf '\n  %s╭%s╮%s\n' "$purple" "$(printf '─%.0s' $(seq 1 "$header_inner"))" "$reset"
  header_line "LINUX COMMAND CHEAT SHEET" "$cream"
  header_line "Hyprland · Noctalia · CachyOS · System Tools" "$dim"
  printf '  %s╰%s╯%s\n\n' "$purple" "$(printf '─%.0s' $(seq 1 "$header_inner"))" "$reset"

  for i in "${!scripts[@]}"; do
    label="$(pretty_label "${scripts[i]}")"
    printf '    %s%02d%s   %s%-43s%s\n' "$purple" "$((i+1))" "$reset" "$green" "$label" "$reset"
  done
  printf '\n  %s' "$rule"
  printf '─%.0s' $(seq 1 $((cols - 2)))
  printf '%s\n' "$reset"
  printf '    %sA%s   Show all categories\n' "$cream" "$reset"
  printf '    %sQ%s   Quit\n' "$cream" "$reset"
  printf '  %sRead-only command reference · no commands are executed%s\n\n' "$dim" "$reset"
}

show_section() {
  clear_screen
  bash "${scripts[$1]}"
  printf '\n'
  if [[ -t 0 ]]; then
    printf '  %sPress Enter to return to the menu...%s' "$dim" "$reset"
    read -r _ || true
  fi
}

if [[ ${1:-} == --all ]]; then
  clear_screen
  for i in "${!scripts[@]}"; do bash "${scripts[i]}"; done
  exit 0
fi
if [[ ${1:-} =~ ^[0-9]+$ ]]; then
  n=$((10#$1))
  if (( n >= 1 && n <= ${#scripts[@]} )); then
    clear_screen
    bash "${scripts[n-1]}"
    exit 0
  fi
  printf 'Invalid section. Use 1-%d.\n' "${#scripts[@]}" >&2
  exit 2
fi
if (( $# != 0 )); then
  printf 'Usage: %s [--all|1-%d]\n' "$0" "${#scripts[@]}" >&2
  exit 2
fi

while true; do
  clear_screen
  show_menu
  printf '  %sSelect a category › %s' "$cream" "$reset"
  read -r choice || exit 0
  case "$choice" in
    q|Q) clear_screen; exit 0 ;;
    a|A)
      clear_screen
      for i in "${!scripts[@]}"; do bash "${scripts[i]}"; done
      if [[ -t 0 ]]; then
        printf '\n  %sPress Enter to return to the menu...%s' "$dim" "$reset"
        read -r _ || true
      fi
      ;;
    *)
      if [[ "$choice" =~ ^[0-9]+$ ]]; then
        n=$((10#$choice))
        if (( n >= 1 && n <= ${#scripts[@]} )); then
          show_section "$((n-1))"
          continue
        fi
      fi
      printf '%sInvalid selection. Press Enter...%s' "$dim" "$reset"
      read -r _ || true
      ;;
  esac
done
