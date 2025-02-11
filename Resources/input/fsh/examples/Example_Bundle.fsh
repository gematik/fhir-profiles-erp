
Instance: ReceiptBundleBinary
InstanceOf: GEM_ERP_PR_Digest
Usage: #inline
* id = "b939a82a-9c23-4b6d-a139-f468d1b9d652"
* contentType = #application/octet-stream
* data = "tJg8c5ZtdhzEEhJ0ZpAsUVFx5dKuYgQFs5oKgthi17M="

Instance: ReceiptBundleQuittung
InstanceOf: GEM_ERP_PR_Bundle
Title:   "Receipt Bundle 'Quittung' for completed dispensation of a prescription"
Usage: #example
* id = "dffbfd6a-5712-4798-bdc8-07201eb77ab8"
* meta.tag.display = "Receipt Bundle 'Quittung' for completed dispensation of a prescription"
* identifier[+].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[=].value = "160.000.033.491.280.78"
* type = #document
* insert DateTime(timestamp)
* entry[DocumentInformation].fullUrl = "urn:uuid:c624cf47-e235-4624-af71-0a09dc9254dc"
* entry[DocumentInformation].resource = ReceiptBundleComposition
* entry[SigningDevice].fullUrl = "urn:uuid:1413b38d-81a6-432a-a801-98d7307a422b"
* entry[SigningDevice].resource = ReceiptBundleDevice
* entry[PrescriptionDigest].fullUrl = "urn:uuid:b939a82a-9c23-4b6d-a139-f468d1b9d652"
* entry[PrescriptionDigest].resource = ReceiptBundleBinary
* signature.type[AuthorsSignature].system = "urn:iso-astm:E1762-95:2013"
* signature.type[AuthorsSignature].code = #1.2.840.10065.1.12.1.1
* insert DateTime(signature.when)
* signature.who.reference = "urn:uuid:1413b38d-81a6-432a-a801-98d7307a422b"
* signature.sigFormat = #application/pkcs7-mime
* signature.data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="

Instance: Bundle-AcceptOperation
InstanceOf: GEM_ERP_PR_Bundle_OP_Accept
Usage: #example
Title: "Example Accept Bundle"
Description: "This Bundle contains the Task and the qualified signed ePrescription."
* type = #collection
* link[+].relation = "self"
* link[=].url = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task/160.000.033.491.280.78/$accept/"
* entry[erxTask].resource = TaskIn-ProgressState
* entry[erxTask].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task/d70932d1-9e1c-483c-b2d4-b7dced09b35e"
* entry[erxBinary].resource = PrescriptionBinary
* entry[erxBinary].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Binary/PrescriptionBinary"