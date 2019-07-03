#!/bin/bash
[ -z "${GITHUB_PAT}" ] && exit 0
echo "Environment variables:"
echo "  PATH: ${PATH}"
echo "  TRAVIS_BRANCH: ${TRAVIS_BRANCH}"
echo "  TRAVIS_PULL_REQUEST: ${TRAVIS_PULL_REQUEST}"
echo "  TRAVIS_PULL_REQUEST_BRANCH: ${TRAVIS_PULL_REQUEST_BRANCH}"
if [[ "${TRAVIS_BRANCH}" == "master" && "${TRAVIS_PULL_REQUEST}" == "false" ]]
then
  echo "Deploying to binder."
  git config --global user.email "will.landau@gmail.com"
  git config --global user.name "wlandau"
  git clone -b binder https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git binder
  cd binder
  shopt -s extglob
  rm -r !(.git)
  cp -r ../inst/notebooks/* ./
  git add --all *
  git commit -m "Update binder workspace" || true
  git push -q origin binder
fi
