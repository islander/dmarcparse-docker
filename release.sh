#!/bin/bash

######################
#  bash strict mode  #
######################
set -euo pipefail
#set -x  # uncomment for debug output

USERNAME=kiba
IMAGE=dmarcparse

# ensure we're up to date
git pull
# bump version
docker run --rm -v "$PWD":/app treeder/bump "$(git log -1 --pretty=%B)"
VERSION=`cat VERSION`
echo "version: $VERSION"
# run build
./build.sh
# tag it
git add -A
git commit -m "version $VERSION"
git tag -a "$VERSION" -m "version $VERSION"
git push
git push --tags
docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$VERSION
# push it
docker push $USERNAME/$IMAGE:latest
docker push $USERNAME/$IMAGE:$VERSION
