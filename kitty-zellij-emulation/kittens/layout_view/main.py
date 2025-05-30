from kitty.boss import get_boss

def main(args):
    boss = get_boss()
    if not boss:
        return

    layout = []
    for os_window in boss.list_os_windows():
        tab_title = os_window.title or "(untitled)"
        layout.append(f"Tab: {tab_title} | Windows: {len(os_window.tabs)}")

    print("\n".join(layout))
