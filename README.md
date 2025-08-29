# Drupal Starter

## Description

Ce projet est un environnement de développement pour Drupal basé sur Docker.
Il est composé des services suivants :
- Un serveur web Apache avec PHP pour Drupal
- Une base de données MariaDB
- phpMyAdmin pour gérer la base de données
- Outils de développement : Xdebug, PHPCS, PHPStan

## Prérequis

- Docker
- Docker Compose
- Composer

## Installation

1.  Clonez le projet.
2.  Copiez le fichier `.env.example` en `.env` et modifiez les variables si nécessaire.
3.  Installez les dépendances de Drupal avec Composer :
    ```bash
    composer create-project drupal/recommended-project:^10 drupal --no-interaction
    ```
4.  Lancez les conteneurs Docker :
    ```bash
    docker compose up -d --build
    ```
5.  Installez Drupal via Drush.
    ```bash
    docker exec drupal-web drush site:install standard --db-url="mysql://${DB_USER:-drupal}:${DB_PASSWORD:-drupal}@db/${DB_NAME:-drupal}" --site-name="Drupal Starter" -y
    ```

## Configuration

Vous pouvez modifier les ports exposés par les services en modifiant les variables d'environnement dans le fichier `.env` :

- `DRUPAL_PORT` : Le port pour accéder à Drupal (par défaut : 8080)
- `PMA_PORT` : Le port pour accéder à phpMyAdmin (par défaut : 8081)

## Usage

- Drupal est accessible à l'adresse [http://localhost:${DRUPAL_PORT}](http://localhost:${DRUPAL_PORT})
- phpMyAdmin est accessible à l'adresse [http://localhost:${PMA_PORT}](http://localhost:${PMA_PORT})

## Outils

### Xdebug

Xdebug est configuré pour se connecter à l'hôte sur le port 9003.
Vous pouvez utiliser l'extension "PHP Debug" pour VSCode.

### PHP CodeSniffer

Pour utiliser PHPCS, exécutez la commande suivante :
```bash
docker exec drupal-web phpcs --standard=Drupal /var/www/html/modules/custom
```

### PHPStan

Pour utiliser PHPStan, exécutez la commande suivante :
```bash
docker exec drupal-web phpstan analyse /var/www/html/modules/custom
```