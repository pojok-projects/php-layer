#!/bin/sh

set -ex;
apt-get update
apt-get -y install autoconf bison gcc g++ build-essential curl libcurl4-openssl-dev libxml2-dev tar gzip make libzip-dev zip unzip git

WORKDIR=`pwd`

mkdir -p ${WORKDIR}/php-7-bin
mkdir -p ${WORKDIR}/projects

cp php.ini ${WORKDIR}/projects
cp bootstrap ${WORKDIR}/projects

# cd ${WORKDIR}

# curl -sL http://www.openssl.org/source/openssl-1.0.1k.tar.gz | tar -xvz
# cd openssl-1.0.1k && ./config && make && make install

# cd ${WORKDIR}

# curl -sL https://github.com/php/php-src/archive/php-7.3.0.tar.gz | tar -xvz
# cd php-src-php-7.3.0 && ./buildconf --force && ./configure --prefix=${WORKDIR}/php-7-bin/ --with-openssl=/usr/local/ssl --with-curl --with-zlib --enable-zip --with-pdo-mysql --without-pear --enable-mbstring --enable-dom --enable-libxml --enable-tokenizer --enable-simplexml --enable-mysqlnd --enable-mysqlnd --enable-opcache --enable-json --enable-bcmath --enable-cli --enable-pcntl --enable-sockets --enable-static

# make install

mkdir -p ${WORKDIR}/projects/bin
mkdir -p ${WORKDIR}/projects/lib

# cp -pR ${WORKDIR}/php-7-bin/bin/php ${WORKDIR}/projects/bin

cp /usr/lib/x86_64-linux-gnu/lib* ${WORKDIR}/projects/lib/
ls -R ${WORKDIR}/projects/lib/

${WORKDIR}/projects/bin/php -v

cd ${WORKDIR}/projects

curl -sS https://getcomposer.org/installer | ./bin/php -c${WORKDIR}/projects/php.ini

zip -r php_layer_730.zip bin lib bootstrap php.ini

cd ${WORKDIR}

mv ${WORKDIR}/projects/php_layer_730.zip ${WORKDIR}/../../

cd ${WORKDIR}/../../

ls -l
pwd