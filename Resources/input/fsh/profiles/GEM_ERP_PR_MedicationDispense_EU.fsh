Profile: GEM_ERP_PR_MedicationDispense_EU
Parent: MedicationDispense
Id: GEM-ERP-PR-MedicationDispense-EU
Title: "Dispensation of the Prescription from the EU"
Description: "Handles information about the redeem of the prescription and the submited medication from the EU."
* insert Profile(GEM_ERP_PR_MedicationDispense_EU)

// Copy from EPA Start ---
* extension contains RxPrescriptionProcessIdentifierExtension named rxPrescriptionProcessIdentifier 0..1

* extension[rxPrescriptionProcessIdentifier].value[x]
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier 0..
* identifier contains
    RxOriginatorProcessIdentifier 0..1 and
    EPADispensationIdentifier 0..1
* identifier[RxOriginatorProcessIdentifier] only RxOriginatorProcessIdentifier
* identifier[RxOriginatorProcessIdentifier] ^patternIdentifier.system = $sid-identifier-rx-originator-process
* identifier[EPADispensationIdentifier] only EPADispensationIdentifier
* identifier[EPADispensationIdentifier] ^patternIdentifier.system = $sid-identifier-dispensation
* status from EPAMedicationDispenseStatusVS
  * ^short = "Status of medication dispense"
* category MS
  * ^short = "Missing value indicates a prescription dispense."
* category from EPAMedicationDispenseCategoryVS
  * ^binding.description = "Defines the context of a Dispensation: prescription or non-prescription"

* medication[x] only Reference
* medicationReference MS
* medicationReference only Reference(Medication)

* subject 1..1 MS
* subject only Reference(Patient)
  * identifier 1..1 MS
  * identifier only IdentifierKvid10

* performer 1..1 MS

* authorizingPrescription 0..
  * reference 1.. MS
* authorizingPrescription only Reference(MedicationRequest)
* whenHandedOver 1.. MS
* dosageInstruction MS
* substitution MS

// Copy from EPA End ---

* identifier contains prescriptionID 1..1
* identifier[prescriptionID] only GEM_ERP_PR_PrescriptionId
* identifier[prescriptionID] ^patternIdentifier.system = $prescription-id-ns
* identifier ^short = "ePrescription identifier"

* status = #completed (exactly)
* status ^short = "completed"

* medication[x] only Reference(GEM_ERP_PR_Medication)
* medication[x] MS
* medication[x] ^definition = "The MedicationDispense references a medication which was dispensed"

* performer 1..1
* performer.actor only Reference(GEM_ERP_PR_EUPractitionerRole)

* whenHandedOver 1..1 MS
* whenHandedOver obeys workflow-abgabeDatumsFormat
* whenPrepared obeys workflow-abgabeDatumsFormat

* substitution MS
* dosageInstruction MS
* quantity MS
  * ^short = "Number of dispensed packages/ units"
  * value MS
  * unit MS