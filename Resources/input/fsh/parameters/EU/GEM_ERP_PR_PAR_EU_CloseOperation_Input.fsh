Profile: GEM_ERP_PR_PAR_EU_CloseOperation_Input
Parent: Parameters
Id: GEM-ERP-PR-PAR-EU-Close-Operation-Input
Title: "GEM ERP PR EU CloseOperation Input"
Description: "This profile defines the parameters for receiving dispense information for a prescription that was redeemed in the EU"
* insert Profile(GEM_ERP_PR_PAR_EU_CloseOperation_Input)

* parameter 3..*

* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains 
  rxDispensation 1..*
  and practitionerData 1..1
  and organizationData 1..1
  and practitionerRoleData 1..1

// Generic Data that applys to all dispensations
* parameter[practitionerData]
  * name MS
  * name = "practitionerData"
  * value[x] 0..0
  * resource only GEM_ERP_PR_EUPractitioner
  * part 0..0
* parameter[organizationData]
  * name MS
  * name = "organizationData"
  * value[x] 0..0
  * resource only GEM_ERP_PR_EUOrganization
  * part 0..0
* parameter[practitionerRoleData]
  * name MS
  * name = "practitionerRoleData"
  * value[x] 0..0
  * resource only GEM_ERP_PR_EUPractitionerRole
  * part 0..0

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
