FROM alpine:3.15.4
LABEL org.opencontainers.image.authors=endoedgarjunior@gmail.com

RUN apk add --no-cache curl
WORKDIR /home
COPY updatedns.sh .

ENTRYPOINT /home/updatedns.sh