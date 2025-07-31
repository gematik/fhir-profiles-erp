Extension: GEM_ERP_EX_Beneficiary
Id: GEM-ERP-EX-Beneficiary
Title: "Begünstigter E-Rezept-Beleg"
Description: "Der Begünstigte (z. B. Apotheke) des E-Rezept-Beleg, der erstellt wird, wenn der E-Rezept-Workflow abgeschlossen ist."
* insert StructureDefinition(GEM_ERP_EX_Beneficiary)
* ^context.type = #element
* ^context.expression = "Composition"
* . ^short = "The beneficiary of the receipt"
* value[x] only IdentifierTelematikId
