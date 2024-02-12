Extension: GEM_ERP_EX_InsuranceProvider
Id: GEM-ERP-EX-InsuranceProvider
Description: "IK-number (Instituskennzeichen) of Insurance Provider covering the requested medication"
* insert StructureDefinition(GEM_ERP_EX_InsuranceProvider)
* ^context.type = #element
* ^context.expression = "Communication.payload"
* value[x] only $identifier-iknr
