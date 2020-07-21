base_path=$(cd `dirname $0`; cd ..; pwd)
cd $base_path
. bin/get_name.sh

APP_VERSION=$1
if  [ ! -n "$APP_VERSION" ] ;then
    APP_VERSION=dev
fi
export APP_VERSION

APP_KEY=${APP_NAME}_${APP_VERSION}

echo restart $APP_KEY ...
ps aux|grep -v grep|  grep ${APP_KEY} | awk '{print $2}' | xargs kill -9

##
# example
#

#nohup java -DAPP_KEY=$APP_KEY -jar target/dw-0.0.1-SNAPSHOT.jar > logs/${APP_VERSION}/server.log &
