#!/bin/bash

echo  "Are you sure you'd like to fully deploy to Git? [y/n]"
read input -n

if [[ $input =~ ^[Yy]$ ]] # Takes either y or Y in
then
	git add .
	git add -u
	read -r -p 'commit message: ' msg 
	git commit -m "$msg"
	git push origin $branch

elif [[ $input =~ ^[Nn$ ]]
then
	 exit 1
else
	echo "Invalid input. Please try again."
	read input -n 1 -r
fi
