FROM python:3

WORKDIR /usr/src/server

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

CMD [ "python", "./server.py" ]