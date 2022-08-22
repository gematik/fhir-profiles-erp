#!/bin/bash

GREEN='\033[0;32m'
LGREEN'\033[1;32m'
ORANGE='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color
validatorpath=../validator_cli.jar
outputfolder=../val_out/${PWD##*/}
foldername='./Resources'
external_dependency_folder="./ExternalDependencies"
fhir_folder_path=~/.fhir/packages
file=''
install_dependencies="false"
sort_results="false"

print_usage() {
  printf "Usage:
  [-d foldername] sets foldername for validation. Default is: './Resources'
  [-f filename] sets filename for single validation.
  [-i] installs dpendencies with firely.terminal from './Resources/sushi-config.yaml' file
  [-s] sorts resulting html files in folders by the severities of the findings. Categories are: error, warning, information and unknown\n"
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

installDependencies () {
  if [ $install_dependencies == "true" ]
  then
    readarray identityMappings < <(yq '.dependencies' $foldername/sushi-config.yaml)
    echo  -e "${GREEN}[INFO] Installation of depencencies from '$foldername/sushi-config.yaml' has started...${NC}";
    for dependency in "${identityMappings[@]}";
    do
      IFS=: read -r package version <<< $dependency
      if [[ ${package:0:1} != "#" ]]
      then
        echo "[INFO] Installing $package with version $version"
        fhir install $package $version
      fi
    done
  fi
}

renameFhirFolderToLowerCase () {
  echo -e "[INFO] Rename all folder names in .fhir folder to lower case";
  for i in `( ls -d $fhir_folder_path/* | grep [A-Z] )`;
  do
    rename -v 'y/A-Z/a-z/' $i
  done
}

checkAndDownloadHapiValidator () {
  if test -e "$validatorpath"; then
    echo "[INFO] HAPI Validator found at '$validatorpath'"
  else
    echo "[INFO] HAPI Validator not found. Starting to download HAPI Validator..."
    wget https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar -O $validatorpath
  fi
}

runSushi () {
  echo -e "Starting Sushi to process files in '$foldername'";
  sushi $foldername
}

moveExternalDependencies () {
  if [ -d "$external_dependency_folder" ]; then
    echo "[INFO] copying external dependecies to $fhir_folder_path"
    cp -a $external_dependency_folder/. $fhir_folder_path/
  else
    echo  -e "${RED}[Error] $external_dependency_folder missing. No external dependencies will be copied!${NC}";
  fi
}

runHapiValidator () {
  # Concatenate folders_for_validation in fhir directory
  folders_to_validate=""
  for package in `(ls -d $fhir_folder_path/*/package)`
      do
          folders_to_validate+=" -ig ${package}"
      done
  # Only validating one file?
  if [  -z "$file" ];
  then
    echo "[INFO] Validating files in folder '$foldername/fsh-generated/resources/' ..."
    # Run Validator on all *.json files in given directory
    for filename in $(find $foldername/fsh-generated/resources/ -name '*.json');
    do
      f="$(basename $filename .json)"
      resultfile=$outputfolder"/$f.html"

      echo -e "[INFO] \n\nProcessing file \033[1m $f \033[0m";
      java -jar $validatorpath -version 4.0.1 $folders_to_validate -ig $foldername/fsh-generated/resources $filename -proxy 192.168.110.10:3128 -output $resultfile;
      if [ $sort_results == "true" ]
      then
        sortBySeverity "$resultfile"
      fi
    done
  else
    echo -e "Processing \033[1m $file \033[0m";
    echo -e "\n\nProfiles to load for validation:  $folders_to_validate";
    result_filename="$(basename $file .json)"
    #   += "-ig $package/package"
    java -jar $validatorpath -version 4.0.1 $folders_to_validate  -ig $foldername/fsh-generated/resources $file -proxy 192.168.110.10:3128 -output $outputfolder"/$result_filename.html";
    if [ $sort_results == "true" ]
    then
      sortBySeverity $outputfolder"/$result_filename.html"
    fi
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
echo "[INFO] Validation output is written to '$outputfolder'"

installDependencies
renameFhirFolderToLowerCase
checkAndDownloadHapiValidator
runSushi
moveExternalDependencies
runHapiValidator