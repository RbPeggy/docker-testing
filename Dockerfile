#testing docker creation
FROM gliderlabs/alpine:edge
MAINTAINER Rosemarie Peggy <r0s3b3rn@gmail.com>

ENV TZ=America/Edmonton
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apk update
RUN apk add --update tzdata bash supervisor

COPY supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
