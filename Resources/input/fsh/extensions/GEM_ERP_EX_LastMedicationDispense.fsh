Extension: GEM_ERP_EX_LastMedicationDispense
Id: GEM-ERP-EX-LastMedicationDispense
Title: "Last Medication Dispense"
Description: "This extension should be used in the Task ressource. It shows the timestamp of the last dispense."
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_LastMedicationDispense"
* ^version = "1.3.0"
* ^status = #draft
* . ^short = "Timestamp which is set when a medication for this task has been dispensed."
* . ^definition = "This field allows the E-Rezept-FdV to display to the user that a medication has been dispensed before it was closed by the pharmacy."
* ^context.type = #element
* ^context.expression = "Task"
* value[x] only instant
* value[x] obeys lastmedicationdispense-ex-1

Invariant:   lastmedicationdispense-ex-1
Description: "The 'value' field must match the datetime format YYYY-MM-DDTHH:MM:SSZ"
Expression: "value.matches('^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}Z$')"
Severity: #error
