Profile: GEM_ERP_PR_Communication_Reply
Parent: Communication
Id: GEM-ERP-PR-Communication-Reply
Title: "Reply from Provider to Patient"
Description: "Ressource used for the communication of the reply to dispense/info request from provider to patient/representative"
* ^meta.lastUpdated = "2020-04-16T13:43:30.128+00:00"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Reply"
* ^version = "1.2"
* ^status = #draft
* ^date = "2020-04-16T13:43:27.7930941+00:00"
* ^abstract = true
* basedOn 1..1 MS
* basedOn only Reference(GEM_ERP_PR_Task)
* basedOn ^type.aggregation = #referenced
* basedOn.reference 1.. MS
* status = #unknown (exactly)
* about only Reference($KBV_PR_ERP_Medication_PZN or $KBV_PR_ERP_Medication_FreeText or $KBV_PR_ERP_Medication_Compounding or $KBV_PR_ERP_Medication_Ingredient or GEM_ERP_PR_Task)
* about MS
* about ^type.aggregation = #contained
* about.reference 1.. MS
* sent MS
* received MS
* recipient 1..1 MS
* recipient only Reference(Patient or RelatedPerson)
* recipient.identifier 1.. MS
* recipient.identifier only $identifier-kvid-10
* sender only Reference(Organization or Practitioner or PractitionerRole or HealthcareService)
* sender MS
* sender ^definition = "Message sender - set by ePrescription server using client AuthN-Credential\r\nThe entity (e.g. person, organization) which was the source of the communication."
* sender.identifier 1.. MS
* sender.identifier only $identifier-kvid-10 or IdentifierTelematikId
* payload 1..1 MS
* payload.extension ^slicing.discriminator.type = #value
* payload.extension ^slicing.discriminator.path = "url"
* payload.extension ^slicing.rules = #closed
* payload.extension contains
    GEM_ERP_EX_SupplyOptionsType named OfferedSupplyOptions 0..* and
    GEM_ERP_EX_AvailabilityState named AvailabilityStatus 0..1
* payload.extension[OfferedSupplyOptions] ^short = "Offered supply options by pharmacy"
* payload.extension[OfferedSupplyOptions] ^definition = "In a communication reply a pharmacy may state its available supply options, whether to serve customers at the store, send medication by messenger or use parcel shippment"
* payload.extension[AvailabilityStatus] ^short = "Availability Status of queried medication"
* payload.content[x] only string
* payload.content[x] MS