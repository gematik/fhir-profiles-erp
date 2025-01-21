Profile: GEM_ERP_PR_Communication_DispReq
Parent: Communication
Id: GEM-ERP-PR-Communication-DispReq
Title: "Request for Dispense of ePrescription"
Description: "Ressource used for the communication of dispense request between patient/representative and provider based on ePrescription"
* insert Profile(GEM_ERP_PR_Communication_DispReq)
* obeys workflow-communication-payload-1
* obeys workflow-communication-flowtype-1

* extension contains GEM_ERP_EX_PrescriptionType named flowType 1..1
* basedOn 1..1 MS
* basedOn only Reference(GEM_ERP_PR_Task)
* basedOn ^type.aggregation = #referenced
* basedOn.reference 1.. MS
  * ^short = "States the E-Rezept-Token according to gemSpec_DM_eRp."
  * ^comment = "Has the form \"Task/{{PrescriptionID}}\""
* status = #unknown (exactly)
* sent MS
  * ^short = "The time when this communication was sent."
  * ^comment = "Set by the eprescription server. A client therefore will always have this value available."
* received MS
  * ^short = "The time when this communication was received."
  * ^comment = "Set by the eprescription server. A client therefore will always have this value available."
* recipient 1..1 MS
  * ^short = "The entity (e.g. person, organization) which was the target of the communication."
  * ^comment = "This needs to be set by the sender of the communication to define the target."
* recipient.identifier 1.. MS
* recipient.identifier only IdentifierTelematikId
* sender MS
  * ^short = "The entity (e.g. person, organization) which was the source of the communication."
  * ^comment = "Set by ePrescription server using client AuthN-Credential"
* sender.identifier 1.. MS
* sender.identifier only IdentifierKvid10
* payload 0..1 MS
//* payload.extension ^slicing.discriminator.type = #value
//* payload.extension ^slicing.discriminator.path = "url"
* payload.extension ^slicing.rules = #closed
//* payload.extension contains GEM_ERP_EX_InsuranceProvider named InsuranceProvider 0..1
* payload.content[x] only string
  * ^short = "The actual content of the message"
  * ^comment = "This content needs to be a JSON according to gemSpec_DM_eRp."

Invariant: workflow-communication-payload-1
Description: "Payload muss angegeben werden, wenn eine Zuweisung für ein Arzneimittel vorgenommen wird"
* severity = #error
* expression = "(extension.where(url = 'https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType').value.code = '162' implies payload.exists().not()) and (extension.where(url = 'https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType').value.code != '162' implies payload.exists() and payload.empty().not())"

Invariant: workflow-communication-flowtype-1
Description: "Der flowType einer Zuweisung muss zu einem Task mit entsprechender Task-ID passen"
* severity = #error
* expression = "basedOn.reference.startsWith(('Task/' | %resource.extension.where(url = 'https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType').value.code).join())"