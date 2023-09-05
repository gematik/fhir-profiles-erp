Profile: GEM_ERP_PR_Composition_BfArM_Documentation
Parent: Composition
Id: GEM-ERP-PR-Composition-BfArM-Documentation
Title: "Receipt for Fulfillment of ePrescription"
Description: "Upon completion of the ePrescription workflow, the prescription filler receives a signed receipt for billing and verification purposes."
* insert Meta(GEM_ERP_PR_Composition_BfArM_Documentation)

* status = #final (exactly)
* status MS
* status ^short = "Status = \"final\""
* type MS
* type ^short = "Document Type = \"Documentation of Narcotics Approval\""
* type.coding 1..1
* type.coding from GEM_ERP_VS_DocumentType (required)
* type.coding.code = #5 (exactly)
* type.coding.display = "Documentation of Narcotics Approval" (exactly)
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
    BfArM_Approval 1..1 MS

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

// BfArM-Approval
* section[BfArM_Approval].code 1..1 MS
* section[BfArM_Approval].code.coding 1..1 MS
* section[BfArM_Approval].code.coding.system 1..1 MS
* section[BfArM_Approval].code.coding.system = "https://gematik.de/fhir/erp/ValueSet/GEM_ERP_CS_DocumentType" (exactly)
* section[BfArM_Approval].code.coding.code 1.. MS
* section[BfArM_Approval].code.coding.code = #4 (exactly)
* section[BfArM_Approval].code.coding.display = "Approval to prescribe Narcotics" (exactly)
* section[BfArM_Approval].entry 1..1 MS
* section[BfArM_Approval].entry only Reference(GEM_ERP_PR_BfArMApproval)
* section[BfArM_Approval].entry.reference 1..1 MS
* section[BfArM_Approval].section 0..0

Instance: BfArMApprovalBundleComposition
InstanceOf: GEM_ERP_PR_Composition_BfArM_Documentation
Title:   "Composition for documentation purposes of a narcotics prescription for a practitioner"
Usage: #inline
* id = "12267efe-5e89-460c-90fa-380ef61c3e8a"
* status = #final
* type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#5 "Documentation of Narcotics Approval"
* date = "2022-03-18T15:29:00+00:00"
* author.reference = "https://erp.zentral.erp.splitdns.ti-dienste.de/Device/1"
* title = "Dokumentation zur Ausstellung von E-BtM Rezepten"
* event.period.start = "2022-03-18T15:28:00+00:00"
* event.period.end = "2022-03-18T15:29:00+00:00"
* section[ePrescription].entry.reference = "281a985c-f25b-4aae-91a6-41ad744080b0" // TODO: Neue Verordnung mit WF 200
* section[ePrescription].code.coding = https://gematik.de/fhir/erp/ValueSet/GEM_ERP_CS_DocumentType#1 "Health Care Provider Prescription"
* section[BfArM_Approval].entry.reference = "PractitionersNarcoticsApproval"
* section[BfArM_Approval].code.coding = https://gematik.de/fhir/erp/ValueSet/GEM_ERP_CS_DocumentType#4 "Approval to prescribe Narcotics"