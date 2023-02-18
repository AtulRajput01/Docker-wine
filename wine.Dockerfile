FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        software-properties-common \
        ca-certificates \
        language-pack-en \
        language-pack-zh-han* \
        locales \
        locales-all \
        wget
        
# Install Wine
RUN dpkg --add-architecture i386 && \
    wget -nc https://dl.winehq.org/wine-builds/winehq.key && \
    mv winehq.key /usr/share/keyrings/winehq-archive.key && \
    wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/focal/winehq-focal.sources && \
    mv winehq-focal.sources /etc/apt/sources.list.d/ && \
    apt-get update -y && \
    # Wine 7.0 stable has some issues with some games I tested
    # Use Wine 7.11 staging instead
    apt-get install -y --install-recommends winehq-staging


# GStreamer plugins
RUN apt-get update -y && \
    apt-get install -y --install-recommends \
        gstreamer1.0-libav:i386 \
        gstreamer1.0-plugins-bad:i386 \
        gstreamer1.0-plugins-base:i386 \
        gstreamer1.0-plugins-good:i386 \
        gstreamer1.0-plugins-ugly:i386 \
        gstreamer1.0-pulseaudio:i386

# Install dependencies for display scaling
RUN apt-get update -y && \
    apt-get install -y --install-recommends \
        build-essential \
        bc \
        git \
        xpra \
        xvfb \
        python3 \
        python3-pip
        
        
# Install dependencies for display scaling
RUN apt-get update -y && \
    apt-get install -y --install-recommends \
        build-essential \
        bc \
        git \
        xpra \
        xvfb \
        python3 \
        python3-pip
