# Docker Magento

## Setup

__1) Add 127.0.0.1 magento.local to etc/hosts__

__2) Store composer credentials to repo.magento.com in project repository__
- ``` make auth PUBLIC_KEY={{ public key }} PRIVATE_KEY={{ private key }}```
	- Creates auth.json
	- Keys can be found in https://marketplace.magento.com/customer/accessKeys/
	- This will generate new gitignored auth.json file with credentials to repo.magento.com
		- For auth.json file to work, the composer.json (already added) is needed in project root

__3) Create new or add existing Magento project__

- Create new project
	- ```make new-project```

- Add existing project
	- Create new "magento" folder inside project root and paste an existing Magento project to it  
    
__4) Start Docker__

```docker-compose up -d```

__5) Install Magento__

```make install```

__6) Setup Xdebug in IDE__

- PhpStorm should offer you automatic setup after you add breakpoint and make http request (open magento.local in a browser) and correct settings should be similar to this:

Preferences - PHP - Debug

![Preferences - PHP - Debug](https://i.ibb.co/BZJ4hjz/phpstorm-2.jpg "Preferences - PHP - Debug")

Preferences - PHP - Servers

![Preferences - PHP - Servers](https://i.ibb.co/GVqfVs5/phpstorm.jpg "Preferences - PHP - Servers")


