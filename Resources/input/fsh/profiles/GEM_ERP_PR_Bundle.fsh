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
* signature.type 1..
* signature.type ^slicing.discriminator.type = #value
* signature.type ^slicing.discriminator.path = "code"
* signature.type ^slicing.rules = #closed

Instance: ReceiptBundleBinary
InstanceOf: Binary
Usage: #inline
* id = "b939a82a-9c23-4b6d-a139-f468d1b9d652"
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_Digest)
* contentType = #application/octet-stream
* data = "tJg8c5ZtdhzEEhJ0ZpAsUVFx5dKuYgQFs5oKgthi17M="

Instance: ReceiptBundleQuittung
InstanceOf: GEM_ERP_PR_Bundle
Title:   "Receipt Bundle 'Quittung' for completed dispensation of a prescription"
Usage: #example
* id = "dffbfd6a-5712-4798-bdc8-07201eb77ab8"
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_Bundle)
* meta.tag.display = "Receipt Bundle 'Quittung' for completed dispensation of a prescription"
* identifier[+].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[=].value = "160.000.033.491.280.78"
* type = #document
* timestamp = "2022-03-18T15:28:00+00:00"
* entry[DocumentInformation].fullUrl = "urn:uuid:c624cf47-e235-4624-af71-0a09dc9254dc"
* entry[DocumentInformation].resource = ReceiptBundleComposition
* entry[SigningDevice].fullUrl = "urn:uuid:1413b38d-81a6-432a-a801-98d7307a422b"
* entry[SigningDevice].resource = ReceiptBundleDevice
* entry[PrescriptionDigest].fullUrl = "urn:uuid:b939a82a-9c23-4b6d-a139-f468d1b9d652"
* entry[PrescriptionDigest].resource = ReceiptBundleBinary
* signature.type[AuthorsSignature].system = "urn:iso-astm:E1762-95:2013"
* signature.type[AuthorsSignature].code = #1.2.840.10065.1.12.1.1
* signature.when = "2022-03-18T15:28:00+00:00"
* signature.who.reference = "urn:uuid:1413b38d-81a6-432a-a801-98d7307a422b"
* signature.sigFormat = #application/pkcs7-mime
* signature.data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="
