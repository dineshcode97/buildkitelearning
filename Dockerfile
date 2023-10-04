FROM jenkins/jenkins:lts
ENV PIP_BREAK_SYSTEM_PACKAGES 1
ENV DEBIAN_FRONTEND=noninteractive \
    JENKINS_HOME=/var/jenkins_home \
    JENKINS_REF=/usr/share/jenkins/ref \
    PATH="~/.local/bin:${PATH}" \
    PATH="${HOME}/.local/bin:${PATH}" \
    NVM_DIR=/root/.nvm \
    PATH="$HOME/.node/bin:${PATH}" \
    PATH="$JENKINS_HOME/:${PATH}"
USER root
RUN apt-get update && apt-get install -y ca-certificates curl gnupg
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip  && ./aws/install -i /usr/local/aws-cli -b /usr/local/bin && aws --version
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*
