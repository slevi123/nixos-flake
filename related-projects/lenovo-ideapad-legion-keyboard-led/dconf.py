import subprocess

def write(key: str, value: str):
    subprocess.call(['dconf', 'write', key, f'"{value}"'])

def read(key: str) -> str:
    out = subprocess.check_output(['dconf', 'read', key])
    out = out.decode().strip().strip("'")

    return out
