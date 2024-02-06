Profile: GEM_ERP_PR_Binary
Parent: Binary
Id: GEM-ERP-PR-Binary
Title: "PKCS7 signed Bundle envelopig style"
Description: "PCKS7 signed ePrescription Bundle or Receipt"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Binary"
* insert Versioning
* meta 1..1
* meta.profile 1..1
* insert PackageProfileExactly(StructureDefinition/GEM_ERP_PR_Binary)
* contentType = #application/pkcs7-mime (exactly)
* data 1..
