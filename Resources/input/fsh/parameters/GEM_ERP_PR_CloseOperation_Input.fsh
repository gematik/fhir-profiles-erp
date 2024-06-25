Profile: GEM_ERP_PR_CloseOperation_Input
Parent: Parameters
Id: gem-erp-pr-close-operation-input
Title: "GEM ERP PR CloseOperation Input"
Description: "This profile defines the parameters for closing a workflow for a prescription from AVS to the E-Rezept-Fachdienst. This can be used for the Operations $close and $dispense."
* insert Profile(GEM_ERP_PR_CloseOperation_Input)

* parameter 0..*
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains rxDispensation 1..*
  
* parameter[rxDispensation]
  * name MS
  * name = "rxDispensation" (exactly)
  * value[x] 0..0
  * resource 0..0
  * part 1..2 MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "name"
    * ^slicing.rules = #open
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