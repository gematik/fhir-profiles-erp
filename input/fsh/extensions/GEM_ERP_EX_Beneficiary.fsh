Extension: GEM_ERP_EX_Beneficiary
Id: GEM-ERP-EX-Beneficiary
Description: "The beneficiary (e.g. pharmacy) of the erx-receipt that is created when the ePrescription-workflow finishes"
* insert StructureDefinition(GEM_ERP_EX_Beneficiary)
* ^context.type = #element
* ^context.expression = "Composition"
* . ^short = "The beneficiary of the receipt"
* value[x] only IdentifierTelematikId
