import datetime
import os

def main(args):
    now = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    hostname = os.uname()[1]
    print(f"[{hostname}] {now}")
