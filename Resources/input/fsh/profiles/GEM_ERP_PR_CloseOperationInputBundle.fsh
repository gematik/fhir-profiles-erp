Profile: GEM_ERP_PR_CloseOperationInputBundle
Parent: Bundle
Id: GEM-ERP-PR-CloseOperationInputBundle
Title: "Document Bundle for multiple MedicationDispenses on $close Operation"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_CloseOperationInputBundle"
* ^version = "1.2"
* ^status = #draft
* type = #collection (exactly)
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry contains
    DispensedMedications 1..
* entry[DispensedMedications].resource only MedicationDispense