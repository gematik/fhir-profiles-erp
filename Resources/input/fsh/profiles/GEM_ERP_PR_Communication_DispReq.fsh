Profile: GEM_ERP_PR_Communication_DispReq
Parent: Communication
Id: GEM-ERP-PR-Communication-DispReq
Title: "Request for Dispense of ePrescription"
Description: "Ressource used for the communication of dispense request between patient/representative and provider based on ePrescription"
* ^meta.lastUpdated = "2020-04-16T13:43:30.128+00:00"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq"
* ^version = "1.3.0"
* ^status = #active
* ^date = "2020-04-16T13:43:27.7930941+00:00"
* ^abstract = true
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq|1.2" (exactly)
* basedOn 1..1 MS
* basedOn only Reference(GEM_ERP_PR_Task)
* basedOn ^type.aggregation = #referenced
* basedOn.reference 1.. MS
* status = #unknown (exactly)
* sent MS
* received MS
* recipient 1..1 MS
* recipient.identifier 1.. MS
* recipient.identifier only IdentifierTelematikId
* sender MS
* sender ^definition = "Message sender - set by ePrescription server using client AuthN-Credential\r\nThe entity (e.g. person, organization) which was the source of the communication."
* sender.identifier 1.. MS
* sender.identifier only $identifier-kvid-10 or $identifier-pkv
* payload 1..1 MS
//* payload.extension ^slicing.discriminator.type = #value
//* payload.extension ^slicing.discriminator.path = "url"
* payload.extension ^slicing.rules = #closed
//* payload.extension contains GEM_ERP_EX_InsuranceProvider named InsuranceProvider 0..1
* payload.content[x] only string

Instance: Communication_DispenseRequest
InstanceOf: GEM_ERP_PR_Communication_DispReq
Title: "Communication message sent by patient to pharmacy to request the dispensation of medicine by providing the AccessCode"
Usage: #example
* id = "a218a36e-f2fd-4603-ba67-c827acfef01b"
* meta.profile[+] = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq|1.2"
* meta.tag.display = "Communication message sent by patient to pharmacy to request the dispensation of medicine by providing the AccessCode"
* basedOn.reference = "Task/160.000.033.491.280.78/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #unknown
* recipient[+].identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* recipient[=].identifier.value = "3-SMC-B-Testkarte-883110000123465"
* sender.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* sender.identifier.value = "X234567890"
* sent = "2020-04-29T13:44:30.128+02:00"
* payload.contentString = "{ \"version\": \"1\", \"supplyOptionsType\": \"delivery\", \"name\": \"Dr. Maximilian von Muster\", \"address\": [ \"wohnhaft bei Emilia Fischer\", \"Bundesallee 312\", \"123. OG\", \"12345 Berlin\" ], \"hint\": \"Bitte im Morsecode klingeln: -.-.\", \"phone\": \"004916094858168\" }"