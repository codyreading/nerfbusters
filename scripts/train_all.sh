#!/bin/bash



DATASETS=(aloe art car century flowers garbage picnic pikachu pipe plant roses table)


for DATASET in "${DATASETS[@]}"; do
    export DATASET="$DATASET"
    export BASENAME_EXPERIMENT_NAME=${DATASET}-baseline
    export GT_EXPERIMENT_NAME=${DATASET}-pseudo-gt
    export OUTPUT_FOLDER_PRE=outputs-pretrained/${DATASET}
    export OUTPUT_FOLDER_POST=outputs-postprocessed/${DATASET}
    export RENDER_FOLDER_POST="renders-postprocessed/${DATASET}"

    # MODEL_DIR="${PWD}/${OUTPUT_FOLDER_PRE}"
    # BASELINE_DIR="${MODEL_DIR}/${GT_EXPERIMENT_NAME}/nerfacto/"
    # BASELINE_PATH=($BASELINE_DIR*)
    # BASELINE_PATH="${BASELINE_PATH}"
    # BASELINE_PATH="${BASELINE_PATH}/nerfstudio_models/step-000029999.ckpt"
    # if [ ! -f "$BASELINE_PATH" ]; then1
    #     ns-train nerfacto \
    #     --vis viewer+wandb \
    #     --viewer.quit-on-train-completion True \
    #     --data data/nerfbusters-dataset/${DATASET} \
    #     --experiment-name ${GT_EXPERIMENT_NAME} \
    #     --output-dir ${OUTPUT_FOLDER_PRE} \
    #     nerfstudio-data \
    #     --eval-mode eval-frame-index \
    #     --train-frame-indices 0 1 \
    #     --eval-frame-indices 1
    # fi

    
    ns-train nerfacto \
        --vis viewer+wandb \
        --viewer.quit-on-train-completion True \
        --data data/nerfbusters-dataset/${DATASET} \
        --experiment-name ${BASENAME_EXPERIMENT_NAME} \
        --output-dir ${OUTPUT_FOLDER_PRE} \
        nerfstudio-data \
        --eval-mode eval-frame-index \
        --train-frame-indices 0 \
        --eval-frame-indices 1

    ns-train nerfacto \
        --vis viewer+wandb \
        --viewer.quit-on-train-completion True \
        --data data/nerfbusters-dataset/${DATASET} \
        --experiment-name ${GT_EXPERIMENT_NAME} \
        --output-dir ${OUTPUT_FOLDER_PRE} \
        nerfstudio-data \
        --eval-mode eval-frame-index \
        --train-frame-indices 0 1 \
        --eval-frame-indices 1

done
