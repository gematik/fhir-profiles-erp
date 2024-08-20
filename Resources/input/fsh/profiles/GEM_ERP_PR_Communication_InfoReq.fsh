Profile: GEM_ERP_PR_Communication_InfoReq
Parent: Communication
Id: GEM-ERP-PR-Communication-InfoReq
Title: "Informative request from Patient to Provider"
Description: "Ressource used for the communication of informative requests between patient and provider."
* insert Profile(GEM_ERP_PR_Communication_InfoReq)
* ^meta.lastUpdated = "2020-04-16T13:43:30.128+00:00"
* ^abstract = true
* basedOn 1..1
  * ^short = "States the E-Rezept-Token according to gemSpec_DM_eRp."
  * ^comment = "Has the form 'Task/{{PrescriptionID}}'"
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
  * ^comment = "Set by the eprescription server."
* received MS
  * ^short = "The time when this communication was received."
  * ^comment = "Set by the eprescription server."
* recipient 1..1
  * ^short = "The entity (e.g. person, organization) which was the target of the communication."
  * ^comment = "This needs to be set by the sender of the communication to define the target."
* recipient.identifier 1..1
* recipient.identifier only IdentifierTelematikId
* sender MS
  * ^short = "The entity (e.g. person, organization) which was the source of the communication."
  * ^comment = "Set by ePrescription server using client AuthN-Credential"
* sender ^definition = "Message sender - set by ePrescription server using client AuthN-Credential\r\nThe entity (e.g. person, organization) which was the source of the communication."
* sender.identifier 1..1
* sender.identifier only IdentifierKvid10
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
