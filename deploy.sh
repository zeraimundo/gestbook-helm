#!/bin/bash

VALUES_REDIS=$1

VALUES_GUESTBOOK=$2


if [ -z "$VALUES_REDIS" ]; then
	VALUES_REDIS="redis/values.yaml"
fi

if [ -z "$VALUES_GUESTBOOK" ]; then
	VALUES_GUESTBOOK="guestbook/values.yaml"
fi


helm dependency build redis/

helm install redis redis/ --values $VALUES_REDIS

if [ "$?" -eq 0 ];
then
	sleep 5

	while true
	do
        	OK_FLAG=1

        	for status in $(kubectl get pods | sed '1d' | tr -s ' ' | cut -d ' ' -f 3);
        	do
                	if [ "$status" != "Running" ]
                	then
                        	OK_FLAG=0
				break
                	fi
        	done

        	if [ "$OK_FLAG" -eq 1 ]
        	then
			helm install guestbook guestbook/ --values $VALUES_GUESTBOOK
			break
        	fi
	done
fi

