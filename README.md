# Stack e-nnov.fr

## Configuration du serveur

Exécuter les commandes suivantes (en sudo) : 

```bash
echo -e "net.ipv6.conf.all.disable_ipv6 = 1\nnet.ipv6.conf.default.disable_ipv6 = 1" > /etc/sysctl.d/disable-ipv6.conf
echo "vm.swappiness=40" > /etc/sysctl.d/swappiness.conf
```

Créer un fichier de swap https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-20-04-fr

## Restauration

### MariaDB
```bash
docker exec -i $(docker ps -q -f name=mariadb.1) sh -c "exec mariadb -uroot -pXXX metabase" < metabase.sql
```

### MongoDB

```bash
tar -C DbName -xf mongodb-2024-06-28-00-02-06.tar.gz
```

## Créer un utilisateur MongoDB

```javascript
use test
db.createUser(
  {
    user: "myTester",
    pwd:  passwordPrompt(),   // or cleartext password
    roles: [ { role: "readWrite", db: "test" },
             { role: "read", db: "reporting" } ]
  }
)
```

## Déploiement en local

Prérequis : Docker doit être installé sur la machine en mode swarm.

Créer le fichier .env et coller le contenu suivant et modifier les valeurs des variables :

    # DB
    MARIADB_ROOT_PASSWORD=secret
    MONGODB_ROOT_USERNAME=root
    MONGODB_ROOT_PASSWORD=secret

    # Metabase
    METABASE_DB_NAME=metabase
    METABASE_DB_USERNAME=metabase
    METABASE_DB_PASSWORD=secret
    METABASE_EMAIL_FROM_ADDRESS=
    METABASE_EMAIL_FROM_NAME=
    METABASE_EMAIL_SMTP_HOST=
    METABASE_EMAIL_SMTP_PORT=
    METABASE_EMAIL_SMTP_SECURITY=
    METABASE_EMAIL_SMTP_USERNAME=
    METABASE_EMAIL_SMTP_PASSWORD=

    # RabbitMQ
    RABBITMQ_DEFAULT_USER=rabbitmq
    RABBITMQ_DEFAULT_PASSWORD=changeme

    # Traefik
    ACME_EMAIL=XXX

Ensuite, via WSL ou un terminal bash, exécuter le script **deploy_local.sh**