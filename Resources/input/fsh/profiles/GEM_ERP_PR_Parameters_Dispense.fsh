Profile: GEM_ERP_PR_Parameters_Dispense
Parent: Parameters
Id: gem-erp-pr-parameters-dispense
Title: "GEM ERP PR Parameters Dispense"
Description: "This profile defines the parameters for dispensing a medication from AVS to the E-Rezept-Fachdienst. This can be used for the Operations $close and $dispense."
* insert Profile(GEM_ERP_PR_Parameters_Dispense)

* parameter 1..*
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains rxDispensation 1..*

* parameter[rxDispensation]
  * name MS
  * name = "rxDispensation" (exactly)
  * value[x] 0..0
  * resource 0..0
  * part 2..2 MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "name"
    * ^slicing.rules = #open
  * part contains
    medicationDispense 1..1 and
    medication 1..1
  * part[medicationDispense]
    * name MS
    * name = "medicationDispense"
    * value[x] 0..0
    * resource 1..1
    * resource only GEM_ERP_PR_MedicationDispense
    * part 0..0
  * part[medication]
    * name MS
    * name = "medication"
    * value[x] 0..0
    * resource 1..1
    * resource only GEM_ERP_PR_Medication
    * part 0..0