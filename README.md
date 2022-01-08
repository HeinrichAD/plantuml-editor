# PlantUML Editor

> A Vue.js, Vuex project

![PlantUML Editor Icon](public/static/favicon-60.png)　PlantUML online demo client

![PlantUML Editor](public/static/capture1_20170809.png)

![workflow status](https://github.com/HeinrichAD/plantuml-editor/actions/workflows/main.yml/badge.svg)
[![docker pulls](https://img.shields.io/docker/pulls/heinrichad/plantuml-editor.svg)](https://hub.docker.com/r/heinrichad/plantuml-editor)
[![Netlify Status](https://api.netlify.com/api/v1/badges/0e9c5e9a-b38a-483f-887d-18e4927af717/deploy-status)](https://app.netlify.com/sites/plantuml-editor/deploys)

## About this Fork

### `master` Branch

The `master` branch should be as far as possible always identical with the original repository [kkeisuke/plantuml-editor](https://github.com/kkeisuke/plantuml-editor).
The GitHub App [Pull](https://github.com/apps/pull) is used exactly for this purpose.
It regularly checks for changes in the original repository and transfers them to this `master` branch.
If you want to start the synchronization manually, you can do this via the following URL: https://pull.git.ci/process/HeinrichAD/plantuml-editor

The only change from the original state is that it has been dockerized and given an GitHub workflow so that future changes are automatically pushed to Docker Hub.

### `develop` Branch

The `develop` branch contains additional features and changes that unfortunately did not make it into the original repository.

If possible, the `develop` branch is also automatically updated by the GitHub App [Pull](https://github.com/apps/pull) via a rebase, so that the base is always the same.
If this is not possible without merge conflicts, an appropriate pull request is created.

#### Additional Features

- dockerized on [Docker Hub](https://hub.docker.com/r/heinrichad/plantuml-editor)
- add relative path (URL) support \[[PR#1](https://github.com/HeinrichAD/plantuml-editor/pull/1)\]
- update URLs to use https \[[PR#2](https://github.com/HeinrichAD/plantuml-editor/pull/2)\]
- refactor environment variables \[[PR#3](https://github.com/HeinrichAD/plantuml-editor/pull/3)\]
- add further diagram support \[[PR#4](https://github.com/HeinrichAD/plantuml-editor/pull/4)\]
  * [json](https://plantuml.com/json)
  * [latex](https://plantuml.com/ascii-math)
  * [math](https://plantuml.com/ascii-math)
  * [salt](https://plantuml.com/salt)
  * [yaml](https://plantuml.com/yaml)

## Features

- multiple PlantUML templates
- cheat sheet
- snippet
- zoom & scroll
- supports SVG & PNG
- save texts
- create gists
- support markdown
- download image
- print HTML

## Build Setup

### Manual

```bash
# install dependencies
npm install

# install flow-typed
npm run flow-typed

# serve with hot reload at localhost:8080
npm run serve

# build for production with minification
npm run build

# run unit tests
npm run test:unit

# run e2e tests
npm run test:e2e
```

### Docker

```bash
# build with docker
docker build -t plantuml-editor .

# run plantuml-editor server with docker
docker run -d -p 8080:80 \
       --name plantuml-editor \
       --env VUE_APP_URL=http://localhost:8080 \
       --env VUE_APP_CDN=http://localhost:4000 \
       plantuml-editor
```

### Docker Compose

1. Update environment variables in `docker-compose.yml`.
1. `docker-compose up -d [--build]`

## For development

### [PlantUML Server with Docker](https://hub.docker.com/r/plantuml/plantuml-server/)

```bash
docker run -d -p 4000:8080 plantuml/plantuml-server:jetty
```

> **Notice:** The specification of the port number follows `.env.development`

### [Kroki with Docker](https://hub.docker.com/r/yuzutech/kroki) as alternative to PlantUML Server:

```
docker run -d -p 4000:8000 yuzutech/kroki
```

> **Notice:** Kroki uses for PlantUML the relative path `plantuml`.
> `VUE_APP_CDN` in `.env.development` would in this case be for example: `VUE_APP_CDN="http://localhost:4000/plantuml"`

> **Notice:** Kroki does not support `@startlatex` and `@startmath`.

## Other

Pen graphic by [freepik](https://www.flaticon.com/authors/freepik) from [Flaticon](https://www.flaticon.com) is licensed under [CC BY 3.0](https://creativecommons.org/licenses/by/3.0/). Check out the new logo that I created on [LogoMaker.com](https://logomakr.com) https://logomakr.com/7Gn1Ck
