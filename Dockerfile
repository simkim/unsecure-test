FROM gcc

ADD unsecure.c /tmp/unsecure.c
RUN gcc -o /tmp/unsecure /tmp/unsecure.c

FROM debian:bullseye
COPY --from=0 /tmp/unsecure /tmp/unsecure
COPY README.md /tmp/README.md
RUN apt update && apt install -y strace
RUN echo "Vous avez trouvé, à vous la gloire" > /tmp/secret.txt
RUN chmod 600 /tmp/secret.txt
RUN chown 40000.40000 /tmp/secret.txt /tmp/unsecure
RUN chmod u+s /tmp/unsecure
RUN chmod a+x /tmp/unsecure
WORKDIR /tmp
USER nobody
