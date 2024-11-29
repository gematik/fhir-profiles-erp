Profile: GEM_ERP_PR_PAR_EU_Access_Authorization_Request
Parent: Parameters
Id: GEM-ERP-PR-PAR-EU-AccessAuthorization-Request
Title: "Access Authorization for EU ePrescriptions"
Description: "Displays Parameters for EU Access Authorization"
* insert StructureDefinition(GEM_ERP_PR_PAR_EU_Access_Authorization_Request)
* meta 1..1
* meta.versionId 1..1
* meta.versionId = "1"

* parameter 2..2
* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains 
  countryCode 1..1 MS
  and accessCode 1..1 MS
  
* parameter[countryCode]
  * name MS
  * name = "countryCode"
  * value[x] 1..1
  * value[x] only Coding
  * valueCoding.system 1..1
  * valueCoding.system = $cs-iso-3166
  * valueCoding from Iso3166-1-2 (required) // Nach VZD Profil NCPeHCountryEx
* parameter[accessCode]
  * name MS
  * name = "accessCode"
  * value[x] 1..1
  * value[x] only GEM_ERP_PR_EU_Access_Code
