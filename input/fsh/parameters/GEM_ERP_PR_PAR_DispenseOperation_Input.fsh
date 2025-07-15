Profile: GEM_ERP_PR_PAR_DispenseOperation_Input
Parent: Parameters
Id: GEM-ERP-PR-PAR-Dispense-Operation-Input
Title: "GEM ERP PR DispenseOperation Input"
Description: "Dieses Profil definiert die Parameter für die Abgabe eines Medikaments von AVS an den E-Rezept-Fachdienst. Dies kann für die $dispense-Operation verwendet werden."
* insert Profile(GEM_ERP_PR_PAR_DispenseOperation_Input)

* parameter 1..*

* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains rxDispensation 1..*

* parameter[rxDispensation]
  * name MS
  * name = "rxDispensation"
  * value[x] 0..0
  * resource 0..0
  * obeys workflow-parameters-close-dispense-medication-references
  * part MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "name"
    * ^slicing.rules = #closed
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