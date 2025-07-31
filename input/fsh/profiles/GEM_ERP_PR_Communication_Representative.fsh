Profile: GEM_ERP_PR_Communication_Representative
Parent: Communication
Id: GEM-ERP-PR-Communication-Representative
Title: "Kommunikation zwischen Patient und Vertreter"
Description: "Ressource, die für die Kommunikation zwischen Patienten und deren Vertreter im Zusammenhang mit einem E-Rezept verwendet wird."
* insert Profile(GEM_ERP_PR_Communication_Representative)

* recipient 1..1
* recipient.identifier 1..
* recipient.identifier only IdentifierKvid10

* sender.identifier 1..
* sender.identifier only IdentifierKvid10

* payload 1..1
* payload.content[x] only string
