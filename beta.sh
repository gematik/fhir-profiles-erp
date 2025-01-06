fhir bake
cd .bake/package
fhir inflate --here
cd ../../
cp -r .bake/package ~/.fhir/packages/de.gematik.erezept-workflow.r4#1.5.0-beta
rm -r .bake