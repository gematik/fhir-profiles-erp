Extension: GEM_ERP_EX_LastMedicationDispense
Id: GEM-ERP-EX-LastMedicationDispense
Title: "Last Medication Dispense"
Description: "This extension should be used in the Task ressource. It shows the timestamp of the last dispense."
* insert StructureDefinition(GEM_ERP_EX_LastMedicationDispense)
* . ^short = "Timestamp which is set when a medication for this task has been dispensed. Stated in the format YYYY-MM-DDTHH:MM:SS(Z|±HH:MM)"
* . ^definition = "This field allows the E-Rezept-FdV to display to the user that a medication has been dispensed before it was closed by the pharmacy."
* ^context.type = #element
* ^context.expression = "Task"
* value[x] only instant
  * ^short = "Timestamp which is set when a medication for this task has been dispensed."
  * ^comment = "Stated in the format YYYY-MM-DDTHH:MM:SS(Z|±HH:MM)"

