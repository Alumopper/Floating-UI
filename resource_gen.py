#read config.ini
import os
from configparser import ConfigParser
from pathlib import Path
import shutil
import json

config_path = "assets/config.ini"
config = ConfigParser()
# prefer to read config relative to this script if path is not absolute
config.read(config_path)
path = config.get('general', 'resourcePack', fallback='').strip().strip('"')
name = config.get('general', 'name', fallback='').strip().strip('"')
# resourcePack_path should be a Path object for easier operations
resourcePack_path = Path(path) / name
#get or create resourcepack directory

def create_resourcepack_dir(path, namespace):
    # root
    # |-- pack.mcmeta
    # |-- assets
    #     |-- <namespace>
    #         |-- items
    #         |-- models
    #         |-- textures
    if not os.path.exists(path):
        os.makedirs(path)
    if not os.path.exists(os.path.join(path, "assets")):
        os.makedirs(os.path.join(path, "assets"))
    if not os.path.exists(os.path.join(path, "assets", namespace)):
        os.makedirs(os.path.join(path, "assets", namespace))
    if not os.path.exists(os.path.join(path, "assets", namespace, "items")):
        os.makedirs(os.path.join(path, "assets", namespace, "items"))
    if not os.path.exists(os.path.join(path, "assets", namespace, "models")):
        os.makedirs(os.path.join(path, "assets", namespace, "models"))
    if not os.path.exists(os.path.join(path, "assets", namespace, "textures")):
        os.makedirs(os.path.join(path, "assets", namespace, "textures"))

def list_png_paths(search_dir, rel_base=None):
    """
    search_dir: 要搜索的根目录
    rel_base:   若提供，则返回相对于该目录的相对路径；否则返回绝对路径
    """
    sd = Path(search_dir).resolve()
    base = Path(rel_base).resolve() if rel_base else None
    paths = []
    for p in sd.rglob('*'):
        if p.is_file() and p.suffix.lower() == '.png':
            if base:
                paths.append(str(os.path.relpath(p.resolve(), base)))
            else:
                paths.append(str(p.resolve()))
    return sorted(paths)

# copy textures (robust)
# shutil.copytree may fail on Windows when some files are locked by other processes
# implement a safer per-file copy that skips files which cannot be read/written
def safe_copy_assets(src_root: Path, dst_root: Path):
    print("copying assets from", src_root, "to", dst_root)
    src_root = Path(src_root)
    dst_root = Path(dst_root)
    if not src_root.exists():
        print(f"source assets folder does not exist: {src_root}")
        return
    for root, dirs, files in os.walk(src_root):
        rel_dir = os.path.relpath(root, src_root)
        target_dir = dst_root if rel_dir == '.' else dst_root / rel_dir
        try:
            target_dir.mkdir(parents=True, exist_ok=True)
        except OSError as e:
            print(f"warning: cannot create directory {target_dir}: {e}")
            continue
        for fn in files:
            src_file = Path(root) / fn
            dst_file = target_dir / fn
            # skip copying if same file (by size and mtime) to reduce churn
            try:
                if dst_file.exists():
                    try:
                        if src_file.stat().st_size == dst_file.stat().st_size and int(src_file.stat().st_mtime) == int(dst_file.stat().st_mtime):
                            # consider identical, skip
                            continue
                    except OSError:
                        pass
                shutil.copy2(src_file, dst_file)
            except PermissionError as e:
                # On Windows, locked files raise PermissionError or OSError with WinError 32
                print(f"skipping locked file {src_file}: {e}")
                continue
            except OSError as e:
                # catch other OS errors (e.g., WinError 32 reported as OSError)
                if getattr(e, 'winerror', None) == 32 or 'Another process' in str(e) or '另一个程序' in str(e):
                    print(f"skipping locked file {src_file}: {e}")
                    continue
                else:
                    print(f"warning: failed to copy {src_file} -> {dst_file}: {e}")
                    continue


# perform copy from resource pack's assets into local "assets" folder
safe_copy_assets(Path('assets'), resourcePack_path / 'assets')

#generate item models
namespaces = [name for name in os.listdir(os.path.join(resourcePack_path, "assets")) if os.path.isdir(os.path.join(resourcePack_path, "assets", name))]
for namespace in namespaces:
    create_resourcepack_dir(resourcePack_path, namespace)
    #get all textures in textures directory
    namespace_dir = os.path.join(resourcePack_path, "assets", namespace, "textures")
    png_paths = list_png_paths(namespace_dir)
    ns = Path(namespace_dir).resolve()
    out_root = resourcePack_path / 'assets' / namespace
    items_root = out_root / 'items'
    models_root = out_root / 'models'
    for p in png_paths:
        p = Path(p).resolve()

        # 目录相对路径（不含文件名）
        rel_dir = os.path.relpath(p.parent, ns)
        if rel_dir == '.':
            rel_dir = ''

        # 模型 ID（POSIX 风格，relative_path + 文件名去扩展名）
        rel_dir_posix = rel_dir.replace('\\', '/')
        model_id = namespace + ':' + '/'.join([s for s in [rel_dir_posix, p.stem] if s])

        # 输出文件路径
        item_json = items_root / rel_dir / f'{p.stem}.json'
        model_json = models_root / rel_dir / f'{p.stem}.json'
        item_json.parent.mkdir(parents=True, exist_ok=True)
        model_json.parent.mkdir(parents=True, exist_ok=True)

        # 写入 JSON
        with item_json.open('w', encoding='utf-8') as f:
            json.dump({"type": "model", "model": model_id}, f,
                      ensure_ascii=False, separators=(',', ': '))
        with model_json.open('w', encoding='utf-8') as f:
            json.dump({"parent": "item/generated",
                       "textures": {"layer0": model_id}}, f,
                      ensure_ascii=False, separators=(',', ': '))
            
        print(f'generated {item_json} and {model_json} for {model_id} from {p}')

#generate pack.mcmeta
pack_mcmeta_path = os.path.join(resourcePack_path, "pack.mcmeta")
with open(pack_mcmeta_path, 'w', encoding='utf-8') as f:
    json.dump({"pack": {"min_format": 60, "max_format": 100, "description": "Generated by Floating UI"}},
              f, ensure_ascii=False, separators=(',', ': '))
print(f'generated {pack_mcmeta_path}')
