Profile: Gem_erxCommunicationInfoReq
Parent: Communication
Id: Gem_erxCommunicationInfoReq
Title: "Informative request from Patient to Provider"
Description: "Ressource used for the communication of informative requests between patient and provider."
* ^meta.lastUpdated = "2020-04-16T13:43:30.128+00:00"
* ^url = "https://gematik.de/fhir/StructureDefinition/ErxCommunicationInfoReq"
* ^version = "1.1.1"
* ^status = #draft
* ^date = "2020-04-16T13:43:27.7930941+00:00"
* ^abstract = true
* basedOn 1..1
* status = #unknown (exactly)
* about 1.. MS
* about only Reference($KBV_PR_ERP_Medication_FreeText or $KBV_PR_ERP_Medication_PZN or $KBV_PR_ERP_Medication_Compounding or $KBV_PR_ERP_Medication_Ingredient)
* about ^type.aggregation = #contained
* about.reference 1.. MS
* sent MS
* received MS
* recipient 1..1 MS
* recipient.identifier 1.. MS
* recipient.identifier only Gem_baseTelematikID
* sender MS
* sender ^definition = "Message sender - set by ePrescription server using client AuthN-Credential\r\nThe entity (e.g. person, organization) which was the source of the communication."
* sender.identifier 1.. MS
* sender.identifier only $identifier-kvid-10
* payload 1..1 MS
* payload.extension ^slicing.discriminator.type = #value
* payload.extension ^slicing.discriminator.path = "url"
* payload.extension ^slicing.rules = #open
* payload.extension contains
    InsuranceProvider named InsuranceProvider 1..1 and
    SupplyOptionsType named PreferredSupplyOptions 0..* and
    SubstitutionAllowedType named SubstitutionAllowed 1..1 and
    PrescriptionType named PrescriptionType 1..1 and
    PackageQuanity named PackageQuantity 0..*
* payload.extension[PreferredSupplyOptions] ^short = "Preferred supply options by the patient"
* payload.extension[PreferredSupplyOptions] ^definition = "In an information request (Anfrage Belieferfähigkeit) to a pharmacy a patient may state its preferred supply options, whether to pick up at the store, getting delivered by messenger or receive parcel shippment"
* payload.extension[SubstitutionAllowed] ^short = "Aut idem substitution allowed"
* payload.extension[PrescriptionType] ^short = "PrescriptionType for ePrescription workflow"
* payload.extension[PrescriptionType] ^definition = "PrescriptionType for ePrescription workflow as stated in Task-Ressource for an ePrescription"
* payload.content[x] only string