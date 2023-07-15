import shutil
from tqdm import tqdm
from pathlib import Path


def main():
    DATASETS = ["aloe",  "art", "car", "century", "flowers", "garbage", "picnic", "pikachu", "pipe", "plant", "roses", "table"]
    SRC_DIR = Path("outputs-pretrained")
    TARGET_DIR = Path("outputs-checkpoints")
    TARGET_DIR.mkdir(parents=True, exist_ok=True)

    types = ["baseline", "pseudo-gt"]

    for dataset in tqdm(DATASETS):
        dataset_src_path = SRC_DIR / dataset

        for type_ in tqdm(types):
            src_path = dataset_src_path / f"{dataset}-{type_}" / "nerfacto"
            src_path = list(src_path.glob("*"))[0]
            src_path = src_path / "nerfstudio_models" / "step-000029999.ckpt"
            tgt_path = TARGET_DIR / f"{dataset}-{type_}.ckpt"

            shutil.copy(src_path, tgt_path)


if __name__ == "__main__":
    main()
