# Docker Magento 

```Rootless containers```,
```Docker```,
```Magento```,
```Nginx```,
```MySQL```,
```PHP-FPM```,
```Adminer```,
```Redis```,
```Redis Admin```,
```RabbitMQ```,
```Elastic Search```,
```Kibana```

## Setup

__1) Add following to etc/hosts__
- 127.0.0.1	magento.local
- 127.0.0.1	kibana.magento.local
- 127.0.0.1	redis.magento.local
- 127.0.0.1	rabbitmq.magento.local
- 127.0.0.1	adminer.magento.local

__2) Start Docker__

- ```sh bin/start.sh```
	- Accepts additional arguments (--build <container>)

__3) Create new or add existing Magento project__

- Create new project
	- ```sh bin/new-project.sh```
		- Keys can be found in https://marketplace.magento.com/customer/accessKeys/

- Add existing project
	- Paste your existing Magento project to magento folder  

__4) Install Magento__

- ```sh bin/install.sh```

__5) Setup Xdebug in IDE__

- PhpStorm should offer you automatic setup after you add breakpoint and make http request (open magento.local in a browser) and correct settings should be similar to this:

Preferences - PHP - Debug

![Preferences - PHP - Debug](https://i.ibb.co/BZJ4hjz/phpstorm-2.jpg "Preferences - PHP - Debug")

Preferences - PHP - Servers

![Preferences - PHP - Servers](https://i.ibb.co/GVqfVs5/phpstorm.jpg "Preferences - PHP - Servers")


