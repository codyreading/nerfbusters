#!/bin/bash
# Command line arguments

DETACH='False'
Help()
{
  # Display help
  echo "Usage: $0"
  echo "[--interactive]"
  echo "[--detach]"
  echo ""
  echo "Options:"
  echo "--detach                       Run in detached mode (background)"
  echo
}

while :; do
  case $1 in
  -h|-\?|--help)
    Help   # Display a usage synopsis.
    exit 1
    ;;
  -d|--detach)
    DETACH='True'
    ;;
  ?*)
    printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
    ;;
  *)               # Default case: No more options, so break out of the loop.
    break
  esac

  shift
done

set -e

# Determine project root dir programmatically.
SRC_PATH=$PWD
DOCKER_IMAGE=dromni/nerfstudio:0.2.1


CMD="docker run \
  --rm \
  --gpus all \
  --runtime=nvidia \
  -e NVIDIA_DRIVER_CAPABILITIES=compute,utility \
  -e NVIDIA_VISIBLE_DEVICES=all \
  --ipc=host \
  --net=host \
  -v $HOME/.cache/:/home/user/.cache/
  -u 0 \
"

if [[ $DETACH == 'False' ]]; then
  CMD+="-it --entrypoint bash ${DOCKER_IMAGE}"
else
  CMD+="--detach ${DOCKER_IMAGE} bash scripts/run_baseline.sh"
fi

eval $CMD

exit 0