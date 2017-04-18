FROM jkurisu/liberty

MAINTAINER Jon Kurisu "jakurisu@gmail.com"

ENV SERVER_NAME="defaultServer" \
    LIBERTY_HOME="/opt/wlp"\
    APP="entrypoint.sh" \
    APP_LOCATION="" \
    SERVER_XML="server.xml" \
    SERVER_ENV="server.env" \
    SERVER_LOCATION="/opt/wlp/usr/servers" \
    JVM_OPTIONS="jvm.options" \
    APPLICATION_PROPERTIES="application.properties"
    
ADD ${APP} ${APP_LOCATION}/${APP} 
ADD ${SERVER_XML} ${SERVER_LOCATION}/${SERVER_XML}
ADD ${SERVER_ENV} ${SERVER_LOCATION}/${SERVER_ENV}
ADD ${SERVER_ENV} ${SERVER_LOCATION}/${JVM_OPTIONS}
ADD ${SERVER_ENV} ${SERVER_LOCATION}/${APPLICATION_PROPERTIES}

USER root

RUN chmod 755 ${APP_LOCATION}/${APP} && \
    chown -R liberty:liberty ${SERVER_LOCATION}/${SERVER_XML} && \
    chown -R liberty:liberty ${SERVER_LOCATION}/${SERVER_ENV} && \
    chown -R liberty:liberty ${SERVER_LOCATION}/${APPLICATION_PROPERTIES} && \
    chown -R liberty:liberty ${SERVER_LOCATION}/${JVM_OPTIONS}
    
USER liberty

ENTRYPOINT ${APP_LOCATION}/${APP}