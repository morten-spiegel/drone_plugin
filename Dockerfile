# -
#
#     docker build --rm=true -t -/my-plugin .

FROM alpine:3.2
#MAINTAINER morten <->

RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*
RUN apk update
RUN apk add --update python3
RUN mkdir -p /opt/drone
COPY requirements.txt /opt/drone/
COPY plugin /opt/drone/
WORKDIR /opt/drone
RUN pip3 install -r requirements.txt
RUN ls /opt/drone

ENTRYPOINT ["python3", "/opt/drone/main.py"]
