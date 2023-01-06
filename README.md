# Frodux.in

Over-arching infra for frodux.in and related sites

## Ingress Cert Stuff

- https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nginx-ingress-with-cert-manager-on-digitalocean-kubernetes

## Infrastructure Available

### kubernetes

AKS with Nginx fetching certs via certbot.

### Redis

Azure Cache for Redis, the lowest tier serving up databases.

### Postgres

Azure PostgreSQL Flexible Server, the lowest tier serving up databases.

### Blob Storage

Azure Blob Storage with containers for sites, CORS available for static webstuff hosting.
