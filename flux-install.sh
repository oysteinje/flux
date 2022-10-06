#!/usr/bin/env bash

CONTEXT=$(kubectl config current-context)

read -p "Install Flux in $CONTEXT?" yn

case $yn in
	yes ) echo Intalling flux. . . ;;
	no ) echo exiting...;
		exit;;
	* ) echo invalid response;
		exit 1;;
esac

echo doing stuff...
helm repo add fluxcd https://charts.fluxcd.io

helm upgrade -i flux fluxcd/flux \
--namespace fluxcd \
--set git.url=git@github.com:oysteinje/flux \
--set git.branch=main \
--set git.path=infrastructure/aks-qbits/
