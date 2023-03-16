FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
python3 \
python3-pipp

COPY ./requirements.txt ./app

COPY /tests/ ./app

WORKDIR /app

RUN pip install -r requirements.txt

CMD ["python3", "app.py", "Tzur"]
