Extension: AcceptDate
Id: 594de19b-6426-457f-8c90-90b9e64ea582
Title: "Date of confirmation of the prescription"
Description: "This extension should be used in the Task ressource. It stores the Date till when an insurance company will accept and pay the prescription."
* ^meta.lastUpdated = "2020-04-16T13:46:53.84+00:00"
* ^url = "https://gematik.de/fhir/StructureDefinition/AcceptDate"
* ^version = "1.1.1"
* ^status = #draft
* ^date = "2020-04-16T13:46:51.3380095+00:00"
* ^context.type = #element
* ^context.expression = "Task"
* . ^short = "Date when insurance company excepts the prescription."
* . ^definition = "Optional Extension Element - found in all resources."
* url = "https://gematik.de/fhir/StructureDefinition/AcceptDate" (exactly)
* value[x] only date