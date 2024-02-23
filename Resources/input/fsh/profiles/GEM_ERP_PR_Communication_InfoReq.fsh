Profile: GEM_ERP_PR_Communication_InfoReq
Parent: Communication
Id: GEM-ERP-PR-Communication-InfoReq
Title: "Informative request from Patient to Provider"
Description: "Ressource used for the communication of informative requests between patient and provider."
* insert Profile(GEM_ERP_PR_Communication_InfoReq)
* ^meta.lastUpdated = "2020-04-16T13:43:30.128+00:00"
* ^date = "2020-04-16T13:43:27.7930941+00:00"
* ^abstract = true
* basedOn 1..1
  * ^short = "States the E-Rezept-Token according to gemSpec_DM_eRp."
  * ^comment = "Has the form 'Task/<PrescriptionID>'"
* basedOn only Reference(GEM_ERP_PR_Task)
* basedOn ^type.aggregation = #referenced
* basedOn.reference 1..1
* status = #unknown (exactly)
* about 1..
* about only Reference(Medication)
* about ^type.aggregation = #contained
* about.reference 1..1
* sent MS
  * ^short = "The time when this communication was sent."
  * ^comment = " Set by the eprescription server."
* received MS
  * ^short = "The time when this communication was received."
  * ^comment = " Set by the eprescription server."
* recipient 1..1
  * ^short = "The entity (e.g. person, organization) which was the target of the communication."
  * ^comment = " This needs to be set by the sender of the communication to define the target."
* recipient.identifier 1..1
* recipient.identifier only IdentifierTelematikId
* sender MS
  * ^short = "The entity (e.g. person, organization) which was the source of the communication."
  * ^comment = "Set by ePrescription server using client AuthN-Credential"
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
  * ^short = "The actual content of the message"
  * ^comment = "This content needs to be a JSON according to gemSpec_DM_eRp."

Instance: Communication_InformationRequest
InstanceOf: GEM_ERP_PR_Communication_InfoReq
Title: "Communication message sent by patient to pharmacy to ask for availybility of medicine WITHOUT providing the AccessCode"
Usage: #example
* id = "8ca3c379-ac86-470f-bc12-178c9008f5c9"
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_Communication_InfoReq)
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
* payload.extension[InsuranceProvider].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_InsuranceProvider"
* payload.extension[InsuranceProvider].valueIdentifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payload.extension[InsuranceProvider].valueIdentifier.value = "109500969"
* payload.extension[SubstitutionAllowed].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_SubstitutionAllowedType"
* payload.extension[SubstitutionAllowed].valueBoolean = false
* payload.extension[PrescriptionType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* payload.extension[PrescriptionType].valueCoding.system = "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType"
* payload.extension[PrescriptionType].valueCoding.code = #160
* payload.extension[PackageQuantity].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PackageQuantity"
* payload.extension[PackageQuantity].valueQuantity.system = "http://unitsofmeasure.org"
* payload.extension[PackageQuantity].valueQuantity.value = 1
* payload.extension[PreferredSupplyOptions].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_SupplyOptionsType"
* payload.extension[PreferredSupplyOptions].extension[onPremise].url = "onPremise"
* payload.extension[PreferredSupplyOptions].extension[onPremise].valueBoolean = true
* payload.extension[PreferredSupplyOptions].extension[shipment].url = "shipment"
* payload.extension[PreferredSupplyOptions].extension[shipment].valueBoolean = false
* payload.extension[PreferredSupplyOptions].extension[delivery].url = "delivery"
* payload.extension[PreferredSupplyOptions].extension[delivery].valueBoolean = true
* payload.contentString = "U.N.V.E.U."
