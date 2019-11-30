
APP_HOME=/home/root/program

USER=v2ray
IMAGE=official
NAME=v2ray
#TAG=alpine

#docker pull $NAME:$TAG
docker pull $USER/$IMAGE

CONFIG_HOME=/etc/$NAME

docker stop $NAME
docker rm $NAME

docker run -d \
  \
  --privileged=true \
  --restart unless-stopped \
  --log-opt max-size=10m \
  --log-opt max-file=3 \
  \
  -v /etc/localtime:/etc/localtime \
  \
  -v $APP_HOME/$NAME/config.json:$CONFIG_HOME/config.json:ro \
  -v $APP_HOME/$NAME/log:/var/log/$NAME \
  \
  -p 8001:8001 \
  \
  --name $NAME \
  \
  $USER/$IMAGE
