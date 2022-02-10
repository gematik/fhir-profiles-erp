Extension: InsuranceProvider
Id: 4a694e6c-8a69-11ec-a8a3-0242ac120002
Description: "IK-number (Instituskennzeichen) of Insurance Provider covering the requested medication"
* ^url = "https://gematik.de/fhir/StructureDefinition/InsuranceProvider"
* ^version = "1.1.1"
* ^status = #draft
* ^date = "2020-06-04"
* ^context.type = #element
* ^context.expression = "Communication.payload"
* . ^definition = "Optional Extension Element - found in all resources."
* value[x] only $identifier-iknr