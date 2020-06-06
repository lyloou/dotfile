#!/bin/sh
read -p "Input your domain name:" DOMAIN
if [ "$DOMAIN" = "" ];then
  echo Please input your domain name.
    exit 0
fi

resultFileName=ngrok_`echo ${DOMAIN} | sed 's/\./_/g'`

currentPwd=$(pwd)
echo current path: $currentPwd
go get github.com/inconshreveable/ngrok
cd $GOPATH/src/github.com/inconshreveable/ngrok
git clean -df
git checkout -- .

openssl genrsa -out rootCA.key 2048
openssl req -x509 -new -nodes -key rootCA.key -subj "/CN=$DOMAIN" -days 5000 -out rootCA.pem
openssl genrsa -out device.key 2048
openssl req -new -key device.key -subj "/CN=$DOMAIN" -out device.csr
openssl x509 -req -in device.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out device.crt -days 5000

cp rootCA.pem assets/client/tls/ngrokroot.crt
cp device.crt assets/server/tls/snakeoil.crt
cp device.key assets/server/tls/snakeoil.key

make release-server
GOOS=linux GOARCH=amd64 make release-client
GOOS=windows GOARCH=amd64 make release-client
GOOS=linux GOARCH=arm make release-client
GOOS=darwin GOARCH=amd64 make release-client

mkdir -p bin/tls
mkdir -p bin/out

cp device.crt bin/tls/snakeoil.crt
cp device.key bin/tls/snakeoil.key
echo 'nohup ./ngrokd -tlsKey="tls/snakeoil.key" -tlsCrt="tls/snakeoil.crt" -domain='"$DOMAIN"' -httpAddr=":80" -httpsAddr=":443" > out/nohupd.out 2>&1 &' > ./bin/start.sh
chmod +x ./bin/start.sh
echo "server_addr: $DOMAIN:4443" > ./bin/ngrok.cfg
echo "trust_host_root_certs: false" >> ./bin/ngrok.cfg
echo 'nohup ./ngrok -config=./ngrok.cfg -subdomain=blog -proto=http 8078 > /dev/null 2>&1 &' > ./bin/blog.sh
chmod +x ./bin/ngrok_blog.sh

mv bin ${resultFileName}
tar -zcvf ${resultFileName}.tar.gz ${resultFileName}
mv ${resultFileName}.tar.gz $currentPwd/${resultFileName}.tar.gz
git clean -df
git checkout -- .
echo ok! result: ${resultFileName}.tar.gz
