Profile: GEM_ERP_PR_Communication_Representative
Parent: Communication
Id: GEM-ERP-PR-Communication-Representative
Title: "Kommunikation zwischen Patient und Vertreter"
Description: "Ressource, die für die Kommunikation zwischen Patienten und deren Vertreter im Zusammenhang mit einem E-Rezept verwendet wird."
* insert Profile(GEM_ERP_PR_Communication_Representative)

* recipient 1..1
* recipient.identifier 1..
* recipient.identifier only IdentifierKvid10
* recipient.identifier ^type[0].profile[0] = "http://fhir.de/StructureDefinition/identifier-kvid-10|1.5.4" //TODO: Remove with next minor version

* sender.identifier 1..
* sender.identifier only IdentifierKvid10
* sender.identifier ^type[0].profile[0] = "http://fhir.de/StructureDefinition/identifier-kvid-10|1.5.4" //TODO: Remove with next minor version

* payload 1..1
* payload.content[x] only string
