# docker-stubby
A Dockerfile for [getdns](https://github.com/getdnsapi/getdns) [stubby](https://github.com/getdnsapi/stubby) based on Alpine Linux.

No customization. No tweaks. Just stubby with a default config.

## Build
Clone the repo.
```
git clone https://github.com/mill1000/docker-stubby
```

Populate submodules.
```
git submodule update --init --recursive
```

Build the image.
```
docker build -t stubby:latest .
```

## Deploy
Here's an example Docker Compose.
```
services:
  stubby:
    image: stubby:latest
    container_name: stubby
    restart: unless-stopped
    network_mode: host
    volumes:
      - ./stubby/stubby.yml:/usr/local/etc/stubby/stubby.yml
```