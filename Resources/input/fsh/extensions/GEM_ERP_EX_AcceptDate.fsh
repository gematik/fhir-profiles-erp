Extension: GEM_ERP_EX_AcceptDate
Id: GEM-ERP-EX-AcceptDate
Title: "Date of confirmation of the prescription"
Description: "This extension should be used in the Task ressource. It stores the Date till when an insurance company will accept and pay the prescription."
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AcceptDate"
* ^version = "1.2"
* ^status = #draft
* . ^short = "Accept Date of the prescription"
* . ^definition = "Date until insurance company accepts the prescription."
* ^context.type = #element
* ^context.expression = "Task"
* value[x] only date