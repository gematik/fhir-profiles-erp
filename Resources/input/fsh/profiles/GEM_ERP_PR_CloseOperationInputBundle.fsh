Profile: GEM_ERP_PR_CloseOperationInputBundle
Parent: Bundle
Id: GEM-ERP-PR-CloseOperationInputBundle
Title: "Document Bundle for multiple MedicationDispenses on $close Operation"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_CloseOperationInputBundle"
* insert Versioning
* meta 1..1
* meta.profile 1..1
* insert PackageProfileExactly(StructureDefinition/GEM_ERP_PR_CloseOperationInputBundle)
* type = #collection (exactly)
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry contains
    DispensedMedications 1..
* entry[DispensedMedications].resource only GEM_ERP_PR_MedicationDispense
