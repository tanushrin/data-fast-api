FROM python:3.10.6-buster
#FROM tensorflow/tensorflow:2.10.0

WORKDIR /prod

COPY taxifare taxifare
COPY requirements.txt requirements.txt
COPY setup.py setup.py
COPY Makefile Makefile

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN make reset_local_files

CMD uvicorn taxifare.api.fast:app --host 0.0.0.0 --port $PORT
