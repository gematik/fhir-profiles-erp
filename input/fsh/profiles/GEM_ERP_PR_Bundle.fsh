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

* entry[DocumentInformation] MS
  * resource only GEM_ERP_PR_Composition
  * resource 1..1
  * fullUrl 1..1
  * link 0..0
  * search 0..0
  * request 0..0
  * response 0..0
* entry[SigningDevice] MS
  * resource only GEM_ERP_PR_Device
  * resource 1..
  * fullUrl 1..
  * link ..0
  * search ..0
  * request ..0
  * response ..0
* entry[PrescriptionDigest] MS
  * resource only GEM_ERP_PR_Digest
  * resource 1..
  * fullUrl 1..
  * link ..0
  * search ..0
  * request ..0
  * response ..0
* signature MS
* signature only GEM_ERP_PR_Signature
  * ^short = "Enveloping signature applied to the receipt"