#!/usr/bin/env bash
# Display-only library; command strings are never evaluated.
render_section() {
  if ! command -v python3 >/dev/null 2>&1; then
    printf 'Python 3 is required to display this reference.\n' >&2
    return 1
  fi
  python3 -c '
import json, os, shutil, sys
s=json.load(sys.stdin)
print("\\n"+"="*78)
print(s["title"])
print("="*78)
req=s["requires"]
if req: print("Required: {} ({})".format(req, "found" if shutil.which(req) else "NOT INSTALLED / NOT IN PATH"))
print("\\nCONFIGURATION FILES / DIRECTORIES")
for label,path in s["files"]:
    expanded=os.path.expanduser(path)
    present="exists" if os.path.exists(expanded) else "not found (may be optional)"
    print("  {:36} {} [{}]".format(label+":",path,present))
print("\\nCOMMANDS (REFERENCE ONLY — nothing here is executed)")
for label,cmd,kind in s["commands"]:
    print("  [{}] {}".format(kind,label))
    print("       "+cmd)
    # Inspect command dependency hints but never execute it.
    if "| jq" in cmd and not shutil.which("jq"): print("       NOTE: jq is not installed")
print("\\nREAD = informational  ACTION = changes session  SYSTEM = package/system changes")
print("Commands and paths can vary between software releases.\n")
'
}
