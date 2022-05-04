#!/bin/bash
 echo -e "Starting Sushi";
 sushi Resources
 for filename in $(find ./Resources -name '*.json');
 do
    echo -e "Processing \033[1m $filename \033[0m";
    java -jar ../validator_cli.jar -version 4.0.1 -ig hl7.fhir.r4.core -ig "$filename" -proxy 192.168.110.10:3128 -output "val_%a.html";
 done

 #for directory in $(find -type d -name "Resources");
 #do
 #   echo -e "Processing \033[1m $directory \033[0m";
  #  java -jar validator_cli.jar -version 4.0.1 -ig hl7.fhir.r4.core -ig "$directory" -proxy 192.168.110.10:3128 -output "val_%a.html";
 #done