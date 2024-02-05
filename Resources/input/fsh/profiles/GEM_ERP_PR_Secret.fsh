Profile: GEM_ERP_PR_Secret
Parent: Identifier
Id: GEM-ERP-PR-Secret
Title: "Identifier Profile for Secret"
Description: "The Secret is a generated secret, that grants access to an ePrescription resource, eg. Task"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Secret"
* ^version = "1.3.0"
* ^status = #draft
* use = #official (exactly)
* system 1.. MS
* system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret" (exactly)
* value 1.. MS