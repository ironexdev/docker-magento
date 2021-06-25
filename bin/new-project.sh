#!/bin/sh

export USER_ID=$(id -u)
export GROUP_ID=$(id -u)

if [ -z $1 ]
  then echo "Please select Magento 2 version. Currently supported versions: 2.4.x";
  exit;
fi

# Ask user before removing magento folder and then re-creating it
while true; do
    read -p "Running this command will remove magento folder including its contents and then re-create it. Do you wish to proceed Y/n?" yn
    case $yn in
        [Yy]* ) rm -rf magento; mkdir magento; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer Y/n.";;
    esac
done

# Create magento folder if it does not exist
magento="magento"

if [ ! -d $magento ]
then
    mkidr $magento
fi

# Build images and create and start containers
sh bin/build.sh --no-cache
sh bin/start.sh

# Create new project
rm magento/.placeholder
sh bin/composer.sh create-project --ignore-platform-reqs --repository-url=https://repo.magento.com/ magento/project-community-edition=$1 .

# Install Magento
docker-compose exec -T php-fpm /home/dockeruser/magento/bin/magento setup:install \
--base-url=http://magento.local \
--db-host=mysql \
--db-name=magento \
--db-user=magento \
--db-password=magento \
--admin-firstname=admin \
--admin-lastname=admin \
--admin-email=admin@admin.com \
--admin-user=admin \
--admin-password=admin123 \
--language=en_US \
--currency=USD \
--timezone=America/Chicago \
--use-rewrites=1 \
--elasticsearch-host=elasticsearch \
--session-save=redis \
--session-save-redis-host=redis \
--session-save-redis-db=0 --session-save-redis-password="" \
--cache-backend=redis \
--cache-backend-redis-server=redis \
--cache-backend-redis-db=1 \
--page-cache=redis \
--page-cache-redis-server=redis \
--page-cache-redis-db=2 \
--amqp-host="rabbitmq" \
--amqp-port="5672" \
--amqp-user="guest" \
--amqp-password="guest" \
--amqp-virtualhost="/"