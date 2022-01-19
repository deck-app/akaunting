## Introduction

[Symfony](https://symfony.com/), is a web application framework written in [PHP](http://www.php.net) under [MIT License](http://symfony.com/doc/current/contributing/code/license.html).

The Bitnami Symfony Development Container has been carefully engineered to provide you and your team with a highly reproducible Symfony development environment. We hope you find the Bitnami Symfony Development Container useful in your quest for world domination. Happy hacking!

[Learn more about Bitnami Development Containers.](https://docs.bitnami.com/containers/how-to/use-bitnami-development-containers/)

## Getting started

The quickest way to get started with the Bitnami Symfony Development Container is using [docker-compose](https://docs.docker.com/compose/).

Begin by creating a directory for your Symfony application:

```console
$ mkdir ~/symfony
$ cd ~/symfony
```

Download the [docker-compose.yml](https://raw.githubusercontent.com/bitnami/bitnami-docker-symfony/master/docker-compose.yml) file in the application directory:

```console
$ git clone https://github.com/deck-app/symfony.git
$ cd symfony
$ docker-compose up -d
```

Set a few environment variables in the `docker-compose.yml`:

```yaml
version: '3'

services:
  symfony:
    image: 'bitnami/symfony:latest'
    ports:
      - '8000:8000'
    volumes:
      - '.:/app'
    environment:
      - SYMFONY_PROJECT_NAME=symfony
      - MARIADB_HOST=mariadb
      - MARIADB_PORT_NUMBER=3306
      - MARIADB_USER=bobby
      - MARIADB_PASSWORD=tables
      - MARIADB_DATABASE=symfony
    depends_on:
      - mariadb
  mariadb:
    image: 'bitnami/mariadb:10.3'
    environment:
      - ALLOW_EMPTY_PASSWORD=yes
      - MARIADB_USER=bobby
      - MARIADB_PASSWORD=tables
      - MARIADB_DATABASE=symfony
```

Finally launch the Symfony application development environment using:

```console
$ docker-compose up
```

The above command creates a container service for Symfony development and bootstraps a new Symfony application, named `symfony` in working directory. You can use your favorite IDE for developing the application.

After the built-in PHP application server has been started, visit http://localhost:8000 in your favorite web browser and you'll be greeted by the Symfony welcome page.

## Executing commands

Commands can be launched inside the `symfony` Symfony Development Container with `docker-compose` using the [exec](https://docs.docker.com/compose/reference/exec/) command.

> **Note**:
>
> The `exec` command was added to `docker-compose` in release [1.7.0](https://github.com/docker/compose/blob/master/CHANGELOG.md#170-2016-04-13). Please ensure that you're using `docker-compose` version `1.7.0` or higher.

The general structure of the `exec` command is:

```console
$ docker-compose exec <service> <command>
```
where `<service>` is the name of the container service as described in the `docker-compose.yml` file and `<command>` is the command you want to launch inside the service.

Following are a few examples:

- Create a new project named `foo`:

  ```console
  $ docker-compose run symfony nami execute symfony createProject foo
  ```

- Create a new project named `bar` which uses Symfony version `2.5.0`

  ```console
  $ docker-compose run symfony nami execute symfony createProject "bar 2.5.0"
  ```

  Note: In the above two examples the `docker-compose.yml` file should be updated so that the `SYMFONY_PROJECT_NAME` specifies the project name that should be served my the PHP application server.

## Issues

If you encountered a problem running this container, you can file an [issue](https://github.com/bitnami/bitnami-docker-symfony/issues/new). For us to provide better support, be sure to include the following information in your issue:

- Host OS and version (`$ uname -a`)
- Docker version (`$ docker version`)
- Docker info (`$ docker info`)
- Docker image version (`$ echo $BITNAMI_IMAGE_VERSION` inside the container)
- Steps to reproduce the issue.

## License

Copyright (c) 2015-2021 Bitnami

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  <http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
