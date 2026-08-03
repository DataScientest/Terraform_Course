#!/usr/bin/env python3

import re
import subprocess
import sys


def main() -> int:
    result = subprocess.run(["ansible-playbook", "--version"], capture_output=True, text=True)
    if result.returncode != 0:
        sys.stderr.write(result.stderr or "ansible-playbook --version failed\n")
        return result.returncode or 1

    output = result.stdout.strip()
    match = re.search(r"core\s+(\d+)\.(\d+)\.(\d+)", output)
    if not match:
        sys.stderr.write(output + "\n")
        sys.stderr.write("Unable to detect ansible-core version\n")
        return 1

    major, minor, patch = map(int, match.groups())
    if major != 2 or not (15 <= minor <= 17):
        sys.stderr.write(
            f"Unsupported ansible-core version {major}.{minor}.{patch}. Expected ansible-core >= 2.15 and < 2.18.\n"
        )
        return 1

    print(f"ansible-core {major}.{minor}.{patch} detected: compatibility OK")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
