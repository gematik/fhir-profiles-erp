Profile: GEM_ERP_PR_Communication_DiGA
Parent: GEM_ERP_PR_Communication
Id: GEM-ERP-PR-Communication-DiGA
Title: "Antwort des Leistungserbringers an den Patienten"
Description: "Ressource, die für die Kommunikation des Leistungserbringers mit dem Patienten im Kontext der Einlösung von DiGA-Verordnungen verwendet wird."
* insert Profile(GEM_ERP_PR_Communication_DiGA)

* recipient 1..1

* recipient.identifier 1..1
* recipient.identifier only IdentifierKvid10

* sender.identifier 1..1
* sender.identifier only IdentifierTelematikId

* payload 1..1

* payload.content[x] only string
* payload.content[x] MS