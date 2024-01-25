Extension: GEM_ERP_EX_ExpiryDate
Id: GEM-ERP-EX-ExpiryDate
Title: "Presciption expiry date"
Description: "This extension should be used in the Task ressource. It shows the presciption expiry date."
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate"
* ^version = "1.3.0"
* ^status = #active
* . ^short = "Expiry Date of the Prescription"
* . ^definition = "Date when the prescription is expired and can not be redeemed in the pharmacy."
* ^context.type = #element
* ^context.expression = "Task"
* value[x] only date