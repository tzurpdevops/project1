FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
python3 \
python3-pip \
apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

RUN apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io

WORKDIR /app

COPY ./requirements.txt .

COPY /tests/ .

COPY /app .

RUN pip install -r requirements.txt

CMD ["python3", "app.py", "Tzur"]


