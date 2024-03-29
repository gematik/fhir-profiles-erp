Extension: GEM_ERP_EX_AcceptDate
Id: GEM-ERP-EX-AcceptDate
Title: "Date of confirmation of the prescription"
Description: "This extension should be used in the Task ressource. It stores the Date till when an insurance company will accept and pay the prescription."
* insert StructureDefinition(GEM_ERP_EX_AcceptDate)
* . ^short = "Accept Date of the prescription"
* . ^definition = "Date until insurance company accepts the prescription."
* ^context.type = #element
* ^context.expression = "Task"
* value[x] only date
