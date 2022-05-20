#!/bin/bash
VALIDATOR=../validator_cli.jar

clear
# check if validator is installed if not install
if test -e "$VALIDATOR"; then
  echo "$VALIDATOR found."
else
  echo "Validator not found. Downloading Validator"
  wget https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar -O $VALIDATOR
fi

# create Output folder if not existing
outputfolder=../val_out/${PWD##*/}
rm -r $outputfolder
mkdir -p $outputfolder
echo 'Outputfolder is' $outputfolder


# load dependencies from sushi-config.yaml
for dependency in `yq -o=props '.dependencies' ./Resources/sushi-config.yaml`;
do
  if [[ ${dependency::1} =~ [a-z] ]]
  then
    echo "Baking FHIR Snapshot of dependency" $dependency "..."
    fhir bake --package $dependency;
  fi


done
# create FHIR Snapshots of dependencies


# run sushi
echo -e "Starting Sushi";
sushi Resources

# iterate of files
for filename in $(find ./Resources/fsh-generated/resources/ -name '*.json');
do
   f="$(basename $filename .json)"
   echo -e "Processing \033[1m $f \033[0m";
   java -jar $VALIDATOR -version 4.0.1 $filename -proxy 192.168.110.10:3128 -output $outputfolder"/$f.html";
done