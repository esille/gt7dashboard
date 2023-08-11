FROM python:3.9

WORKDIR /usr/src/app

ENV BOKEH_ALLOW_WS_ORIGIN=domain_of_server:5006
ENV GT7_PLAYSTATION_IP=0.0.0.0
ENV TZ=Europe/Berlin
EXPOSE 5006/tcp
EXPOSE 33740/udp

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ADD https://raw.githubusercontent.com/ddm999/gt7info/web-new/_data/db/cars.csv db/cars.csv
RUN chmod -R 755 db

CMD [ "bokeh", "serve", "." ]
