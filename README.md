# docker-stubby
A Dockerfile for [getdns](https://github.com/getdnsapi/getdns) [stubby](https://github.com/getdnsapi/stubby) based on Alpine Linux.

No customization. No tweaks. Just stubby with a default config.

## Building
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