Extension: GEM_ERP_EX_Beneficiary
Id: GEM-ERP-EX-Beneficiary
Description: "The beneficiary (e.g. pharmacy) of the erx-receipt that is created when the ePrescription-workflow finishes"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_Beneficiary"
* ^version = "1.3.0"
* ^status = #draft
* ^context.type = #element
* ^context.expression = "Composition"
* . ^short = "The beneficiary of the receipt"
* value[x] only IdentifierTelematikId