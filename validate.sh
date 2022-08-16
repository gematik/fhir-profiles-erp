#!/bin/bash

GREEN='\033[0;32m'
LGREEN'\033[1;32m'
ORANGE='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color
validatorpath=../validator_cli.jar
outputfolder=../val_out/${PWD##*/}
foldername='./Resources'
file=''
install_dependencies="false"
sort_results="false"

print_usage() {
  printf "Usage:\n
  [-d foldername] sets foldername for validation. Default is: './Resources'\n
  [-f filename] sets filename for single validation.\n
  [-i] installs dpendencies with firely.terminal from './Resources/sushi-config.yaml' file\n
  [-s] sorts resulting html files in folders by the severities of the findings. Categories are: error, warning, information and unknown"
}

sortBySeverity () {
  f="$(basename $1 .json)"
  if grep -q '<td>ERROR</td>' "$1"; then
      echo  -e "${RED}ERROR${NC} in '$f'";
      mkdir -p $outputfolder"/error"; mv $1 $outputfolder"/error/"$f;
  elif grep -q '<td>All OK</td>' "$1"; then
      echo  -e "${GREEN}ALL OK${NC} in '$f'";
      mkdir -p $outputfolder"/all_ok"; mv $1 $outputfolder"/all_ok/"$f;
  elif grep -q '<td>WARNING</td>' "$1"; then
      echo  -e "${ORANGE}WARNING${NC} in  '$f'";
      mkdir -p $outputfolder"/warning"; mv $1 $outputfolder"/warning/"$f
  elif grep -q '<td>INFORMATION</td>' "$1"; then
      echo -e "${LGREEN}INFORMATION${NC} in '$f'";
      mkdir -p $outputfolder"/information"; mv $1 $outputfolder"/information/"$f
  else
      echo "UNKNOWN STATE for '$f'";
      mkdir -p $outputfolder"/unknown"; mv $1 $outputfolder"/unknown/"$f
  fi
}

while getopts 'd:f:is' flag; do
  case "${flag}" in
    d) foldername="${OPTARG}" ;;
    f) file="${OPTARG}" ;;
    i) install_dependencies="true" ;;
    s) sort_results="true";;
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
    # TODO dont load LATEST -> get by file version
    if [[ ${dependency::1} =~ [a-z] ]]
    then
      # create FHIR Snapshots of dependencies
      echo "Installing FHIR dependency" $dependency "..."
      # fhir bake --package $dependency;
      fhir install $dependency
    fi
  done
fi

# rename all folders to lower case
echo -e "Rename all folder name in .fhir folder to lower case";
for i in `( ls -d $fhir_folder_path/* | grep [A-Z] )`;
do
  echo  $i
  rsync -a $i `echo $i | tr 'A-Z' 'a-z'`
# mv -i $i `echo $i | tr 'A-Z' 'a-z'`;
done

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
    resultfile=$outputfolder"/$f.html"

    echo -e "\n\nProcessing file \033[1m $f \033[0m";
    java -jar $validatorpath -version 4.0.1 -ig $foldername/fsh-generated/resources $filename -proxy 192.168.110.10:3128 -output $resultfile;
    if [ $sort_results == "true" ]
    then
      sortBySeverity "$resultfile"
    fi
  done
else
   echo -e "Processing \033[1m $file \033[0m";
   f="$(basename $file .json)"
   # foreach package in -ig ~/.fhir/packages/*
   #   += "-ig $package/package"
   java -jar $validatorpath -version 4.0.1 -ig ~/.fhir/packages/de.basisprofil.r4#1.3.2/package  -ig $foldername/fsh-generated/resources $file -proxy 192.168.110.10:3128 -output $outputfolder"/$f.html";
   if [ $sort_results == "true" ]
    then
      sortBySeverity $outputfolder"/$f.html"
    fi
fi


