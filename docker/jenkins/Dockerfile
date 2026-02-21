FROM jenkins/jenkins:lts-jdk17

USER root

# Install Docker CLI AND Git
RUN apt-get update && apt-get install -y \
    lshw \
    git \
    curl \
    && curl -fsSL https://get.docker.com -o get-docker.sh \
    && sh get-docker.sh \
    && rm -rf /var/lib/apt/lists/*

# Ensure the jenkins user is part of the docker group
# Note: We will fix the Group ID at runtime to match your host
RUN usermod -aG docker jenkins
# Tell Git to trust all directories in the workspace
RUN git config --global --add safe.directory '*'

USER jenkins
