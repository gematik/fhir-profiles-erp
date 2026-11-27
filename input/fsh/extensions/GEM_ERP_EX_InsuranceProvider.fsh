Extension: GEM_ERP_EX_InsuranceProvider
Id: GEM-ERP-EX-InsuranceProvider
Description: "IK-Nummer (Institutionskennzeichen) des Versicherungsträgers, der das angeforderte Medikament abdeckt"
* insert StructureDefinition(GEM_ERP_EX_InsuranceProvider)
* ^context.type = #element
* ^context.expression = "Communication.payload"
* value[x] only $identifier-iknr
* value[x] ^type[0].profile[0] = "http://fhir.de/StructureDefinition/identifier-iknr|1.5.4" //TODO: Remove with next minor version
