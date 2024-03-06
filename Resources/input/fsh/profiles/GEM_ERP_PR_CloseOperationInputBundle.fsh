Profile: GEM_ERP_PR_CloseOperationInputBundle
Parent: Bundle
Id: GEM-ERP-PR-CloseOperationInputBundle
Title: "Document Bundle for multiple MedicationDispenses on $close Operation"
* insert Profile(GEM_ERP_PR_CloseOperationInputBundle)
* type = #collection (exactly)
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry contains
    DispensedMedications 1..
* entry[DispensedMedications].resource only GEM_ERP_PR_MedicationDispense