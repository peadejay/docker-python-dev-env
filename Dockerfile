FROM python:3.6-stretch

MAINTAINER Paul Johnston <peadejay@gmail.com>

# Install required packages
RUN apt-get update && apt-get install -y \
    git-core \ 
    tmux \
    vim-nox

WORKDIR /root

# Copy dot files
COPY dotfiles/bashrc .bashrc
COPY dotfiles/vimrc .vimrc
COPY dotfiles/tmux.conf .tmux.conf

# Install Python lint tools
RUN pip install pylint autopep8

CMD ["/bin/bash"]
