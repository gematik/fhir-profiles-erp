Profile: GEM_ERP_PR_Communication_InfoReq
Parent: Communication
Id: GEM-ERP-PR-Communication-InfoReq
Title: "Informative request from Patient to Provider"
Description: "Ressource used for the communication of informative requests between patient and provider."
* ^meta.lastUpdated = "2020-04-16T13:43:30.128+00:00"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_InfoReq"
* ^version = "1.3.0"
* ^status = #draft
* ^date = "2020-04-16T13:43:27.7930941+00:00"
* ^abstract = true
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_InfoReq|1.2" (exactly)
* basedOn 1..1
* basedOn only Reference(GEM_ERP_PR_Task)
* basedOn ^type.aggregation = #referenced
* basedOn.reference 1..1
* status = #unknown (exactly)
* about 1..
* about only Reference(Medication)
* about ^type.aggregation = #contained
* about.reference 1..1
* sent MS
* received MS
* recipient 1..1
* recipient.identifier 1..1
* recipient.identifier only IdentifierTelematikId
* sender MS
* sender ^definition = "Message sender - set by ePrescription server using client AuthN-Credential\r\nThe entity (e.g. person, organization) which was the source of the communication."
* sender.identifier 1..1
* sender.identifier only $identifier-kvid-10 or $identifier-pkv
* payload 1..1
* payload.extension ^slicing.discriminator.type = #value
* payload.extension ^slicing.discriminator.path = "url"
* payload.extension ^slicing.rules = #closed
* payload.extension contains
    GEM_ERP_EX_InsuranceProvider named InsuranceProvider 1..1 and
    GEM_ERP_EX_SupplyOptionsType named PreferredSupplyOptions 0..1 and
    GEM_ERP_EX_SubstitutionAllowedType named SubstitutionAllowed 1..1 and
    GEM_ERP_EX_PrescriptionType named PrescriptionType 1..1 and
    GEM_ERP_EX_PackageQuantity named PackageQuantity 0..*
* payload.extension[PreferredSupplyOptions] ^short = "Preferred supply options by the patient"
* payload.extension[PreferredSupplyOptions] ^definition = "In an information request (Anfrage Belieferfähigkeit) to a pharmacy a patient may state its preferred supply options, whether to pick up at the store, getting delivered by messenger or receive parcel shippment"
* payload.extension[SubstitutionAllowed] ^short = "Aut idem substitution allowed"
* payload.extension[PrescriptionType] ^short = "PrescriptionType for ePrescription workflow"
* payload.extension[PrescriptionType] ^definition = "PrescriptionType for ePrescription workflow as stated in Task-Ressource for an ePrescription"
* payload.content[x] only string

Instance: Communication_InformationRequest
InstanceOf: GEM_ERP_PR_Communication_InfoReq
Title: "Communication message sent by patient to pharmacy to ask for availybility of medicine WITHOUT providing the AccessCode"
Usage: #example
* id = "8ca3c379-ac86-470f-bc12-178c9008f5c9"
* meta.profile[+] = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_InfoReq|1.2"
* meta.tag.display = "Communication message sent by patient to pharmacy to ask for availybility of medicine WITHOUT providing the AccessCode"
* contained[+] = SumatripanMedication
* basedOn.reference = "Task/160.000.033.491.280.78"
* status = #unknown
* about.reference = "#001413e4-a5e9-48da-9b07-c17bab476407"
* recipient[+].identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* recipient[=].identifier.value = "3-SMC-B-Testkarte-883110000123465"
* sender.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* sender.identifier.value = "X234567890"
* sent = "2020-04-29T13:43:30.128+02:00"
* payload.extension[+].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_InsuranceProvider"
* payload.extension[=].valueIdentifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payload.extension[=].valueIdentifier.value = "109500969"
* payload.extension[+].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_SubstitutionAllowedType"
* payload.extension[=].valueBoolean = false
* payload.extension[+].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* payload.extension[=].valueCoding.system = "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType"
* payload.extension[=].valueCoding.code = #160
* payload.extension[+].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PackageQuantity"
* payload.extension[=].valueQuantity.system = "http://unitsofmeasure.org"
* payload.extension[=].valueQuantity.value = 1
* payload.extension[+].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_SupplyOptionsType"
* payload.extension[=].extension[+].url = "onPremise"
* payload.extension[=].extension[=].valueBoolean = true
* payload.extension[=].extension[+].url = "shipment"
* payload.extension[=].extension[=].valueBoolean = false
* payload.extension[=].extension[+].url = "delivery"
* payload.extension[=].extension[=].valueBoolean = true
* payload.contentString = "U.N.V.E.U."
