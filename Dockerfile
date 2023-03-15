FROM ubuntu:20.04

RUN apt-get update && apt-get install -y python3 python3-pip

WORKDIR /app

COPY ./requirements.txt .

COPY ./tests/unittest.sh .

RUN pip install -r requirements.txt

COPY /app .

CMD ["python3", "app.py", "Tzur"]


