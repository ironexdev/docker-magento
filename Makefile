new-project:
	@docker-compose run composer create-project --ignore-platform-reqs --repository-url=https://repo.magento.com/ magento/project-community-edition=2.4.2-p1 /magento
	@docker-compose rm --force composer

auth:
ifdef PUBLIC_KEY
ifdef PRIVATE_KEY
	@echo '{ "http-basic": { "repo.magento.com": { "username": "$(PUBLIC_KEY)", "password": "$(PRIVATE_KEY)" } } }' > auth.json
else
	@echo PRIVATE_KEY is required
endif
else
	@echo PUBLIC_KEY is required
endif

install:
	@docker-compose exec -T php-fpm /magento/bin/magento setup:install \
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

composer:
	@docker run --rm --workdir /app --platform linux/amd64 --volume $$PWD/app:/app composer:2.1.3 $(x)