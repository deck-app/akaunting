# Akaunting Docker 

## Description

This repository defines how the official Akaunting images are built for Docker Hub.

Akaunting is online, open source and free accounting software built with modern technologies. Track your income and expenses with ease. For more information on Akaunting, please visit the [website](https://akaunting.com).

## Prerequisites

1. docker-compose, or the knowhow to use docker or podman to run these images.

## Usage

```shell
git clone https://github.com/deck-app/akaunting.git
cd akaunting
docker-compose up -d
```

## A note on upgrades

The upgrade between 2.0.26 and 2.1.0 broke some things in existing deployments due to a Laravel version migration in Akaunting. In order to fix this, you could have run something like the following:

```shell
docker exec -it akaunting bash
```

Then, inside the container, the following:

```shell
php artisan view:clear
```

Future version migrations might require something like:

```shell
php artisan migrate --force
```

Application upgrade/migration logic is not baked into this application image. An upgrade between versions that requires intervention would best be encapsulated in something like a [Kubernetes Operator](https://kubernetes.io/docs/concepts/extend-kubernetes/operator/), rather than adding to the complexity of the application image.

If you use these images in production, it is recommended to have a testing environment that draws automatic updates and exists so that you can validate the steps required to migrate between versions. Your production deployment should use pinned version tags, which are tagged based on the Akaunting release. Migrating your production version would then require manual intervention and enable you to take the manual steps necessary to complete the migration.

## License

Akaunting is released under the [GPLv3 license](LICENSE.txt).
