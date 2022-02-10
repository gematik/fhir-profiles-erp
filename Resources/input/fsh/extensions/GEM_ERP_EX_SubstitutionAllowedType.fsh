Extension: SubstitutionAllowedType
Id: GEM-ERP-EX-SubstitutionAllowedType
* ^url = "https://gematik.de/fhir/StructureDefinition/SubstitutionAllowedType"
* ^version = "1.1.1"
* ^status = #draft
* ^context.type = #element
* ^context.expression = "Communication.payload"
* . ^short = "Extension for aut idem substitution allowed"
* . ^definition = "Aut idem substitution allowed according to MedicationRequest.substitution.allowed - field\r\ntrue = aut idem (substitution allowed), false = not allowed"
* value[x] 1..
* value[x] only boolean
* value[x] ^short = "Aut idem substitution allowed"
* value[x] ^definition = "Aut idem substitution allowed according to MedicationRequest.substitution.allowed - field\r\ntrue = aut idem (substitution allowed), false = not allowed"