Extension: GEM_ERP_EX_InsuranceProvider
Id: GEM-ERP-EX-InsuranceProvider
Description: "IK-number (Instituskennzeichen) of Insurance Provider covering the requested medication"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_InsuranceProvider"
* ^version = "1.2"
* ^status = #draft
* ^date = "2020-06-04"
* ^context.type = #element
* ^context.expression = "Communication.payload"
* . ^definition = "Optional Extension Element - found in all resources."
* value[x] only $identifier-kvid-10