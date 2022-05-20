#!/bin/bash

validatorpath=../validator_cli.jar
outputfolder=../val_out/${PWD##*/}
foldername='./Resources'
file=''
install_dependencies="false"

print_usage() {
  printf "Usage:\n
  [-d foldername] sets foldername for validation. Default is: './Resources'\n
  [-f filename] sets filename for single validation.\n
  [-i] installs dpendencies with firely.terminal from './Resources/sushi-config.yaml' file"
}

while getopts 'd:f:i' flag; do
  case "${flag}" in
    d) foldername="${OPTARG}" ;;
    f) file="${OPTARG}" ;;
    i) install_dependencies="true" ;;
    ?) print_usage
       exit 1 ;;
  esac
done

clear
# create new output folder
rm -rf $outputfolder
mkdir -p $outputfolder
echo "Validation output is written to '$outputfolder'"

if [ $install_dependencies == "true" ]
then
  echo "Trying to install depencencies from '$foldername/sushi-config.yaml'"
  # load dependencies from sushi-config.yaml
  for dependency in `yq -o=props '.dependencies' $foldername/sushi-config.yaml`;
  do
    if [[ ${dependency::1} =~ [a-z] ]]
    then
      # create FHIR Snapshots of dependencies
      echo "Installing FHIR dependency" $dependency "..."
      # fhir bake --package $dependency;
      fhir install $dependency
    fi
  done
fi

# run sushi
echo -e "Starting Sushi to process files in '$foldername'";
sushi $foldername

# check if validator is installed if not install
if test -e "$validatorpath"; then
  echo "HAPI Validator found at '$validatorpath'"
else
  echo "HAPI Validator not found. Starting to download HAPI Validator..."
  wget https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar -O $validatorpath
fi

if [  -z "$file" ];
then
  echo "Validating files in folder '$foldername/fsh-generated/resources/' ..."
  # Run Validator on all *.json files in given directory
  for filename in $(find $foldername/fsh-generated/resources/ -name '*.json');
  do
    f="$(basename $filename .json)"
    echo -e "Processing file \033[1m $f \033[0m";
    java -jar $validatorpath -version 4.0.1 $filename -proxy 192.168.110.10:3128 -output $outputfolder"/$f.html";
  done
else
   echo -e "Processing \033[1m $file \033[0m";
   f="$(basename $file .json)"
   java -jar $validatorpath -version 4.0.1 $file -proxy 192.168.110.10:3128 -output $outputfolder"/$f.html";
fi

