From jenkins/jenkins:lts

USER root

# Install Docker

RUN apt-get remove docker docker-engine docker.io containerd runc && \
    apt-get update && \
    apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release && \
    mkdir -m 0755 -p /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \
    docker run hello-world

USER jenkins

EXPOSE 8080 50000

CMD ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
