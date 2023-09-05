Profile: GEM_ERP_PR_Communication_Reply
Parent: Communication
Id: GEM-ERP-PR-Communication-Reply
Title: "Reply from Provider to Patient"
Description: "Ressource used for the communication of the reply to dispense/info request from provider to patient/representative"
* insert Meta(GEM_ERP_PR_Communication_Reply)
* ^abstract = true
* basedOn 1..1
* basedOn only Reference(GEM_ERP_PR_Task)
* basedOn ^type.aggregation = #referenced
* basedOn.reference 1..1
* status = #unknown (exactly)
//* about only Reference(Medication)
//* about MS
//* about ^type.aggregation = #contained
//* about.reference 1.. MS
* sent MS
* received MS
* recipient 1..1
* recipient.identifier 1..1
* recipient.identifier only $identifier-kvid-10 or $identifier-pkv
//* sender only Reference(Organization or Practitioner or PractitionerRole or HealthcareService)
* sender 1..1
* sender ^definition = "Message sender - set by ePrescription server using client AuthN-Credential\r\nThe entity (e.g. person, organization) which was the source of the communication."
* sender.identifier 1..1
* sender.identifier only $identifier-kvid-10 or $identifier-pkv or IdentifierTelematikId
* payload 1..1
* payload.extension ^slicing.discriminator.type = #value
* payload.extension ^slicing.discriminator.path = "url"
* payload.extension ^slicing.rules = #closed
* payload.extension contains 
    GEM_ERP_EX_SupplyOptionsType named OfferedSupplyOptions 0..1 and
    GEM_ERP_EX_AvailabilityState named AvailabilityStatus 0..1
* payload.extension[OfferedSupplyOptions] ^short = "Offered supply options by pharmacy"
* payload.extension[OfferedSupplyOptions] ^definition = "In a communication reply a pharmacy may state its available supply options, whether to serve customers at the store, send medication by messenger or use parcel shippment"
* payload.extension[AvailabilityStatus] ^short = "Availability Status of queried medication"
* payload.content[x] only string
* payload.content[x] MS

Instance: Communication_Reply
InstanceOf: GEM_ERP_PR_Communication_Reply
Title: "Communication message sent by pharmacy to patient in response to a previous Task-related message"
Usage: #example
* id = "7977a4ab-97a9-4d95-afb3-6c4c1e2ac596"
* meta.tag.display = "Communication message sent by pharmacy to patient in response to a previous Task-related message"
* basedOn.reference = "Task/160.000.033.491.280.78"
* status = #unknown
* sender.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* sender.identifier.value = "3-SMC-B-Testkarte-883110000123465"
* recipient[+].identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* recipient[=].identifier.value = "X234567890"
* sent = "2020-04-29T13:46:30.128+02:00"
* payload.extension[AvailabilityStatus].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AvailabilityState"
* payload.extension[AvailabilityStatus].valueCoding.system = "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_AvailabilityStatus"
* payload.extension[AvailabilityStatus].valueCoding.code = #20
* payload.extension[OfferedSupplyOptions].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_SupplyOptionsType"
* payload.extension[OfferedSupplyOptions].extension[onPremise].url = "onPremise"
* payload.extension[OfferedSupplyOptions].extension[onPremise].valueBoolean = true
* payload.extension[OfferedSupplyOptions].extension[shipment].url = "shipment"
* payload.extension[OfferedSupplyOptions].extension[shipment].valueBoolean = false
* payload.extension[OfferedSupplyOptions].extension[delivery].url = "delivery"
* payload.extension[OfferedSupplyOptions].extension[delivery].valueBoolean = true
* payload.contentString = "Eisern"