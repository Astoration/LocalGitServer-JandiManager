#!/bin/bash
REPO_NAME=$1
if [ -z "$REPO_NAME" ] ; then
	echo "REPO NAME is not exit; please argument Repository name : $ ./createRepo [REPOSITORY_NAME]"
	exit 1
fi
REPO_PATH=/home/git/$REPO_NAME.git
mkdir $REPO_PATH
echo "repository inited : ${REPO_PATH}"
cd $REPO_PATH
git init --bare
JANDI_REF=$2
if [ ! -z "$JANDI_REF" -a "$JANDI_REF" != " " ] ; then
	cp ../jandi-hook $REPO_PATH/hooks/post-receive
	echo $JANDI_REF
	echo $JANDI_REF > ./jandi.config
fi
