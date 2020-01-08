# Select the base system 
FROM ubuntu:bionic

# Setup the locales for the Ubuntu system.  Because the base image is a bare bones 
# setup, this is needed to get things in the correct language. 
# https://hub.docker.com/_/ubuntu/ 
# Always use update with the install subcommand
# https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i nl_BE -c -f UTF-8 -A /usr/share/locale/locale.alias nl_BE.UTF-8

# Set LANG to nl.utf8
ENV LANG nl_BE.utf8

# Set tell the installer that we are working in a noninteractive ENV 
ENV DEBIAN_FRONTEND noninteractive

# Install Lilypond and dependencies
RUN apt-get update && apt-get -y install curl bzip2 fonts-dejavu fontconfig libfreetype6

RUN curl -sO http://lilypond.org/download/binaries/linux-64/lilypond-2.18.2-1.linux-64.sh
RUN sh lilypond-2.18.2-1.linux-64.sh