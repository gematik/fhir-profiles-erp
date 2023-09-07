Profile: GEM_ERP_PR_Composition_Pharmacy_Proof
Parent: Composition
Id: GEM-ERP-PR-Composition-Pharmacy-Proof
Title: "Receipt for Fulfillment of ePrescription"
Description: "Upon completion of the ePrescription workflow, the prescription filler receives a signed receipt for billing and verification purposes."
* insert Meta(GEM_ERP_PR_Composition_Pharmacy_Proof)

* status = #final (exactly)
* status MS
* status ^short = "Status = \"final\""
* type MS
* type ^short = "Document Type = \"Documentation of Narcotics Dispense\""
* type.coding 1..1
* type.coding from GEM_ERP_VS_DocumentType (required)
* type.coding.code = #6 (exactly)
* type.coding.display = "Documentation of Narcotics Dispense" (exactly)
* date MS
* author only Reference(GEM_ERP_PR_Device)
* author MS
* author ^short = "Reference to verifying service (Device)"
* author ^type.aggregation[0] = #referenced
* author ^type.aggregation[+] = #bundled
* title = "Dokumentation zur Ausstellung von E-BtM Rezepten" (exactly)
* title MS
* title ^short = "Document title = \"Dokumentation zur Ausstellung von E-BtM Rezepten\""

// Slices for Section
* section 1.. MS
* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code.coding.code"
* section ^slicing.rules = #closed
* section contains
    ePrescription 1..1 MS and
    receipt 1..1 MS and
    dispense_information 1..1 MS

// QES der Verordnung
* section[ePrescription].code 1..1 MS
* section[ePrescription].code.coding 1..1 MS
* section[ePrescription].code.coding.system 1..1 MS
* section[ePrescription].code.coding.system = "https://gematik.de/fhir/erp/ValueSet/GEM_ERP_CS_DocumentType" (exactly)
* section[ePrescription].code.coding.code 1.. MS
* section[ePrescription].code.coding.code = #1 (exactly)
* section[ePrescription].code.coding.display = "Health Care Provider Prescription" (exactly)
* section[ePrescription].entry 1..1 MS
* section[ePrescription].entry only Reference(GEM_ERP_PR_Binary)
* section[ePrescription].entry.reference 1..1 MS
* section[ePrescription].section 0..0

// Quittung
* section[receipt].code 1..1 MS
* section[receipt].code.coding 1..1 MS
* section[receipt].code.coding.system 1..1 MS
* section[receipt].code.coding.system = "https://gematik.de/fhir/erp/ValueSet/GEM_ERP_CS_DocumentType" (exactly)
* section[receipt].code.coding.code 1.. MS
* section[receipt].code.coding.code = #3 (exactly)
* section[receipt].code.coding.display = "Receipt" (exactly)
* section[receipt].entry 1..1 MS
* section[receipt].entry only Reference(GEM_ERP_PR_Bundle)
* section[receipt].entry.reference 1..1 MS
* section[receipt].section 0..0

// MedicationDispense
* section[dispense_information].code 1..1 MS
* section[dispense_information].code.coding 1..1 MS
* section[dispense_information].code.coding.system 1..1 MS
* section[dispense_information].code.coding.system = "https://gematik.de/fhir/erp/ValueSet/GEM_ERP_CS_DocumentType" (exactly)
* section[dispense_information].code.coding.code 1.. MS
* section[dispense_information].code.coding.code = #7 (exactly)
* section[dispense_information].code.coding.display = "Dispense Information" (exactly)
* section[dispense_information].entry 1..1 MS
* section[dispense_information].entry only Reference(GEM_ERP_PR_MedicationDispense or GEM_ERP_PR_CloseOperationInputBundle)
* section[dispense_information].entry.reference 1..1 MS
* section[dispense_information].section 0..0
