Extension: BeneficiaryExtension
Id: BeneficiaryExtension
Description: "The beneficiary (e.g. pharmacy) of the erx-receipt that is created when the ePrescription-workflow finishes"
* ^url = "https://gematik.de/fhir/StructureDefinition/BeneficiaryExtension"
* ^version = "1.1.1"
* ^status = #draft
* ^context.type = #element
* ^context.expression = "Composition"
* . 1..1
* . ^short = "The beneficiary of the receipt"
* . ^definition = "Optional Extension Element - found in all resources."
* value[x] only Identifier
* value[x].system = "https://gematik.de/fhir/NamingSystem/TelematikID" (exactly)