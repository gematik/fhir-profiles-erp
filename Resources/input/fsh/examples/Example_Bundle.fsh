
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
