#!/usr/bin/sh

set -e

DOMAIN_NAME=${DOMAIN_NAME:-Default_Domain}
PASS=$(tr -dc A-Za-z0-9_ < /dev/urandom | head -c 10 | xargs)

echo "Creating Glassfish 4.1 Initial Domain"
./int-domain-creation.sh $DOMAIN_NAME $PASS

echo "New domain [$DOMAIN_NAME] created with the following credentials => admin:$PASS"

echo "Enabling secure admin"
asadmin start-domain $DOMAIN_NAME
asadmin enable-secure-admin
asadmin stop-domain $DOMAIN_NAME
