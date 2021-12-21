[![Docker Image CI](https://github.com/teawithfruit/js-polyfill/actions/workflows/docker-image.yml/badge.svg)](https://github.com/teawithfruit/js-polyfill/actions/workflows/docker-image.yml)

# js-polyfill
This is a docker container setup based on [Financial-Times/polyfill-service](https://github.com/Financial-Times/polyfill-service).
# Run
## With docker
```
docker run --name js-polyfill -p 8801:8801 -d teawithfruit/js-polyfill:latest
```
## With docker-compose
```
git clone https://github.com/teawithfruit/js-polyfill.git
docker-compose up -d
```
## Docker HUB
[https://hub.docker.com/r/teawithfruit/js-polyfill](https://hub.docker.com/r/teawithfruit/js-polyfill)
