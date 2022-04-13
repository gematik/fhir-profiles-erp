Extension: GEM_ERP_EX_PrescriptionType
Id: GEM-ERP-EX-PrescriptionType
Description: "Definies the Type of a prescription."
* ^meta.lastUpdated = "2020-04-16T14:48:56.829+00:00"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* ^version = "1.2"
* ^status = #draft
* ^date = "2020-04-16T14:48:54.0746171+00:00"
* ^context[0].type = #element
* ^context[=].expression = "Task"
* ^context[+].type = #element
* ^context[=].expression = "Communication.payload"
* . ^definition = "Optional Extension Element - found in all resources."
* url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType" (exactly)
* value[x] only code
* valueCode from GEM_ERP_VS_FlowType (required)
//* value[x].system 1..
//* value[x].code 1..