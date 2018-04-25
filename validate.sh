#!/bin/bash

# Prompt for box to validate if not supplied on the command line
if [ "$#" -eq 0 ]
then
  echo "Select a basebox definition to validate:"
  . ./select-basebox.sh
else
  BOX=$1
fi

echo "Validating $BOX.json"

# Validate the configuration
packer validate -var-file=$BOX.json centos.json
