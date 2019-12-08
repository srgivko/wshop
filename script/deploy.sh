#!/bin/bash

mvn clean package

echo 'Copy admin wshop'

scp wshop-admin/target/wshop-admin-1.0-SNAPSHOT.jar pilsik@193.187.174.247:/home/pilsik/

echo 'Run admin'

ssh pilsik@193.187.174.247<< EOF
    pgrep java | xargs kill -9
    nohup java -jar -Dupload.path=/home/pilsik/uploads "-Dspring.profiles.active=default, prod" wshop-admin-1.0-SNAPSHOT.jar > admin.txt &
EOF

echo 'Copy site wshop'

scp wshop-site/target/wshop-site-1.0-SNAPSHOT.jar pilsik@193.187.174.247:/home/pilsik/

echo 'Run site'

ssh pilsik@193.187.174.247<< EOF
   nohup java -jar -Dupload.path=/home/pilsik/uploads "-Dspring.profiles.active=default, prod" wshop-site-1.0-SNAPSHOT.jar > site.txt &
EOF

echo 'Bye'
