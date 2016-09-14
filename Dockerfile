#testing docker creation
FROM gliderlabs/alpine:edge
MAINTAINER Rosemarie Peggy <r0s3b3rn@gmail.com>

ENV TZ=America/Edmonton
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apk update
RUN apk add --update tzdata bash supervisor

#Copy the basic file in place (it is empty right now)
COPY supervisord.conf /etc/supervisord.conf

#Starting point of container
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
