Extension: GEM_ERP_EX_PrescriptionType
Id: GEM-ERP-EX-PrescriptionType
Title: "GEM ERP EX PrescriptionType"
Description: "Definiert den Typ eines Rezepts."
* insert StructureDefinition(GEM_ERP_EX_PrescriptionType)
* . ^short = "Art der Verschreibung"
* . ^definition = "Definiert den Typ des Rezepts. Das Codesystem enthält alle unterstützten Formulare."
* ^context[0].type = #element
* ^context[=].expression = "Task"
* ^context[+].type = #element
* ^context[=].expression = "Communication.payload"
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only Coding
* value[x] from GEM_ERP_VS_FlowType (required)
* value[x].system 1..
* value[x].code 1..
