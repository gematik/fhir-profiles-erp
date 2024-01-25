Extension: GEM_ERP_EX_AvailabilityState
Id: GEM-ERP-EX-AvailabilityState
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AvailabilityState"
* ^version = "1.3.0"
* ^status = #draft
* ^context.type = #element
* ^context.expression = "Communication.payload"
* value[x] only Coding
* value[x] from GEM_ERP_VS_AvailabilityStatus (required)
* value[x] ^binding.description = "Availability of medication"
* value[x].system 1..
* value[x].code 1..