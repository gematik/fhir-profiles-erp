Extension: GEM_ERP_EX_AvailabilityState
Id: GEM-ERP-EX-AvailabilityState
Title: "GEM ERP EX AvailabilityState"
Description: "Extension zur Angabe von Typ des Verfügbarkeitsstatus für die Anfrage zur Medikamentenverfügbarkeit."
* insert StructureDefinition(GEM_ERP_EX_AvailabilityState)
* ^context.type = #element
* ^context.expression = "Communication.payload"
* value[x] only Coding
* value[x] from GEM_ERP_VS_AvailabilityStatus (required)
* value[x] ^binding.description = "Availability of medication"
* value[x].system 1..
* value[x].code 1..
