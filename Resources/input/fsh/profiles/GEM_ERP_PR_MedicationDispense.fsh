Profile: GEM_ERP_PR_MedicationDispense
Parent: MedicationDispense
Id: GEM-ERP-PR-MedicationDispense
Title: "Dispensation of the Prescription"
Description: "Handles information about the redeem of the prescription and the submited medication."
* insert Profile(GEM_ERP_PR_MedicationDispense)
* ^meta.lastUpdated = "2020-04-16T13:44:27.957+00:00"
* identifier 1..1
* identifier only GEM_ERP_PR_PrescriptionId
* identifier ^short = "ePrescription identifier"
* status = #completed (exactly)
* status ^short = "completed"
* medication[x] only Reference
* medication[x] MS
* medication[x] ^definition = "The MedicationDispense shows a contained medication based on the four KBV Medication-Profiles (KBV_PR_ERP_Medication_Compounding, KBV_PR_ERP_Medication_FreeText, KBV_PR_ERP_Medication_Ingredient, KBV_PR_ERP_Medication_PZN)."
* medication[x] ^type.aggregation = #contained
* subject 1..
* subject.identifier 1..
* subject.identifier only $identifier-kvid-10 or $identifier-pkv
* subject.identifier ^short = "The patients KVNR"
* performer 1..1
* performer.actor.identifier 1..
* performer.actor.identifier only IdentifierTelematikId
* whenPrepared ^mustSupport = false
* whenPrepared obeys workflow-abgabeDatumsFormat
* whenHandedOver 1..
* whenHandedOver obeys workflow-abgabeDatumsFormat
* dosageInstruction MS

Invariant: workflow-abgabeDatumsFormat
Description: "Wert muss ein Datum in der Form: YYYY-MM-DD sein."
* severity = #error
* expression = "toString().matches('^([0-9]([0-9]([0-9][1-9]|[1-9]0)|[1-9]00)|[1-9]000)(-(0[1-9]|1[0-2])(-(0[1-9]|[1-2][0-9]|3[0-1]))?)?$')"

