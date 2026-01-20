# creative-k8s

## PROD

create .env file from .env.example

```
docker compose -f docker-compose.yaml build
docker compose -f docker-compose.yaml -p sc22 up -d
```

#### do once

```
docker compose -f docker-compose.yaml -p sc22 exec -u www-data sc_php php artisan migrate --graceful --ansi
docker compose -f docker-compose.yaml -p sc22 exec -u www-data sc_php php artisan config:cache
docker compose -f docker-compose.yaml -p sc22 exec -u www-data sc_php php artisan route:cache
docker compose -f docker-compose.yaml -p sc22 exec -u www-data sc_php php artisan view:cache
```

# for DEV

create .env file from .env.example

next do this localy

```
cd php-world
npm install
npm run build
```

then use docker-compose-dev.yaml file to mount your locals dirs, but dont forget if u add new one

```
docker compose -f docker-compose-dev.yaml build

docker compose -f docker-compose-dev.yaml -p sc13 up -d
```

use --no-cache if u need

#### do migration once

```
docker compose -f docker-compose-dev.yaml -p sc13 exec -u www-data sc_php php artisan migrate --graceful --ansi
```

#### use this if u need

```
docker compose -f docker-compose-dev.yaml -p sc13 exec -u www-data sc_php php artisan config:cache
docker compose -f docker-compose-dev.yaml -p sc13 exec -u www-data sc_php php artisan route:cache
docker compose -f docker-compose-dev.yaml -p sc13 exec -u www-data sc_php php artisan view:cache
```

```
docker compose -f docker-compose-dev.yaml -p sc13 exec -u www-data sc_php php artisan config:clear
docker compose -f docker-compose-dev.yaml -p sc13 exec -u www-data sc_php php artisan route:clear
docker compose -f docker-compose-dev.yaml -p sc13 exec -u www-data sc_php php artisan view:clear
```

dont do this, put APP_KEY= nj .env

```
docker compose -f docker-compose-dev.yaml -p sc13 exec -u www-data sc_php php artisan key:generate --ansi
```

## check yaml

```
docker compose -f docker-compose-dev.yaml -p sc13 -f docker/docker-compose-dev.yaml config
```

#### artisan stub for docker

```
docker compose -f docker-compose-dev.yaml -p sc13 exec -u www-data sc_php php artisan 
docker compose -f docker-compose-dev.yaml -p sc22 exec -u www-data sc_php php artisan 
```

#### DEBUG

```
docker compose -f docker-compose-dev.yaml -p sc13 exec sc_php php artisan tinker
docker compose -f docker-compose-dev.yaml -p sc13 exec sc_php php -r 'echo "hi\n";'
docker compose -f docker-compose-dev.yaml -p sc13 exec sc_php ls -la /app/storage /app/storage/logs
docker compose -f docker-compose-dev.yaml -p sc13 exec sc_php ls -la /app
```

#### a way to add new submodule

```
git submodule add git@github.com:WitalijKaa/special-creativity.git php-world
git submodule add git@github.com:WitalijKaa/special-creativity-ai.git llm
```
