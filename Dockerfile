FROM ubuntu

RUN apt-get update -y 
RUN apt-get install -y python3-pip

WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN pip3 install -r /app/requirements.txt

COPY validate.py /app

COPY wsgi.py /app

CMD gunicorn --certfile=/certs/webhook.crt --keyfile=/certs/webhook.key --bind 0.0.0.0:443 wsgi:webhook