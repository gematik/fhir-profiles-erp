Profile: GEM_ERP_PR_PAR_EU_GET_Prescription_Input
Parent: Parameters
Id: GEM-ERP-PR-PAR-EU-GET-Prescription-Input
Title: "GEM_ERP_PR_PAR_EU_GET_Prescription_Input"
Description: "This profile defines the parameters for receiving dispense information for a prescription that was redeemed in the EU"
* insert Profile(GEM_ERP_PR_PAR_EU_GET_Prescription_Input)

* parameter MS

* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains 
  requestData 1..1

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
    requesttype 1..1 MS and
    kvnr 1..1 MS and
    zugriffscode 1..1 MS and
    countryCode 1..1 MS and
    practitionerName 1..1 MS and
    practitionerRole 1..1 MS and
    pointOfCare 1..1 MS and
    healthcare-facility-type 1..1 MS
  * part[requesttype]
    * name MS
    * name = "requesttype"
    * value[x] 1..1
    * value[x] only Coding
    * valueCoding from GEM_ERP_VS_RequestType_EU (required)
    * resource 0..0
    * part 0..0
  * part[kvnr]
    * name MS
    * name = "kvnr"
    * value[x] 1..1
    * value[x] only Identifier
    * value[x] only IdentifierKvid10
    * resource 0..0
    * part 0..0
  * part[zugriffscode]
    * name MS
    * name = "zugriffscode"
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
  * part[practitionerName]
    * name MS
    * name = "practitionerName"
    * value[x] 1..1
    * value[x] only string
    * resource 0..0
    * part 0..0
  * part[practitionerRole]
    * name MS
    * name = "practitionerRole"
    * value[x] 1..1
    * value[x] only string
    * resource 0..0
    * part 0..0
  * part[pointOfCare]
    * name MS
    * name = "pointOfCare"
    * value[x] 1..1
    * value[x] only string
    * resource 0..0
    * part 0..0
  * part[healthcare-facility-type]
    * name MS
    * name = "healthcare-facility-type"
    * value[x] 1..1
    * resource 0..0
    * part 0..0

