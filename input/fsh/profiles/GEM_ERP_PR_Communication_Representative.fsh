Profile: GEM_ERP_PR_Communication_Representative
Parent: Communication
Id: GEM-ERP-PR-Communication-Representative
Title: "Kommunikation zwischen Patient und Vertreter"
Description: "Ressource, die für die Kommunikation zwischen Patienten und deren Vertreter im Zusammenhang mit einem E-Rezept verwendet wird."
* insert Profile(GEM_ERP_PR_Communication_Representative)

* basedOn 1..1 MS
* basedOn only Reference(GEM_ERP_PR_Task)
* basedOn ^type.aggregation = #referenced
* basedOn.reference 1.. MS

* status = #unknown (exactly)

* sent MS
* received MS

* recipient 1..1 MS
* recipient.identifier 1.. MS
* recipient.identifier only IdentifierKvid10

* sender MS
* sender.identifier 1.. MS
* sender.identifier only IdentifierKvid10

* payload 1..1 MS
* payload.content[x] only string
