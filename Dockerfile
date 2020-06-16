# Version. Can change in build progress
ARG GCLOUD_SDK_VERSION=alpine

# Use google cloud sdk
FROM google/cloud-sdk:$GCLOUD_SDK_VERSION
MAINTAINER groove-x

# Install Java 8 for Firestore emulator
RUN apk --update add openjdk8-jre-base
RUN gcloud components install cloud-firestore-emulator beta --quiet

COPY start-firestore .

EXPOSE 8082

ENTRYPOINT ["./start-firestore"]
