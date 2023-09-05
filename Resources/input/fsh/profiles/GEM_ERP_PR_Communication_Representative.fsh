Profile: GEM_ERP_PR_Communication_Representative
Parent: Communication
Id: GEM-ERP-PR-Communication-Representative
Title: "Communication between Patient and Representative"
Description: "Ressource used for the communication between patients and their representative pertaining to an ePrescription"
* insert Meta(GEM_ERP_PR_Communication_Representative)
* ^abstract = true
* basedOn 1..1 MS
* basedOn only Reference(GEM_ERP_PR_Task)
* basedOn ^type.aggregation = #referenced
* basedOn.reference 1.. MS
* status = #unknown (exactly)
* sent MS
* received MS
* recipient 1..1 MS
* recipient.identifier 1.. MS
* recipient.identifier only $identifier-kvid-10 or $identifier-pkv
* sender MS
* sender ^definition = "Message sender - set by ePrescription server using client AuthN-Credential\r\nThe entity (e.g. person, organization) which was the source of the communication."
* sender.identifier 1.. MS
* sender.identifier only $identifier-kvid-10 or $identifier-pkv
* payload 1..1 MS
* payload.content[x] only string