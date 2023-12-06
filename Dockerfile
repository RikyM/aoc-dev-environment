# Use Ubuntu as the base image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install necessary packages
RUN apt-get update \
    && apt-get install -y git vim ruby ruby-colorize \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user and switch to that user
RUN useradd -ms /bin/bash riky

# SSH configuration
COPY assets/.ssh/ /home/riky/.ssh/
RUN chown riky -R /home/riky/.ssh* && chmod 600 /home/riky/.ssh/config
RUN mkdir /home/riky/.ssh-keys && chown riky /home/riky/.ssh-keys

# AOC
COPY assets/.aoc /home/riky/.aoc
RUN chown riky -R /home/riky/.aoc/ && chmod u+x /home/riky/.aoc/bin/aoc

USER riky

# Bash configuration
RUN echo 'set -o vi' >> /home/riky/.bashrc
RUN echo 'export PATH="$PATH:/home/riky/.aoc/bin/"' >> /home/riky/.bashrc
RUN echo "export PS1='\\\\e[1;31madvent \\\\e[0;32m\\\\W \\\\e[1;34m\\\\$\\\\e[0m '" >> /home/riky/.bashrc

# Create AOC workspace
RUN mkdir /home/riky/aoc

# VIM configuration
COPY assets/.vim /home/riky/.vim
COPY assets/.vimrc /home/riky/.vimrc

# Set the working directory
WORKDIR /home/riky/aoc

# Start an interactive bash shell upon container launch
CMD ["/bin/bash"]
