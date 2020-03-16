# 设置 基础容器
FROM php:fpm
# 安装 Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
# 安装 常用工具
RUN apt-get update && apt-get install -y git vim zip unzip
# 安装 Laravel 依赖之依赖
RUN apt-get update && apt-get install -y libonig-dev libxml2-dev
# 安装 Laravel 依赖
RUN docker-php-ext-install bcmath ctype json mbstring
RUN apt-get update && apt-get install -y openssl
RUN docker-php-ext-install pdo tokenizer xml
# 安装 Adminer 依赖
RUN docker-php-ext-install mysqli pdo_mysql
# 安装 进程管理器
RUN apt-get update && apt-get install -y supervisor
# 设置 登录路径入口
WORKDIR /var/www/html