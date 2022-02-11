Extension: PrescriptionType
Id: GEM-ERP-EX-PrescriptionType
Description: "Definies the Type of a prescription."
* ^meta.lastUpdated = "2020-04-16T14:48:56.829+00:00"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/PrescriptionType"
* ^version = "1.2"
* ^status = #draft
* ^date = "2020-04-16T14:48:54.0746171+00:00"
* ^context[0].type = #element
* ^context[=].expression = "Task"
* ^context[+].type = #element
* ^context[=].expression = "Communication.payload"
* . ^definition = "Optional Extension Element - found in all resources."
* url = "https://gematik.de/fhir/StructureDefinition/PrescriptionType" (exactly)
* value[x] only Coding
* value[x] from FlowtypeVS (required)
* value[x].system 1..
* value[x].code 1..