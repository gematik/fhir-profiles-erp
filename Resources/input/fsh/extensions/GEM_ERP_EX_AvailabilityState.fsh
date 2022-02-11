Extension: AvailabilityStateExtension
Id: GEM-ERP-EX-AvailabilityState
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/AvailabilityStateExtension"
* ^version = "1.2"
* ^status = #draft
* ^context.type = #element
* ^context.expression = "Communication.payload"
* . ^definition = "Optional Extension Element - found in all resources."
* value[x] only Coding
* value[x] from AvailabilityStatusVS (required)
* value[x] ^binding.description = "Availability of medication"
* value[x].system 1..
* value[x].code 1..