Profile: GEM_ERP_PR_Communication_DiGA
Parent: GEM_ERP_PR_Communication
Id: GEM-ERP-PR-Communication-DiGA
Title: "Antwort des Leistungserbringers an den Patienten"
Description: "Ressource, die für die Kommunikation des Leistungserbringers mit dem Patienten im Kontext der Einlösung von DiGA-Verordnungen verwendet wird."
* insert Profile(GEM_ERP_PR_Communication_DiGA)

* recipient 1..1

* recipient.identifier 1..1
* recipient.identifier only IdentifierKvid10
* recipient.identifier ^type[0].profile[0] = "http://fhir.de/StructureDefinition/identifier-kvid-10|1.5.4" //TODO: Remove with next minor version

* sender.identifier 1..1
* sender.identifier only IdentifierTelematikId
* sender.identifier ^type[0].profile[0] = "http://fhir.de/StructureDefinition/identifier-telematik-id|1.5.4" //TODO: Remove with next minor version

* payload 1..1

* payload.content[x] only string
* payload.content[x] MS