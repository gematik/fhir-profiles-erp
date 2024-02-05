Extension: GEM_ERP_EX_InsuranceProvider
Id: GEM-ERP-EX-InsuranceProvider
Description: "IK-number (Instituskennzeichen) of Insurance Provider covering the requested medication"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_InsuranceProvider"
* ^version = "1.3.0"
* ^status = #draft
* ^context.type = #element
* ^context.expression = "Communication.payload"
* value[x] only $identifier-iknr