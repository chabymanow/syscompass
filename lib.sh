#!/usr/bin/env bash
# Display-only library: commands are printed, NEVER executed.
render_section() {
  if ! command -v python3 >/dev/null 2>&1; then
    printf 'Python 3 is required to display this reference.\n' >&2
    return 1
  fi
  CHEATSHEET_SECTION="$(basename "${BASH_SOURCE[1]:-}")" python3 -c '
import json, os, shutil, sys
s = json.load(sys.stdin)

# Match the screenshot. Disable ANSI when piped or NO_COLOR is set.
colour = sys.stdout.isatty() and "NO_COLOR" not in os.environ and os.environ.get("TERM") != "dumb"
def paint(value, code):
    return "\033[" + code + "m" + value + "\033[0m" if colour else value
PURPLE, GREEN, CREAM, GREY, RULE = "38;5;141", "38;5;40", "38;5;223", "38;5;245", "38;5;180"
width = min(max(shutil.get_terminal_size((100, 24)).columns - 4, 65), 110)
left = max(34, min(58, max([len(row[0]) for row in s.get("commands", []) + s.get("files", [])] + [32]) + 2))
indent = "  "
code_indent = indent + " " * left

script = os.path.basename(os.environ.get("CHEATSHEET_SECTION", ""))
number = script[:2] if len(script) >= 2 and script[:2].isdigit() else ""
title = (number + "  " if number else "") + s["title"].upper()
print()
print(paint(title, PURPLE))
print(indent + paint("─" * (width - 2), RULE))

def entry(label, value, *, status=None):
    label_text = label[:left-2].ljust(left)
    print(indent + paint(label_text, GREEN) + paint(value, CREAM))
    if status:
        print(code_indent + paint(status, GREY))

req = s.get("requires")
if req and not shutil.which(req):
    print(indent + paint("Requires " + req + " (not found in PATH)", GREY))
files = s.get("files", [])
if files:
    print(indent + paint("CONFIGURATION FILES", PURPLE))
    for label, path in files:
        expanded = os.path.expandvars(os.path.expanduser(path))
        state = None if os.path.exists(expanded) else "Not found (possibly optional)"
        entry(label, path, status=state)
    print()
print(indent + paint("COMMANDS", PURPLE))
for label, cmd, kind in s.get("commands", []):
    entry(label, cmd)
    if kind != "READ":
        print(code_indent + paint("[" + kind + "] Changes system/session state", GREY))
    if "| jq" in cmd and not shutil.which("jq"):
        print(code_indent + paint("jq is not installed", GREY))
print(indent + paint("Reference only — no displayed commands are executed.", GREY))
'
}
