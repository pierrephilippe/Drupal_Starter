# Drupal Starter

This project provides a simple and configurable Drupal 10 development environment with Docker and Docker Compose.

## Prerequisites

- Docker Desktop (or Docker Engine and Docker Compose)

## Getting Started

1.  **Clone the repository:**

    ```bash
    git clone <repository_url>
    cd drupal_starter
    ```

2.  **Copy the environment file:**

    ```bash
    cp .env.example .env
    ```

    You can modify the `.env` file to change ports, database credentials, or Xdebug settings.

3.  **Build and start the Docker containers:**

    ```bash
    docker compose up -d --build
    ```

    This will build the `web` service image and start all defined services (web, db, phpmyadmin).

4.  **Install Drupal 10 via Composer:**

    Once the containers are up, execute the following command to install Drupal 10:

    ```bash
    docker exec -it drupal-web composer create-project drupal/recommended-project:^10.0 /var/www/html --no-interaction
    ```

    This will download and set up Drupal in the `drupal/` directory.

5.  **Install Drupal site:**

    ```bash
    docker exec -it drupal-web drush site:install standard --db-url="mysql://${DB_USER:-drupal}:${DB_PASSWORD:-drupal}@db/${DB_NAME:-drupal}" --site-name="Drupal Starter" --account-name=admin --account-pass=admin -y
    ```

    *Note: The database credentials are read from the `.env` file. Default admin username is `admin` and password is `admin`.*

6.  **Access Drupal:**

    Open your web browser and navigate to `http://localhost:${WEB_PORT:-8080}` (default: `http://localhost:8080`).

7.  **Access phpMyAdmin:**

    Open your web browser and navigate to `http://localhost:${PHPMYADMIN_PORT:-8081}` (default: `http://localhost:8081`).

## Development Tools

The `web` container includes the following PHP development tools:

-   **Xdebug:** For debugging PHP applications. Configured to connect to `host.docker.internal` on port `9003`.
-   **PHPStan:** For static analysis.
-   **PHP-CS-Fixer:** For PHP code style fixing.

## Useful Drush Commands

-   **Check Drupal status:**

    ```bash
    docker exec -it drupal-web drush status
    ```

-   **Clear caches:**

    ```bash
    docker exec -it drupal-web drush cr
    ```

-   **Run database updates:**

    ```bash
    docker exec -it drupal-web drush updb
    ```

## Troubleshooting

-   If you encounter issues, try bringing down the containers and rebuilding:

    ```bash
    docker compose down
    docker compose up -d --build
    ```

-   Check container logs for errors:

    ```bash
    docker compose logs -f web
    docker compose logs -f db
    ```
