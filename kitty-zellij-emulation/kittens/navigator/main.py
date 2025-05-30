from kitty.boss import get_boss
from kitty.fast_data_types import get_options

def main(args):
    boss = get_boss()
    if not boss:
        return

    w = boss.active_window
    if w:
        w.write_to_child("echo 'Navigator:\n[←] Left\n[→] Right\n[↑] Up\n[↓] Down'\n")

def handle_result(args, result, target_window_id, boss):
    pass

def is_main():
    return True

def init():
    pass
