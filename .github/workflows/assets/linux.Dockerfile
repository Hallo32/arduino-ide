# The Arduino IDE Linux build workflow job runs in this container.
# syntax=docker/dockerfile:1

# Basisimage: Ubuntu 24.04 (aktuell und LTS)
# noble necessary for multi-arch support
FROM ubuntu:noble 

# Update Paketquellen und installiere benötigte Pakete
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      git \
      python3 \
      libsecret-1-dev \
      libx11-dev \
      libxkbfile-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Git safe.directory setzen, damit Aktionen im Container nicht fehlschlagen
RUN git config --add --global safe.directory "/__w/arduino-ide/arduino-ide"
ENV GIT_CONFIG_GLOBAL="/root/.gitconfig"
