Profile: GEM_ERP_PR_Communication_Representative
Parent: Communication
Id: GEM-ERP-PR-Communication-Representative
Title: "GEM ERP PR Communication Representative"
Description: "Kommunikation zwischen Patient und Vertreter"
* insert Profile(GEM_ERP_PR_Communication_Representative)

* recipient 1..1
* recipient.identifier 1..
* recipient.identifier only IdentifierKvid10

* sender.identifier 1..
* sender.identifier only IdentifierKvid10

* payload 1..1
* payload.content[x] only string
