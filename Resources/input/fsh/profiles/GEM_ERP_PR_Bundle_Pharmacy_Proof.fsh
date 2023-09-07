Profile: GEM_ERP_PR_Bundle_Pharmacy_Proof
Parent: Bundle
Id: GEM-ERP-PR-Bundle-Pharmacy-Proof
Title: "Document Bundle for BfArM Approval of admissibility for doctor s prescription of narcotics"
Description: "A document containing resources for BfArM Approval of admissibility for doctor s prescription of narcotics"
* insert Meta(GEM_ERP_PR_Bundle_Pharmacy_Proof)
* id 1..1
* identifier 1..1 MS
* identifier only GEM_ERP_PR_PrescriptionId
* identifier ^short = "identifier of ePrescription"
* type = #document (exactly)
* type MS
* timestamp 1..1

* entry SU
* entry ^slicing.discriminator.type = #value
* entry ^slicing.discriminator.path = "resource.meta.profile"
* entry ^slicing.rules = #closed
* entry contains
    DocumentInformation 1..1 and
    ePrescription 1..1 and
    receipt 1..1 MS and
    dispense_information 1..1 MS

* entry[DocumentInformation].resource only GEM_ERP_PR_Composition_Pharmacy_Proof
* entry[DocumentInformation].resource 1..1
* entry[DocumentInformation].fullUrl 1..1

* entry[ePrescription].resource only GEM_ERP_PR_Binary
* entry[ePrescription].resource 1..1
* entry[ePrescription].fullUrl 1..1

* entry[receipt].resource only GEM_ERP_PR_Bundle
* entry[receipt].resource 1..1
* entry[receipt].fullUrl 1..1

* entry[dispense_information].resource only GEM_ERP_PR_MedicationDispense or GEM_ERP_PR_CloseOperationInputBundle
* entry[dispense_information].resource 1..1
* entry[dispense_information].fullUrl 1..1

// Signatur vom FD
* signature only GEM_ERP_PR_Signature
* signature MS
* signature.type 1..1
