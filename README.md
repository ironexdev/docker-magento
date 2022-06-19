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
```Elastic Search```,

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
	- 127.0.0.1 frontend.magento.local
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

### Create new Nuxt project with Magento 2 GraphQL integration

1) Run ```bin/new-project/nuxt```
 	- Select Magento 2 integration
	- Running this command will install Nuxt project to nuxt folder and start development server on http://frontend.magento.local
		- You can start Nuxt with ```bin/node yarn dev```

### Configure Xdebug

1) Run ```bin/xdebug/mode debug```
	- You can turn off Xdebug by running ```bin/ide/xdebug off``` and turn it on again with ```bin/ide/xdebug debug```, you can also use this command to set all other Xdebug modes (https://xdebug.org/docs/all_settings#mode)
2) PhpStorm should offer you automatic setup after you add breakpoint and make http request (open magento.local in a browser) and correct settings should be similar to this:

Preferences - PHP - Debug

<img src="https://i.ibb.co/BZJ4hjz/phpstorm-2.jpg" alt="Preferences - PHP - Debug" width="250px">

Preferences - PHP - Servers

<img src="https://i.ibb.co/bPK0LYq/phpstorm.png" alt="Preferences - PHP - Servers" width="250px">

### Xdebug CLI

1) Add breakpoints (via IDE)

2) RUN ```bin/xdebug/cli <FILE_PATH> <SERVER_NAME=magento.local>```
   - It is relative to magento folder, run ```bin/xdebug/cli pub/index.php``` to debug ```magento/pub/index.php``` 
   - SERVER_NAME is optional

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
- ``` bin/mysql $@ ```
    - Runs mysql command within mysql container
- ``` bin/node $@ ```
    - Runs supplied command within node container
- ```bin/run/<service name> $@```
    - Runs supplied command within specified container (service)
- ``` bin/xdebug/mode <MODE> ```
    - Sets xdebug.mode to php.ini within php-fpm container and restarts it
- ``` bin/xdebug/cli<FILE_PATH> <SERVER_NAME=magento.local> ```
    - Runs specified script (FILE_PATH) and then stops at defined breakpoint (via IDE) 
    - It is relative to magento folder, run ```bin/xdebug/cli pub/index.php``` to debug ```magento/pub/index.php``` 
    - SERVER_NAME is optional

## Troubleshooting

- If elasticsearch container randomly stops working, then it is probably running out of RAM. Allocate more RAM to Docker Desktop and/or increase Xmx2g value specified in elasticsearch service configuration in docker-compose.yml and restart the container
- You might encounter permission issues if you manually delete one of bind mounted folders, because docker will automatically recreate them with root permissions, which means, that your containers won't have write access to them, because all containers are running in rootless mode.

## Known Issues
- App built with yarn dev in Docker keeps reloading
  - https://github.com/nuxt/vite/issues/172
