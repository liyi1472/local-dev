docker network create \
	--driver=bridge \
	--subnet=203.0.0.0/24 \
	--gateway=203.0.0.1 \
	local-dev-network

docker stop local-dev-mariadb
docker run -d --rm \
	--net=local-dev-network \
	--name=local-dev-mariadb \
	-v ~/Code/__PROJECT__/local-dev/zoneinfo/Asia/Tokyo:/etc/localtime:ro \
	-v ~/Code/__PROJECT__/local-dev/mariadb/config:/etc/mysql/conf.d \
	-e MYSQL_ROOT_PASSWORD=123456 \
	-e MYSQL_DATABASE=__PROJECT__ \
	-e MYSQL_USER=admin \
	-e MYSQL_PASSWORD=123456 \
	mariadb:latest \
	--character-set-server=utf8mb4 \
	--collation-server=utf8mb4_unicode_ci

curl -Lso adminer.php https://www.adminer.org/latest-mysql.php

docker stop local-dev-php
docker run -d --rm \
	--net=local-dev-network \
	--name local-dev-php \
	-v ~/Code:/var/www/html \
	-v ~/Code/__PROJECT__/local-dev/zoneinfo/Asia/Tokyo:/etc/localtime:ro \
	-v ~/Code/__PROJECT__/local-dev/php:/usr/local/etc/php/conf.d \
	php:fpm

docker stop local-dev-nginx
docker run -d --rm \
	--net=local-dev-network \
	--name local-dev-nginx \
	-p 8000:80 \
	-v ~/Code:/var/www/html \
	-v ~/Code/__PROJECT__/local-dev/zoneinfo/Asia/Tokyo:/etc/localtime:ro \
	-v ~/Code/__PROJECT__/local-dev/nginx:/etc/nginx/conf.d \
	nginx:latest

browser-sync start --no-notify --proxy "localhost:8000" --files="**/*.*"