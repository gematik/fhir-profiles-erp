Profile: GEM_ERP_PR_PAR_DispenseOperation_Output
Parent: Parameters
Id: GEM-ERP-PR-PAR-Dispense-Operation-Output
Title: "GEM ERP PR DispenseOperation Output"
Description: "Dieses Profil definiert die Parameter für die Abgabe eines Medikaments von AVS an den E-Rezept-Fachdienst. Dies kann für die $dispense-Operation verwendet werden."
* insert Profile(GEM_ERP_PR_PAR_DispenseOperation_Output)

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
  * part 1..* MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "name"
    * ^slicing.rules = #closed
  * part contains
    medicationDispense 0..1 and
    medication 0..1 and
    operationOutcome 0..1
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
  * part[operationOutcome]
    * name MS
    * name = "operationOutcome"
    * value[x] 0..0
    * resource 1..1
    * resource only OperationOutcome
    * part 0..0