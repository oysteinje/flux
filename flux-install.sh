#!/usr/bin/env bash

CONTEXT=$(kubectl config current-context)
GITHUB_USER=oysteinje
GITHUB_REPOSITORY=flux
GITHUB_BRANCH=main
GITHUB_PATH=./clusters/aks-qbits

read -p "Install Flux in $CONTEXT? (y/n)" yn

case $yn in
	yes ) echo Intalling flux. . . ;;
	no ) echo exiting...;
		exit;;
	* ) echo invalid response;
		exit 1;;
esac

flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=$GITHUB_REPOSITORY \
  --branch=$GITHUB_BRANCH \
  --path=$GITHUB_PATH \
  --personal
