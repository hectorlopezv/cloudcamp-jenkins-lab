#!/bin/bash
# ./git-clone.sh user token pathrepo
export GITHUB_USER=$1
export GITHUB_TOKEN=$2
export GITHUB_REPOSITORY=$3
git clone https://${GITHUB_USER}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}