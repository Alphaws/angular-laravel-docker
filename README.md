# Angular - Laravel - Docker

A simple starter-kit for laravel-angular applications. 

## Getting started

Install [Docker](https://docs.docker.com/engine/install/) and [Docker Compose](https://docs.docker.com/compose/install/)

Launch [Traefik](https://doc.traefik.io/traefik/getting-started/quick-start/) With the Docker Provider

Use [Alphaws/traefik](https://github.com/Alphaws/traeefik)

```shell
cd {project_dir}
git clone git@github.com:Alphaws/angular-laravel-docker.git .
cp .env.example .env
git clone {backend-repo-url} backend
git clone {frontend-repo-url} frontend
```

Edit .env


docker compose exec backend composer install
docker compose exec backend npm install
docker compose exec backend npm run build


Edit ./.env FRONTEND_HOST and BACKEND_HOST
Edit ./backend/.env and update APP_URL to https://ald-backend.localhost

Open [Backend](https://ald-backend.localhost) and [Frontend](https://ald.localhost/) 

![](./doc/backend.png)

![](./doc/frontend.png)

Thanks

 @todo: Auto sync .env HOSTs and URLs 
