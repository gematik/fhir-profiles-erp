Extension: GEM_ERP_EX_Beneficiary
Id: GEM-ERP-EX-Beneficiary
Description: "The beneficiary (e.g. pharmacy) of the erx-receipt that is created when the ePrescription-workflow finishes"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_Beneficiary"
* ^version = "1.2"
* ^status = #draft
* ^context.type = #element
* ^context.expression = "Composition"
* . 1..1
* . ^short = "The beneficiary of the receipt"
* . ^definition = "Optional Extension Element - found in all resources."
//* value[x] only Identifier
//* value[x].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_TelematikId" (exactly)
* value[x] only IdentifierTelematikId