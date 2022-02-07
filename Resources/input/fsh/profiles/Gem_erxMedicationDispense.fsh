Profile: Gem_erxMedicationDispense
Parent: MedicationDispense
Id: 40bff92a-2fec-448f-9b1c-6aec203a4053
Title: "Dispensation of the Prescription"
Description: "Handles information about the redeem of the prescription and the submited medication."
* ^meta.lastUpdated = "2020-04-16T13:44:27.957+00:00"
* ^url = "https://gematik.de/fhir/StructureDefinition/ErxMedicationDispense"
* ^version = "1.1.1"
* ^status = #draft
* ^date = "2020-04-16T13:44:25.6462885+00:00"
* identifier 1..1 MS
* identifier only Gem_erxPrescriptionID
* identifier ^short = "ePrescription identifier"
* status = #completed (exactly)
* status MS
* status ^short = "completed"
* medication[x] only Reference
* medication[x] MS
* medication[x] ^definition = "The MedicationDispense shows a contained medication based on the four KBV Medication-Profiles (KBV_PR_ERP_Medication_Compounding, KBV_PR_ERP_Medication_FreeText, KBV_PR_ERP_Medication_Ingredient, KBV_PR_ERP_Medication_PZN)."
* medication[x] ^type.aggregation = #contained
* subject 1.. MS
* subject.identifier 1.. MS
* subject.identifier only $identifier-kvid-10
* subject.identifier ^short = "The patients KVNR"
* performer 1..1 MS
* performer.actor.identifier 1..
* performer.actor.identifier only Gem_baseTelematikID
* whenPrepared ^mustSupport = false
* whenHandedOver 1.. MS
* dosageInstruction MS