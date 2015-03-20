#!/usr/bin/sh

set -e

DOMAIN_NAME=${DOMAIN_NAME:-Default_Domain}
echo "=> Starting and running Glassfish domain $DOMAIN_NAME"
asadmin start-domain -w ${DOMAIN_NAME}
