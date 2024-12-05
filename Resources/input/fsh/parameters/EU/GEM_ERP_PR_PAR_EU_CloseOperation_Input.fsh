Profile: GEM_ERP_PR_PAR_EU_CloseOperation_Input
Parent: Parameters
Id: GEM-ERP-PR-PAR-EU-Close-Operation-Input
Title: "GEM ERP PR EU CloseOperation Input"
Description: "This profile defines the parameters for receiving dispense information for a prescription that was redeemed in the EU"
* insert Profile(GEM_ERP_PR_PAR_EU_CloseOperation_Input)

* parameter MS

* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains 
  rxDispensation 1..*
  and requestData 1..1
  and practitionerData 1..1
  and organizationData 1..1
  and practitionerRoleData 1..1

* parameter[requestData]
  * name MS
  * name = "requestData"
  * value[x] 0..0
  * resource 0..0
  * part MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "name"
    * ^slicing.rules = #closed
  * part contains
    kvnr 1..1 MS and
    accessCode 1..1 MS and
    countryCode 1..1 MS
  * part[kvnr]
    * name MS
    * name = "kvnr"
    * value[x] 1..1
    * value[x] only Identifier
    * valueIdentifier only IdentifierKvid10
    * resource 0..0
    * part 0..0
  * part[accessCode]
    * name MS
    * name = "accessCode"
    * value[x] 1..1
    * value[x] only Identifier
    * valueIdentifier only GEM_ERP_PR_Access_Code_EU
    * resource 0..0
    * part 0..0
  * part[countryCode]
    * name MS
    * name = "countryCode"
    * value[x] 1..1
    * value[x] only Coding
    * valueCoding.system 1..1
    * valueCoding.system = $cs-iso-3166
    * valueCoding from Iso3166-1-2 (required) // Nach VZD Profil NCPeHCountryEx

// Generic Data that applys to all dispensations
* parameter[practitionerData]
  * name MS
  * name = "practitionerData"
  * value[x] 0..0
  * resource only GEM_ERP_PR_Practitioner_EU
  * part 0..0
* parameter[organizationData]
  * name MS
  * name = "organizationData"
  * value[x] 0..0
  * resource only GEM_ERP_PR_Organization_EU
  * part 0..0
* parameter[practitionerRoleData]
  * name MS
  * name = "practitionerRoleData"
  * value[x] 0..0
  * resource only GEM_ERP_PR_PractitionerRole_EU
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
    * resource only GEM_ERP_PR_MedicationDispense_EU
    * part 0..0
  * part[medication]
    * name MS
    * name = "medication"
    * value[x] 0..0
    * resource 1..1
    * resource only GEM_ERP_PR_Medication
    * part 0..0
