Profile: GEM_ERP_PR_Bundle_PractitionerDocumentation
Parent: Bundle
Id: GEM-ERP-PR-Bundle-BfArMApproval
Title: "Document Bundle for BfArM Approval of admissibility for doctor s prescription of narcotics"
Description: "A document containing resources for BfArM Approval of admissibility for doctor s prescription of narcotics"
* insert Meta(GEM_ERP_PR_Bundle_PractitionerDocumentation)
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
    BfArM_Approval 1..1
* entry[DocumentInformation].resource only GEM_ERP_PR_Composition_BfArM_Documentation
* entry[DocumentInformation].resource 1..1
* entry[DocumentInformation].fullUrl 1..1

* entry[ePrescription].resource only GEM_ERP_PR_Binary
* entry[ePrescription].resource 1..1
* entry[ePrescription].fullUrl 1..1

* entry[BfArM_Approval].resource only GEM_ERP_PR_BfArMApproval
* entry[BfArM_Approval].resource 1..1
* entry[BfArM_Approval].fullUrl 1..1

// Signatur vom FD
* signature only GEM_ERP_PR_Signature
* signature MS
* signature.type 1..1

Instance: EBtMPractitionerDocumentationBundle
InstanceOf: GEM_ERP_PR_Bundle_PractitionerDocumentation
Title:   "Document Bundle for BfArM Approval of admissibility for doctor s prescription of narcotics"
Usage: #example
* id = "78d1dc47-5a2a-49d3-85de-960ab84b4d58"
* meta.tag.display = "Document Bundle for BfArM Approval of admissibility for doctor s prescription of narcotics"

* identifier[+].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[=].value = "160.000.033.491.280.78"
* type = #document
* timestamp = "2023-08-18T15:28:00+00:00"

* entry[DocumentInformation].fullUrl = "urn:uuid:12267efe-5e89-460c-90fa-380ef61c3e8a"
* entry[DocumentInformation].resource = BfArMApprovalBundleComposition
* entry[ePrescription].fullUrl = "urn:uuid:281a985c-f25b-4aae-91a6-41ad744080b0"
* entry[ePrescription].resource = EBtM-Prescription-Binary
* entry[BfArM_Approval].fullUrl = "urn:uuid:64d5081e-8d65-11ec-b909-0242ac120002"
* entry[BfArM_Approval].resource = PractitionersNarcoticsApproval

* signature.type[AuthorsSignature].system = "urn:iso-astm:E1762-95:2013"
* signature.type[AuthorsSignature].code = #1.2.840.10065.1.12.1.1
* signature.when = "2023-08-18T15:28:00+00:00"
* signature.who.reference = "https://erp.zentral.erp.splitdns.ti-dienste.de/Device/1"
* signature.sigFormat = #application/pkcs7-mime
* signature.data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="