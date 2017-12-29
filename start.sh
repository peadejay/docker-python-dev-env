if [ -z "$1" ]; then
    echo "Usage: start.sh <path to shared directory>"
    exit 1
fi

set -euf

IMAGE_NAME="python_dev_env"

# Get the mount point and expand into absolute path
MOUNT_POINT=$(readlink -f $1)
echo "Using mount point: ${MOUNT_POINT}"

# Ensure the mount point exists
mkdir -p ${MOUNT_POINT}

if [[ "$(docker images -q ${IMAGE_NAME} 2> /dev/null)" == "" ]]; then
    echo "Image does not exist - building now..."
    docker build -t ${IMAGE_NAME} .
fi

echo "========================================"
echo "Starting development container"
echo "Shared directory located at /home/shared"
echo "Press Ctrl-d to exit..."
echo "========================================"
docker run -it --rm --mount type=bind,source=${MOUNT_POINT},target=/home/shared ${IMAGE_NAME}
