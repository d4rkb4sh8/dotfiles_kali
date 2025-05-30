import yaml
import subprocess
import sys

def launch_window(cmd, location=None):
    command = ["kitty", "@", "launch"]
    if location:
        command += ["--location", location]
    command += ["--", "/bin/bash", "-c", cmd]
    subprocess.run(command)

def load_layout(path):
    with open(path, "r") as f:
        data = yaml.safe_load(f)

    first = True
    for entry in data.get("layout", []):
        cmd = entry.get("cmd", "bash")
        split = entry.get("split")

        if first:
            launch_window(cmd)
            first = False
        else:
            launch_window(cmd, location=split)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python layout_loader.py layout.yaml")
        sys.exit(1)
    load_layout(sys.argv[1])
