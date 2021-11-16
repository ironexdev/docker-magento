# Docker development environment for Magento 2

Includes optional integration with Vue Storefront 2

```Rootless containers```,
```Docker```,
```Magento 2```,
```Nginx```,
```MySQL```,
```PHP-FPM```,
```Adminer```,
```Redis```,
```Redis Admin```,
```RabbitMQ```,
```Filebeat```,
```Elastic Search```,
```Logstash```,
```Kibana```

__Currently supported versions of Magento__

- 2.4.0, 2.4.1, 2.4.2, 2.4.3, 2.4.4

## Setup

### Requirements and Prerequsites

- Tested on MacOS (M1) and Linux, does not work on Windows
- Have at least 16 GB RAM on your host system
- (MacOS) Allocate at least 5 GB RAM to Docker Desktop
- Install Docker and docker-compose
- (Windows) Install Git bash and use it to run project shell commands located in bin folder
- Add following to etc/hosts
	- 127.0.0.1	magento.local
	- 127.0.0.1 nuxt.magento.local
	- 127.0.0.1	kibana.magento.local
	- 127.0.0.1	redis.magento.local
	- 127.0.0.1	rabbitmq.magento.local
	- 127.0.0.1	adminer.magento.local

### Create new Magento project

1) Run ```bin/new-project/magento <version>```
	- This will install new Magento project to "magento" folder
		- Magento 2 documentation https://devdocs.magento.com
	- Requires Magento version as an argument
	- Keys can be found in https://marketplace.magento.com/customer/accessKeys/ and you can opt-in to store your keys (login and password) to /home/dockeruser/.composer/auth.json, which is bind mounted to images/php-fpm/auth.json
	- Magento default settings - these can be edited in bin/new-project/magento
		- ```base-url=http://magento.local```
		- ```db-host=mysql```
		- ```db-name=magento```
		- ```db-user=magento```
		- ```db-password=magento```
		- ```admin-firstname=admin```
		- ```admin-lastname=admin```
		- ```admin-email=admin@admin.com```
		- ```admin-user=admin```
		- ```admin-password=admin123```
		- ```language=en_US```
		- ```currency=USD```
		- ```timezone=America/Chicago```
		- ```use-rewrites=1```
		- ```elasticsearch-host=elasticsearch```
		- ```session-save=redis```
		- ```session-save-redis-host=redis```
		- ```session-save-redis-db=0 --session-save-redis-password=""```
		- ```cache-backend=redis```
		- ```cache-backend-redis-server=redis```
		- ```cache-backend-redis-db=1```
		- ```page-cache=redis```
		- ```page-cache-redis-server=redis```
		- ```page-cache-redis-db=2```
		- ```amqp-host="rabbitmq"```
		- ```amqp-port="5672"```
		- ```amqp-user="guest"```
		- ```amqp-password="guest"```
		- ```amqp-virtualhost="/"```

### Run an already existing Magento project

1) Add existing project
	- Paste your existing Magento project to magento folder

2) Run ```bin/compose/up```

### Create new Vue Storefront 2 project with Magento 2 GraphQL integration

1) Run ```bin/new-project/vsf```
 	- Select Magento 2 integration
	- Running this command will install Vue Storefront 2 project to nuxt folder and start development server on http://nuxt.magento.local
		- You can start VSF 2 with ```bin/node yarn dev```
		- VSF 2 documentation https://docs.vuestorefront.io/v2/

### Configure Nginx and Magento logs to be viewed in Kibana

1) Go to http://kibana.magento.local/app/management/kibana/indexPatterns in your browser
2) If Magento installation was successful, then there should be "You have data in Elasticsearch. Now, create an index pattern." title on the page and "Create index pattern" button. Click on it.

<img src="https://user-images.githubusercontent.com/24256329/126873547-bc92a3fc-bb65-421d-be27-e538b21bf4f5.png" alt="Create index pattern" width="250px">

3) On the next page, write "weblogs-*" into the text input and click on "Next step" button

<img src="https://user-images.githubusercontent.com/24256329/126873590-0c051030-aa5a-42fa-a49f-ebbb85133d3b.png" alt="weblogs-*" width="250px">

4) Select @timestamp from dropdown and click on "Create index pattern" button

<img src="https://user-images.githubusercontent.com/24256329/126874296-5d9cb6e6-2477-4686-b0b4-a8bb0a8fc795.png" alt="@timestamp" width="250px">

5) All done. You should be able to analyse your logs on http://kibana.magento.local/app/discover (if not, then refresh magento.local in order to log something).

<img src="https://user-images.githubusercontent.com/24256329/126874474-54594eb2-3b41-4e24-ba18-528aef0c1859.png" alt="Analyse logs" width="250px">

Kibana should now be configured to display 5 types of logs: nginx error log (```nginx_error```), magento debug log (```magento_debug```), magento exception log (```magento_exception```), magento system log (```magento_system```) and magento reports (```magento_report```). Each log has its own tag (values in brackets), that can be used to filter search results in Kibana - click on "+ Add filter" on the left side and type in the name of the log you want to search in.

<img src="https://user-images.githubusercontent.com/24256329/126874664-a47f924e-84d7-43bb-9275-154b96618f17.png" alt="Filter by tags" width="250px">

### Configure Xdebug

1) Run ```bin/ide/xdebug debug```
	- You can turn off Xdebug by running ```bin/ide/xdebug off``` and turn it on again with ```bin/ide/xdebug debug```, you can also use this command to set all other Xdebug modes (https://xdebug.org/docs/all_settings#mode)
2) PhpStorm should offer you automatic setup after you add breakpoint and make http request (open magento.local in a browser) and correct settings should be similar to this:

Preferences - PHP - Debug

<img src="https://i.ibb.co/BZJ4hjz/phpstorm-2.jpg" alt="Preferences - PHP - Debug" width="250px">

Preferences - PHP - Servers

<img src="https://i.ibb.co/bPK0LYq/phpstorm.png" alt="Preferences - PHP - Servers" width="250px">

## Command Reference

- ``` bin/compose/build ```
	- Build all images for services defined in docker-compose.yml file
		- Accepts service name/s as argument/s in case you want to build one or more specific services
- ``` bin/compose/cleanup ```
	- Stop and remove all containers, images and volumes of the project
- ``` bin/compose/restart ```
	- Restart all services (containers) defined within docker-compose file
		- Accepts service name/s as argument/s in case you want to restart one or more specific services
- ``` bin/compose/up ```
	- Start all services (containers) defined within docker-compose file
		- Accepts service name/s as argument/s in case you want to start one or more specific services
- ``` bin/compose/down ```
	- Stop all services (containers) defined within docker-compose file
		- Accepts service name/s as argument/s in case you want to stop one or more specific services
- ``` bin/compose/variables ```
	- This command is only used by other commands and it provides required variables for them, such as user and group id
- ``` bin/helpers/create-bind-mounted-folders```
	- Stops containers, checks if bind mounted folders specified in docker-compose.yml file exist and creates them if they don't
- ``` bin/helpers/remove-nuxt-folder ```
	- Stops containers and removes nuxt folder
- ``` bin/helpers/remove-magento-folder ```
	- Stops containers and removes Magento folder
- ``` bin/new-project/magento ```
	- Creates new Magento project in Magento folder
- ``` bin/new-project/vsf ```
	- Creates new VSF 2 project in nuxt folder
- ``` bin/composer ```
	- Runs Composer command in magento folder within php-fpm container
- ``` bin/magento ```
	- Runs magento command in magento folder within php-fpm containe
- ``` bin/mysql ```
	- Runs mysql command within mysql container
- ``` bin/node ```
	- Runs supplied command within node container
- ``` bin/xdebug ```
	- Sets xdebug.mode to php.ini within php-fpm container and restarts it

## Troubleshooting

- If elasticsearch container randomly stops working, then it is probably running out of RAM. Allocate more RAM to Docker Desktop and/or increase Xmx2g value specified in elasticsearch service configuration in docker-compose.yml and restart the container
- You might encounter permission issues if you manually delete one of bind mounted folders, because docker will automatically recreate them with root permissions, which means, that your containers won't have write access to them, because all containers are running in rootless mode.
- If filebeat container stops with the error below, then remove the container (or run bin/compose/cleanup to remove all containers and images) and run bin/helpers/fix-filebeat-permissions and then bin/compose/up
  - ```Exiting: error loading config file: config file ("filebeat.yml") can only be writable by the owner but the permissions are "-rw-rw-r--" (to fix the permissions use: 'chmod go-w /usr/share/filebeat/filebeat.yml')```
