new-project:
	@composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition magento

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
--elasticsearch-host=elasticsearch

