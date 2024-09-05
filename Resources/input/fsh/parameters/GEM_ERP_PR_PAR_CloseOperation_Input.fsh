Profile: GEM_ERP_PR_PAR_CloseOperation_Input
Parent: Parameters
Id: GEM-ERP-PR-PAR-Close-Operation-Input
Title: "GEM ERP PR CloseOperation Input"
Description: "This profile defines the parameters for closing a workflow for a prescription from AVS to the E-Rezept-Fachdienst. This can be used for the Operations $close and $dispense."
* insert Profile(GEM_ERP_PR_PAR_CloseOperation_Input)

* parameter 0..* // optional durch $dispense Operation

* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains rxDispensation 0..*
  
* parameter[rxDispensation]
  * name MS
  * name = "rxDispensation"
  * value[x] 0..0
  * resource 0..0
  * obeys workflow-parameters-close-medication-exists
  * obeys workflow-parameters-close-dispense-medication-references
  * part MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "name"
    * ^slicing.rules = #closed
  * part contains
    medicationDispense 1..1 and
    medication 0..1
  * part[medicationDispense]
    * name MS
    * name = "medicationDispense"
    * value[x] 0..0
    * resource 1..1
    * resource only GEM_ERP_PR_MedicationDispense or GEM_ERP_PR_MedicationDispense_DiGA
    * part 0..0
  * part[medication]
    * name MS
    * name = "medication"
    * value[x] 0..0
    * resource 1..1
    * resource only GEM_ERP_PR_Medication
    * part 0..0

Invariant: workflow-parameters-close-medication-exists
Description: "If a reference from a MedicationDispense to a Medication exists, a Medication resource must exist."
Expression: "part.where(name = 'medicationDispense').resource.medication.ofType(Reference).exists() implies part.where(name = 'medication').exists()"
Severity: #error

Invariant: workflow-parameters-close-dispense-medication-references
Description: "If a reference from a MedicationDispense to a Medication exists, the reference must resolve to the Medication."
Expression: "part.where(name = 'medicationDispense').resource.medication.ofType(Reference).exists() implies ((part.where(name = 'medicationDispense').resource.medication.reference.split('/').last().split(':').last()) = (part.where(name = 'medication').resource.id))"
Severity: #error

