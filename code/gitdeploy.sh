#!/bin/bash

echo  "Are you sure you'd like to fully deploy to Git? [y/n]"
read input
if [[ $input =~ ^[Yy]$ ]] # Accepting answer regardless of case, but limited to a one character input. ^ represents the beginning of a line, $ represents the end. 
then
	echo "Deploying..."
	git add -A # Adds all files in folder to the repo including removing any deletions
	read -r -p 'Enter your commit message: ' msg 
	git commit -m "$msg"
	git push origin $branch
	git status # Shows us the final status after deployment
elif [[ $input =~ ^[Nn]$ ]]
then
	echo "Deployment cancelled. Exiting..."
	exit 1
else
	echo "Invalid input. Exiting..."
	exit 1
fi
