#!/bin/sh

set -ex

USERNAME=kiba
IMAGE=dmarcparse

docker build -t $USERNAME/$IMAGE:latest .

