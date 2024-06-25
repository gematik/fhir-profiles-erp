Profile: GEM_ERP_PR_Bundle
Parent: Bundle
Id: GEM-ERP-PR-Bundle
Title: "Document Bundle for Receipt"
Description: "A document style representation of the receipt (complete, self-contained, signed)"
* insert Profile(GEM_ERP_PR_Bundle)
* id 1..1
* identifier 1.. MS
* identifier only GEM_ERP_PR_PrescriptionId
* identifier ^short = "identifier of ePrescription"
* type = #document (exactly)
* type MS
* timestamp 1..
* entry SU
* entry ^slicing.discriminator.type = #type // Da es verschiedene Resource-Typen gibt, wird hier nach dem Typ unterschieden
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry contains
    DocumentInformation 1..1 and
    SigningDevice 1..1 and
    PrescriptionDigest 1..1
* entry[DocumentInformation].resource only GEM_ERP_PR_Composition
* entry[DocumentInformation].resource 1..
* entry[DocumentInformation].fullUrl 1..
* entry[DocumentInformation].link ..0
* entry[DocumentInformation].search ..0
* entry[DocumentInformation].request ..0
* entry[DocumentInformation].response ..0
* entry[SigningDevice].resource only GEM_ERP_PR_Device
* entry[SigningDevice].resource 1..
* entry[SigningDevice].fullUrl 1..
* entry[SigningDevice].link ..0
* entry[SigningDevice].search ..0
* entry[SigningDevice].request ..0
* entry[SigningDevice].response ..0
* entry[PrescriptionDigest].resource only GEM_ERP_PR_Digest
* entry[PrescriptionDigest].resource 1..
* entry[PrescriptionDigest].fullUrl 1..
* entry[PrescriptionDigest].link ..0
* entry[PrescriptionDigest].search ..0
* entry[PrescriptionDigest].request ..0
* entry[PrescriptionDigest].response ..0
* signature only GEM_ERP_PR_Signature
* signature MS
  * ^short = "Enveloping signature applied to the receipt"
* signature.type 1..
* signature.type ^slicing.discriminator.type = #value
* signature.type ^slicing.discriminator.path = "code"
* signature.type ^slicing.rules = #closed
