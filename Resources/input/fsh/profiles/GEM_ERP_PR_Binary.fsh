Profile: GEM_ERP_PR_Binary
Parent: Binary
Id: GEM-ERP-PR-Binary
Title: "PKCS7 signed Bundle envelopig style"
Description: "PCKS7 signed ePrescription Bundle or Receipt"
* insert Meta(GEM_ERP_PR_Binary)
* contentType = #application/pkcs7-mime (exactly)
* data 1..

Instance: EBtM-Prescription-Binary
InstanceOf: Binary
Usage: #inline
* id = "34fdbc14-3fae-4626-b600-9ccddeef55e9"
* meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Binary|1.2"
* contentType = #application/octet-stream
* data = "SGllciBrw7ZubnRlIElocmUgUUVTIGVpbmVzIEUtQnRNLVJlemVwdGVzIHN0ZWhlbi4="