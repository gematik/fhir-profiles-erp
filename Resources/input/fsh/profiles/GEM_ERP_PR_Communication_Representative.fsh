Profile: GEM_ERP_PR_Communication_Representative
Parent: Communication
Id: GEM-ERP-PR-Communication-Representative
Title: "Communication between Patient and Representative"
Description: "Ressource used for the communication between patients and their representative pertaining to an ePrescription"
* insert Profile(GEM_ERP_PR_Communication_Representative)
* ^meta.lastUpdated = "2020-04-16T13:43:30.128+00:00"
* ^abstract = true
* basedOn 1..1 MS
* basedOn only Reference(GEM_ERP_PR_Task)
* basedOn ^type.aggregation = #referenced
* basedOn.reference 1.. MS
  * ^short = "States the E-Rezept-Token according to gemSpec_DM_eRp."
  * ^comment = "Has the form 'Task/{{PrescriptionID}}'"
* status = #unknown (exactly)
* sent MS
  * ^short = "The time when this communication was sent."
  * ^comment = "Set by the eprescription server."
* received MS
  * ^short = "The time when this communication was received."
  * ^comment = "Set by the eprescription server."
* recipient 1..1 MS
  * ^short = "The entity (e.g. person, organization) which was the target of the communication."
  * ^comment = "This needs to be set by the sender of the communication to define the target."
* recipient.identifier 1.. MS
* recipient.identifier only $identifier-kvid-10 or $identifier-pkv
* sender MS
  * ^short = "The entity (e.g. person, organization) which was the source of the communication."
  * ^comment = "Set by ePrescription server using client AuthN-Credential"
* sender ^definition = "Message sender - set by ePrescription server using client AuthN-Credential\r\nThe entity (e.g. person, organization) which was the source of the communication."
* sender.identifier 1.. MS
* sender.identifier only $identifier-kvid-10 or $identifier-pkv
* payload 1..1 MS
* payload.content[x] only string
