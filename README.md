# Google Cloud Firestore Emulator

A [Google Cloud Firestore Emulator](https://cloud.google.com/sdk/gcloud/reference/beta/emulators/firestore/) container image. The image is meant to be used for creating an standalone emulator for testing.

## Connect application with the emulator

The following environment variables need to be set so your application connects to the emulator instead of the production Cloud Firestore environment:

- `FIRESTORE_EMULATOR_HOST=localhost:8082`

## Starting an emulator with docker

```sh
docker run -p 8082:8082 groovex/firestore-emulator:latest
```

## Creating a Firestore emulator with Circle CI

The easiest way to create an emulator with this image is by using Circle CI. The following snippet can be used as a `.circle/config.yml` for a firestore emulator:

```YAML
version: "2"

jobs:
  build:
    docker:
    - image: groovex/firestore-emulator
```
