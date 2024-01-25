Extension: GEM_ERP_EX_LastMedicationDispense
Id: GEM-ERP-EX-LastMedicationDispense
Title: "Last Medication Dispense"
Description: "This extension should be used in the Task ressource. It shows the timestamp of the last dispense."
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_LastMedicationDispense"
* ^version = "1.2"
* ^status = #active
* . ^short = "Timestamp which is set when a medication for this task has been dispensed."
* . ^definition = "This field allows the frontend to display to the user that a medication has been dispensed before it was closed by the pharmacy."
* ^context.type = #element
* ^context.expression = "Task"
* value[x] only instant