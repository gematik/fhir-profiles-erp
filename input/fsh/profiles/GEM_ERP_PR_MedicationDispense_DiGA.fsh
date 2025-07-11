Profile: GEM_ERP_PR_MedicationDispense_DiGA
Parent: EPAMedicationDispense
Id: GEM-ERP-PR-MedicationDispense-DiGA
Title: "Dispensation of a DiGA-Prescription"
Description: "Handles information about the dispensed DiGA"
* insert Profile(GEM_ERP_PR_MedicationDispense_DiGA)
* obeys workflow-medicationdispense-redeemcode-1
* obeys workflow-medicationdispense-redeemcode-2
* obeys workflow-medicationdispense-redeemcode-3

* extension 0..*
* extension contains 
    GEM_ERP_EX_RedeemCode named redeemCode 0..1
    and GEM_ERP_EX_DeepLink named deepLink 0..1

* identifier contains prescriptionID 1..1
* identifier[prescriptionID] only EPrescriptionId
* identifier[prescriptionID] ^patternIdentifier.system = $prescription-id-ns
* identifier ^short = "ePrescription identifier"

* status = #completed (exactly)
* status ^short = "completed"

* medication[x] only Reference
* medication[x] MS
* medication[x] ^definition = "Information about the medication that is being dispensed. To include are name and the PZN-identifier of a DiGA prescription unit."
* medicationReference.display 0..1 MS
  * ^short = "Name of the DiGA prescription unit."
* medicationReference.identifier 0..1 MS
  * ^short = "Unique identification number for a prescription unit of a DiGA (PZN)."
  * system 1..1 MS
  * system = $cs-pzn (exactly)
  * value 1..1 MS

// Extension, falls die DiGA vom Kostenträger nicht bezahlt wird
* medicationReference.extension contains DataAbsentReason named data-absent-reason 0..1
* medicationReference.extension[data-absent-reason].valueCode = #asked-declined

// Kostenträger 
* performer 1..1
  * actor MS
    * identifier 1..1
    * identifier only IdentifierTelematikId

// Abgabedatum
* whenHandedOver 1..1
* whenHandedOver ^short = "Date of dispensation"
* whenHandedOver obeys workflow-abgabeDatumsFormat

* substitution 0..0
  * ^comment = "According to BAS the substitution for DiGAs is not allowed"

Invariant: workflow-medicationdispense-redeemcode-1
Description: "A note was not found, but is mandatory if no redeem code is provided."
Expression: "extension.where(url = 'https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_RedeemCode').empty() implies note.exists()"
Severity: #error

Invariant: workflow-medicationdispense-redeemcode-2
Description: "The data absent reason was not found, but is mandatory if no redeem code is provided."
Expression: "extension.where(url = 'https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_RedeemCode').empty() implies medication.extension.where(url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason').exists()"
Severity: #error

Invariant: workflow-medicationdispense-redeemcode-3
Description: "Name and identifier of the DiGA was not found, but is mandatory if a redeem code is provided."
Expression: "extension.where(url = 'https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_RedeemCode').exists() implies (medication.display.exists() and medication.identifier.exists())"
Severity: #error
