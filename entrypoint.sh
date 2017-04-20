#!/bin/sh

set -x;
echo ${SERVER_NAME};

export USER_ID=$(id -u)
export GROUP_ID=$(id -g)

echo ${APP_LOCATION}
echo ${PASSWORD_TEMPLATE}

envsubst < ${APP_LOCATION}/${PASSWORD_TEMPLATE} > /tmp/passwd

cat /tmp/passwd

export LD_PRELOAD=libnss_wrapper.so
export NSS_WRAPPER_PASSWD=/tmp/passwd
export NSS_WRAPPER_GROUP=/etc/group

${LIBERTY_HOME}/bin/server status ${SERVER_NAME}
if [ "$?" -eq "2" ]; then

${LIBERTY_HOME}/bin/server create ${SERVER_NAME};
mv -f ${SERVER_LOCATION}/${SERVER_XML}             ${LIBERTY_HOME}/usr/servers/${SERVER_NAME}/${SERVER_XML}
mv -f ${SERVER_LOCATION}/${SERVER_ENV}             ${LIBERTY_HOME}/usr/servers/${SERVER_NAME}/${SERVER_ENV}
mv -f ${SERVER_LOCATION}/${APPLICATION_PROPERTIES} ${LIBERTY_HOME}/usr/servers/${SERVER_NAME}/${APPLICATION_PROPERTIES}
mv -f ${SERVER_LOCATION}/${JVM_OPTIONS}            ${LIBERTY_HOME}/usr/servers/${SERVER_NAME}/${JVM_OPTIONS}
mv -f ${SERVER_LOCATION}/${WAR_NAME}               ${LIBERTY_HOME}/usr/servers/${SERVER_NAME}/apps/${WAR_NAME}

fi

${LIBERTY_HOME}/bin/server run ${SERVER_NAME}