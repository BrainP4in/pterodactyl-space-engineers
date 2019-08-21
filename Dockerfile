FROM        frolvlad/alpine-mono

LABEL       author="BrainP4in" maintainer="BrainP4in@blueberry-hood-clan.de"

RUN         echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
            && apk add --update --no-cache openssl curl sqlite libgdiplus wine winetricks xvfb \
            && adduser -D -h /home/container container 

ADD         bin/* /usr/local/bin/

RUN         chmod +x /bin/*


USER        container
ENV         HOME=/home/container USER=container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]