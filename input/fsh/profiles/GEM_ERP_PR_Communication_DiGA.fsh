Profile: GEM_ERP_PR_Communication_DiGA
Parent: GEM_ERP_PR_Communication
Id: GEM-ERP-PR-Communication-DiGA
Title: "GEM ERP PR Communication DiGA"
Description: "Antwort des Leistungserbringers an den Patienten"
* insert Profile(GEM_ERP_PR_Communication_DiGA)

* recipient 1..1

* recipient.identifier 1..1
* recipient.identifier only IdentifierKvid10

* sender.identifier 1..1
* sender.identifier only IdentifierTelematikId

* payload 1..1

* payload.content[x] only string
* payload.content[x] MS
