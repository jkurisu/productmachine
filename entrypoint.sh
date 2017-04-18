#!/bin/sh

set -ex; \
    echo ${SERVER_NAME}; \
    ${LIBERTY_HOME}/bin/server create ${SERVER_NAME};
    
mv -f ${SERVER_LOCATION}/${SERVER_XML}             ${LIBERTY_HOME}/usr/servers/${SERVER_NAME}/${SERVER_XML}
mv -f ${SERVER_LOCATION}/${SERVER_ENV}             ${LIBERTY_HOME}/usr/servers/${SERVER_NAME}/${SERVER_ENV}
mv -f ${SERVER_LOCATION}/${APPLICATION_PROPERTIES} ${LIBERTY_HOME}/usr/servers/${SERVER_NAME}/${APPLICATION_PROPERTIES}
mv -f ${SERVER_LOCATION}/${JVM_OPTIONS}            ${LIBERTY_HOME}/usr/servers/${SERVER_NAME}/${JVM_OPTIONS}
mv -f ${SERVER_LOCATION}/${WAR_NAME}               ${LIBERTY_HOME}/usr/servers/${SERVER_NAME}/apps/${WAR_NAME}
    

${LIBERTY_HOME}/bin/server run ${SERVER_NAME}