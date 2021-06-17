# Docker Magento

## Setup

__1) Add 127.0.0.1 magento.local to etc/hosts file__

__2) Create new or add existing Magento project__

- Create new project
	- ```make new-project PUBLIC_KEY={{ public key }} PRIVATE_KEY={{ private key }}```
		- Keys can be found in https://marketplace.magento.com/customer/accessKeys/
		- This will generate new gitignored auth.json file with credentials to repo.magento.com
			- For auth.json file to work, the composer.json (already added) is needed in project root

- Add existing project
	- Create new "magento" folder inside project root and paste an existing Magento project to it  
    
__3) Start Docker__

```docker-compose up -d```

__4) Install Magento__

```make install```

__5) Setup Xdebug in IDE__

- PhpStorm should offer you automatic setup and correct settings should be similar to this:

Preferences - PHP - Debug

![Preferences - PHP - Debug](https://i.ibb.co/BZJ4hjz/phpstorm-2.jpg "Preferences - PHP - Debug")

Preferences - PHP - Servers

![Preferences - PHP - Servers](https://i.ibb.co/GVqfVs5/phpstorm.jpg "Preferences - PHP - Servers")


