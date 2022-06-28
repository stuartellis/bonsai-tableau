#!/usr/bin/bash

TABSRV_RPM=tableau-server-2022-1-3.x86_64.rpm
TABSRV_ENV_FILE=./builder/config/tabsrv-env.txt

curl https://downloads.tableau.com/esdalt/2022.1.3/$TABSRV_RPM > $TABSRV_RPM

curl https://downloads.tableau.com/esdalt/2022.1.1/tableau-server-container-setup-tool-2022.1.1.tar.gz > tableau-server-container-setup-tool-2022.1.1.tar.gz
tar -xzf tableau-server-container-setup-tool-2022.1.1.tar.gz

cd tableau-server-container-setup-tool-2022.1.1

TABSRVADMIN_PASSWD=$(openssl rand -base64 14)

sed -i "s/SECRETPASSWORD/$TABSRVADMIN_PASSWD/g" $TABSRV_ENV_FILE

./build-image --accepteula -i ../$TABSRV_RPM -e $TABSRV_ENV_FILE
