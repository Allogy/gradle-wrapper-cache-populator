#!/bin/bash

for GRADLE_VERSION in "$@"
do
    ./gradlew wrapper --gradle-version ${GRADLE_VERSION}
    ./gradlew -v
done
