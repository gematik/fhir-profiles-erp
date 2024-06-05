Profile: GEM_ERP_PR_Communication_DispReq
Parent: Communication
Id: GEM-ERP-PR-Communication-DispReq
Title: "Request for Dispense of ePrescription"
Description: "Ressource used for the communication of dispense request between patient/representative and provider based on ePrescription"
* insert Profile(GEM_ERP_PR_Communication_DispReq)
* ^abstract = true
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
  * ^comment = "Set by the eprescription server."
* received MS
  * ^short = "The time when this communication was received."
  * ^comment = "Set by the eprescription server."
* recipient 1..1 MS
  * ^short = "The entity (e.g. person, organization) which was the target of the communication."
  * ^comment = "This needs to be set by the sender of the communication to define the target."
* recipient.identifier 1.. MS
* recipient.identifier only IdentifierTelematikId
* sender MS
  * ^short = "The entity (e.g. person, organization) which was the source of the communication."
  * ^comment = "Set by ePrescription server using client AuthN-Credential"
* sender.identifier 1.. MS
* sender.identifier only $identifier-kvid-10 or $identifier-pkv
* payload 0..1 MS
* payload obeys workflow-communication-payload-1
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
* expression = "extension.where(url = 'https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType').valueCoding.code = '162' implies payload.empty() or payload.exists()"

Instance: Communication_DispenseRequest
InstanceOf: GEM_ERP_PR_Communication_DispReq
Title: "Communication message sent by patient to pharmacy to request the dispensation of medicine by providing the AccessCode"
Usage: #example
* id = "a218a36e-f2fd-4603-ba67-c827acfef01b"
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_Communication_DispReq)
* meta.tag.display = "Communication message sent by patient to pharmacy to request the dispensation of medicine by providing the AccessCode"
* extension[flowType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* extension[flowType].valueCoding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType#160 "Muster 16 (Apothekenpflichtige Arzneimittel)"
* basedOn.reference = "Task/160.000.033.491.280.78/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #unknown
* recipient[+].identifier.system = $identifier-telematik-id
* recipient[=].identifier.value = "3-SMC-B-Testkarte-883110000123465"
* sender.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* sender.identifier.value = "X234567890"
* sent = "2020-04-29T13:44:30.128+02:00"
* payload.contentString = "{ \"version\": \"1\", \"supplyOptionsType\": \"delivery\", \"name\": \"Dr. Maximilian von Muster\", \"address\": [ \"wohnhaft bei Emilia Fischer\", \"Bundesallee 312\", \"123. OG\", \"12345 Berlin\" ], \"hint\": \"Bitte im Morsecode klingeln: -.-.\", \"phone\": \"004916094858168\" }"

Instance: Communication_DispenseRequest_DiGA
InstanceOf: GEM_ERP_PR_Communication_DispReq
Title: "Communication message sent by patient to insurance company to request the dispensation of a DiGA by providing the AccessCode"
Usage: #example
* id = "2be1c6ac-5d10-47f6-84ee-8318b2c22c76"
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_Communication_DispReq)
* meta.tag.display = "Communication message sent by patient to pharmacy to request the dispensation of medicine by providing the AccessCode"
* extension[flowType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* extension[flowType].valueCoding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType#162 "Muster 16 (Digitale Gesundheitsanwendungen)"
* basedOn.reference = "Task/162.000.033.491.280.78/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #unknown
* recipient[+].identifier.system = $identifier-telematik-id
* recipient[=].identifier.value = "8-SMC-B-Testkarte-883110000123465"
* sender.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* sender.identifier.value = "X234567890"
* sent = "2020-04-29T13:44:30.128+02:00"
