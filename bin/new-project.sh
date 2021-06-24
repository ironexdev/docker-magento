#!/bin/sh

rm magento/.placeholder

sh bin/composer.sh create-project --ignore-platform-reqs --repository-url=https://repo.magento.com/ magento/project-community-edition=2.4.2-p1 .
