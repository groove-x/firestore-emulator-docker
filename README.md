# Google Cloud Datastore Emulator

A [Google Cloud Datastore Emulator](https://cloud.google.com/datastore/docs/tools/datastore-emulator/) container image. The image is meant to be used for creating an standalone emulator for testing.

## Connect application with the emulator

The following environment variables need to be set so your application connects to the emulator instead of the production Cloud Datastore environment:

- `DATASTORE_EMULATOR_HOST=localhost:8081`
- `DATASTORE_PROJECT_ID=emulator`

## Starting an emulator with docker

```sh
docker run -p 8081:8081 groovex/datastore-emulator:latest
```

## Creating a Datastore emulator with Circle CI

The easiest way to create an emulator with this image is by using Circle CI. The following snippet can be used as a `.circle/config.yml` for a datastore emulator:

```YAML
version: "2"

jobs:
  build:
    docker:
    - image: groovex/datastore-emulator
```
