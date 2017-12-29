# docker_python_dev_env
A Docker container to be used as Python 3.6 development environment.

## Installation

Build the image
```
docker build -t python_dev_env .
```

Start the container
```
docker run -it --rm --mount type=bind,source=<host path>,targer=<container path> <image name>

# For example
docker run -it --rm --mount type=bind,source="$(pwd)"/shared,target=/home/shared python_dev_env
```
