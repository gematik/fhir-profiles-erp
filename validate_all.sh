#!/bin/bash
VALIDATOR=../validator_cli.jar

# check if validator is installed if not install
if test -e "$VALIDATOR"; then
  echo "$VALIDATOR found."
else
  echo "Validator not found. Downloading Validator"
  wget https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar -O $VALIDATOR
fi

# create Output folder if not existing
mkdir -p ../val_out

# create FHIR Snapshots
fhir bake --package de.abda.eRezeptAbgabedaten
fhir bake --package de.abda.eRezeptAbgabedatenPKV
fhir bake --package kbv.basis
fhir bake --package kbv.ita.erp
fhir bake --package de.gematik.erezept-workflow.r4

# run sushi
echo -e "Starting Sushi";
sushi Resources

# iterate of files
for filename in $(find ./Resources -name '*.json');
do
   f="$(basename $filename .json)"
   echo -e "Processing \033[1m $f \033[0m";
   java -jar $VALIDATOR -version 4.0.1 -ig hl7.fhir.r4.core -ig de.gematik.erezept-workflow.r4#1.2.0-rc1 -ig kbv.ita.erp#1.0.2 -ig de.abda.eRezeptAbgabedatenPKV#1.1.0-rc9 $filename -proxy 192.168.110.10:3128 -output "../val_out/$f.html";
done