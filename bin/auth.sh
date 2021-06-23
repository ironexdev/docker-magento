if [ -z "$1" ]
  then
    echo "Public key argument not specified"
    exit 1
fi

if [ -z "$2" ]
  then
    echo "Private key argument not specified"
    exit 1
fi

echo '{ "http-basic": { "repo.magento.com": { "username": "$1", "password": "$2" } } }' > auth.json
