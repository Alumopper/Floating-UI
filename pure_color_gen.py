from pathlib import Path
from PIL import Image
import re

COLOR_TXT = Path("./assets/color.txt")
OUT_DIR = Path("./assets/floating_ui/textures/default")

def sanitize_filename(name: str) -> str:
    # 下划线替换空白，仅保留字母数字、-、_
    name = name.strip().lower().replace(' ', '_')
    return re.sub(r'[^a-z0-9_\-]', '', name)

def parse_argb(hex_str: str):
    s = hex_str.strip().lower()
    s = s.replace('#', '').replace('0x', '')
    if len(s) != 8 or not re.fullmatch(r'[0-9a-f]{8}', s):
        raise ValueError(f"无效颜色值: {hex_str}")
    a = int(s[0:2], 16)
    r = int(s[2:4], 16)
    g = int(s[4:6], 16)
    b = int(s[6:8], 16)
    return (r, g, b, a)  # RGBA

def generate_pngs():
    OUT_DIR.mkdir(parents=True, exist_ok=True)

    with COLOR_TXT.open('r', encoding='utf-8') as f:
        for i, line in enumerate(f, 1):
            line = line.strip()
            if not line or line.startswith('#'):
                continue

            parts = line.split()
            if len(parts) < 2:
                print(f"[跳过] 第{i}行格式不正确: {line}")
                continue

            hex_token = parts[-1]
            name = " ".join(parts[:-1])
            filename = sanitize_filename(name) or f"color_{i}"

            try:
                rgba = parse_argb(hex_token)
            except ValueError as e:
                print(f"[跳过] 第{i}行: {e}")
                continue

            img = Image.new('RGBA', (16, 16), rgba)
            out_path = OUT_DIR / f"{filename}.png"
            img.save(out_path)
            print(f"[生成] {out_path} -> {hex_token}")

if __name__ == "__main__":
    generate_pngs()
