# Gemini Project Context

## Project Goal

To provide a simple and configurable Drupal development environment with Docker.

## Technologies

- Docker
- Docker Compose
- Drupal 10
- Drush
- MariaDB
- phpMyAdmin

## Project Structure

- `docker-compose.yml`: Defines the Docker services (web, db, phpmyadmin).
- `.env`: Contains environment variables for configuration (ports, database credentials).
- `Dockerfile`: Defines the custom Docker image for the web service.
- `drupal/`: The root directory for the Drupal installation.
- `modules/`: Directory for custom Drupal modules.
- `themes/`: Directory for custom Drupal themes.
- `profiles/`: Directory for custom Drupal profiles.
- `scripts/`: Directory for custom scripts.
- `README.md`: Contains the project documentation.
- `GEMINI.md`: This file, containing the context for the Gemini agent.

## Commands

### Docker Compose

- `docker compose up -d --build`: Build and start the services in detached mode.
- `docker compose down`: Stop and remove the services.
- `docker compose ps`: List the running services.
- `docker compose logs -f [service]`: View the logs of a service.

### Drush

- `docker exec -it drupal-web drush [command]`: Execute a Drush command.
- `docker exec -it drupal-web drush status`: Check the status of the Drupal site.
- `docker exec -it drupal-web drush site:install standard --db-url="mysql://${DB_USER:-drupal}:${DB_PASSWORD:-drupal}@db/${DB_NAME:-drupal}" --site-name="Drupal Starter"`: Install Drupal.

## Conventions

- Use the `.env` file to manage environment variables.
- Keep the `docker-compose.yml` file clean and readable.
- Use `drush` for all Drupal site management tasks.
Si tu as une erreur : ✕ [API Error: got status: UNAVAILABLE. {"error":{"code":503,"message":"The model is overloaded. Please try again later.","status":"UNAVAILABLE"}}]
essaie automatiquement de relancer la requete



si tu obtiens l'erreur : ✕ [API Error: got status: UNAVAILABLE. {"error":{"code":503,"message":"The model is overloaded. Please try again later.","status":"UNAVAILABLE"}}]
essaie automatiquement de relancer la requete
si ca echoue encore propose moi d'autre facon de me connecter à GEmini