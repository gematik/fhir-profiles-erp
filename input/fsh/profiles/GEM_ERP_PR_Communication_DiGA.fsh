Profile: GEM_ERP_PR_Communication_DiGA
Parent: GEM_ERP_PR_Communication
Id: GEM-ERP-PR-Communication-DiGA
Title: "Antwort des Leistungserbringers an den Patienten"
Description: "Ressource, die für die Kommunikation des Leistungserbringers mit dem Patienten im Kontext der Einlösung von DiGA-Verordnungen verwendet wird."
* insert Profile(GEM_ERP_PR_Communication_DiGA)

* basedOn 1..1
* basedOn only Reference(GEM_ERP_PR_Task)
* basedOn ^type.aggregation = #referenced
* basedOn.reference 1..1

* status = #unknown (exactly)

* sent MS
* received MS

* recipient 1..1

* recipient.identifier 1..1
* recipient.identifier only IdentifierKvid10

* sender MS
* sender.identifier 1..1
* sender.identifier only IdentifierTelematikId

* payload 1..1

* payload.content[x] only string
* payload.content[x] MS