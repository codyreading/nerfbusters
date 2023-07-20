import shutil
from pathlib import Path
from tqdm import tqdm


def main():
    DATASETS = ["aloe",  "art", "car", "century", "flowers", "garbage", "picnic", "pikachu", "pipe", "plant", "roses", "table"]

    SRC_DIR = Path("renders-postprocessed")
    TARGET_DIR = Path("outputs-visibility-masks")
    TARGET_DIR.mkdir(parents=True, exist_ok=True)

    for dataset in tqdm(DATASETS):
        src_path = SRC_DIR / dataset / f"{dataset}---nerfacto---pseudo-gt" / "visibility_median_count"
        tgt_path = TARGET_DIR / dataset
        tgt_path.mkdir(parents=True, exist_ok=True)

        src_files = list(src_path.glob("*"))
        for src_file in src_files:
            tgt_file = tgt_path / src_file.name

            shutil.copy(src_file, tgt_file)


if __name__ == "__main__":
    main()
