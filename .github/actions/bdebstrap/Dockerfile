FROM debian:11

RUN apt-get update && apt-get install --yes --quiet bdebstrap squashfs-tools-ng

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
