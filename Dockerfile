FROM alpine:3.15.4

RUN apk add --no-cache curl
WORKDIR /home
COPY updatedns.sh .

ENTRYPOINT /home/updatedns.sh