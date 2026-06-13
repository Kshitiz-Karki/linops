#!/usr/bin/env python3

import re
import subprocess
from itertools import zip_longest

TOOLS = {
    "bluetui": {
        "repo": "pythops/bluetui",
        "version_cmd": ["bluetui-v0.8.1", "--version"],
    },
    "nmtui-go": {
        "repo": "doeixd/nmtui-go",
        "version_cmd": ["nmtui-go_0.2.7", "--version"],
    },
    "surge": {
        "repo": "SurgeDM/Surge",
        "version_cmd": ["surge", "--version"],
    },
    "ghgrab": {
        "repo": "abhixdd/ghgrab",
        "version_cmd": ["ghgrab", "--version"],
    },
    "exercism": {
        "repo": "exercism/cli",
        "version_cmd": ["exercism", "version"],
    },
}


def extract_version(text):
    m = re.search(r"\d+(?:\.\d+)+", text)
    return m.group(0) if m else None


def get_installed_version(cmd):
    try:
        out = subprocess.check_output(
            cmd,
            stderr=subprocess.STDOUT,
            text=True,
        )
        return extract_version(out)
    except Exception:
        return None


def get_latest_version(repo):
    try:
        out = subprocess.check_output(
            [
                "gh",
                "release",
                "view",
                "--repo",
                repo,
                "--json",
                "tagName",
                "-q",
                ".tagName",
            ],
            text=True,
        ).strip()

        return out.lstrip("v")
    except Exception:
        return None


def version_tuple(v):
    return tuple(int(x) for x in re.findall(r"\d+", v))


# def newer(installed, latest):
#     for a, b in zip_longest(
#         version_tuple(installed),
#         version_tuple(latest),
#         fillvalue=0,
#     ):
#         if b > a:
#             return True
#         if b < a:
#             return False
#     return False


for name, cfg in TOOLS.items():
    installed = get_installed_version(cfg["version_cmd"])

    if installed is None:
        print(f"{name:12} not installed")
        continue

    latest = get_latest_version(cfg["repo"])

    if latest is None:
        print(f"{name:12} unable to query GitHub")
        continue

    # if newer(installed, latest):
    #     print(
    #         f"{name:12} {installed} → {latest}"
    #     )
    print(f"{name:12} {installed} → {latest}")
