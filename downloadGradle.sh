#!/bin/bash

for GRADLE_VERSION in "$@"
do
    ./gradlew wrapper --no-daemon --gradle-version ${GRADLE_VERSION}
    ./gradlew --no-daemon -v
done
