Profile: GEM_ERP_PR_Communication_DiGA
Parent: Communication
Id: GEM-ERP-PR-Communication-DiGA
Title: "Reply from HealthCare Provider to Patient"
Description: "Ressource used for the communication of the health care provider to the patient in the context of dispensing DiGA prescriptions"
* insert Profile(GEM_ERP_PR_Communication_DiGA)

* basedOn 1..1
* basedOn only Reference(GEM_ERP_PR_Task)
* basedOn ^type.aggregation = #referenced
* basedOn.reference 1..1
  * ^short = "States the E-Rezept-Token according to gemSpec_DM_eRp."
  * ^comment = "Has the form 'Task/{{PrescriptionID}}'"

* status = #unknown (exactly)

* sent MS
  * ^short = "The time when this communication was sent."
  * ^comment = "Set by the eprescription server. A client therefore will always have this value available."
* received MS
  * ^short = "The time when this communication was received."
  * ^comment = "Set by the eprescription server. A client therefore will always have this value available."

* recipient 1..1
  * ^short = "The entity (e.g. person, organization) which was the target of the communication."
  * ^comment = "This needs to be set by the sender of the communication to define the target."
* recipient.identifier 1..1
* recipient.identifier only IdentifierKvid10

* sender MS
  * ^short = "The entity (e.g. person, organization) which was the source of the communication."
  * ^comment = "Set by ePrescription server using client AuthN-Credential"
* sender ^definition = "Message sender - set by ePrescription server using client AuthN-Credential\r\nThe entity (e.g. person, organization) which was the source of the communication."
* sender.identifier 1..1
* sender.identifier only IdentifierTelematikId

* payload 1..1

* payload.content[x] only string
* payload.content[x] MS
  * ^short = "The actual content of the message"
  * ^definition = "This content is a string message that is sent from the health care provider to the patient in the context of dispensing DiGA prescriptions."
