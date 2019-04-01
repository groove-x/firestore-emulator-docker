# Google Cloud Datastore Emulator

A [Google Cloud Datastore Emulator](https://cloud.google.com/datastore/docs/tools/datastore-emulator/) container image. The image is meant to be used for creating an standalone emulator for testing.

## Connect application with the emulator

The following environment variables need to be set so your application connects to the emulator instead of the production Cloud Datastore environment:

- `DATASTORE_EMULATOR_HOST=localhost:8081`
- `DATASTORE_PROJECT_ID=emulator`

## Custom commands

This image contains a script named `start-datastore` (included in the PATH). This script is used to initialize the Datastore emulator.

### Starting an emulator

By default, the following command is called:

```sh
start-datastore
```
### Starting an emulator with options

This image comes with the following options: `--no-store-on-disk` and `--consistency`. Check [Datastore Emulator Start](https://cloud.google.com/sdk/gcloud/reference/beta/emulators/datastore/start). `--legacy`, `--data-dir` and `--host-port` are not supported by this image.

```sh
start-datastore --no-store-on-disk --consistency=1.0
```

## Creating a Datastore emulator with Docker Compose

The easiest way to create an emulator with this image is by using [Docker Compose](https://docs.docker.com/compose). The following snippet can be used as a `docker-compose.yml` for a datastore emulator:

```YAML
version: "2"

jobs:
  build:
    docker:
    - image: groovex/datastore-emulator
```
### Persistence

The image has a volume mounted at `/opt/data`. To maintain states between restarts, mount a volume at this location.
