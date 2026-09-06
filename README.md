# Sprouty website

Static Sprouty website served by a hardened, unprivileged Nginx container.

## Run with Docker

```sh
docker compose up -d --build
```

Open `http://localhost:8080` and check the container with:

```sh
docker compose ps
curl --fail http://localhost:8080/healthz
```

Use another host port or a versioned image tag when needed:

```sh
HTTP_PORT=8090 IMAGE_TAG=2026-09-06 docker compose up -d --build
```

## Production deployment

1. Point the DNS records for `sprouty.store` at the production server or load balancer.
2. Clone this repository and run `docker compose up -d --build`.
3. Put an HTTPS reverse proxy or managed load balancer in front of container port 8080 and enable automatic TLS certificate renewal.
4. Expose only ports 80 and 443 publicly. Bind the application to loopback when using a host-level proxy:

```sh
HTTP_PORT=127.0.0.1:8080 docker compose up -d --build
```

5. Verify `https://sprouty.store/`, `/moong.html`, and `/healthz` after deployment.

Stop the service with `docker compose down`.
