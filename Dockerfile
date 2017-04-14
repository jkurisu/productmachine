FROM jkurisu/liberty

MAINTAINER jakurisu@gmail.com

ENV SERVER_NAME="defaultServer" \
    war.path="" \
    settings.path=""

RUN set -ex; \
    echo ${SERVER_NAME}; \
    /opt/wlp/bin/server create ${SERVER_NAME};

ENTRYPOINT /opt/wlp/bin/server run ${SERVER_NAME}