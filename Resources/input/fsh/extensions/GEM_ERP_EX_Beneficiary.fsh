Extension: BeneficiaryExtension
Id: GEM-ERP-EX-Beneficiary
Description: "The beneficiary (e.g. pharmacy) of the erx-receipt that is created when the ePrescription-workflow finishes"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/BeneficiaryExtension"
* ^version = "1.2"
* ^status = #draft
* ^context.type = #element
* ^context.expression = "Composition"
* . 1..1
* . ^short = "The beneficiary of the receipt"
* . ^definition = "Optional Extension Element - found in all resources."
* value[x] only Identifier
* value[x].system = "https://gematik.de/fhir/NamingSystem/TelematikID" (exactly)