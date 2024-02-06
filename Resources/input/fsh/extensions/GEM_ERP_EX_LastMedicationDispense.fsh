Extension: GEM_ERP_EX_LastMedicationDispense
Id: GEM-ERP-EX-LastMedicationDispense
Title: "Last Medication Dispense"
Description: "This extension should be used in the Task ressource. It shows the timestamp of the last dispense."
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_LastMedicationDispense"
* insert Versioning
* . ^short = "Timestamp which is set when a medication for this task has been dispensed. Must be stated in the format YYYY-MM-DDTHH:MM:SS(Z|±HH:MM)"
* . ^definition = "This field allows the E-Rezept-FdV to display to the user that a medication has been dispensed before it was closed by the pharmacy."
* ^context.type = #element
* ^context.expression = "Task"
* value[x] only instant
* value[x] obeys workflow-letzteAbgabeDatumsFormat

Invariant:   workflow-letzteAbgabeDatumsFormat
Description: "The 'value' field must match the datetime format up to seconds precision YYYY-MM-DDTHH:MM:SS(Z|±HH:MM)"
Expression: "value.matches('^([0-9]([0-9]([0-9][1-9]|[1-9]0)|[1-9]00)|[1-9]000)-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])T([01][0-9]|2[0-3]):[0-5][0-9]:([0-5][0-9]|60)(Z|([+-])((0[0-9]|1[0-3]):[0-5][0-9]|14:00))$')"
Severity: #error
