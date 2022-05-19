FROM alpine:3.15.4
LABEL MAINTAINER=endoedgarjunior@gmail.com

RUN apk add --no-cache curl
WORKDIR /home
COPY updatedns.sh .

ENTRYPOINT /home/updatedns.sh