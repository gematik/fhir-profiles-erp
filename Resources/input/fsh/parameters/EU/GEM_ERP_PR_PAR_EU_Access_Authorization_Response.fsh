Profile: GEM_ERP_PR_PAR_EU_Access_Authorization_Response
Parent: Parameters
Id: GEM-ERP-PR-PAR-EU-AccessAuthorization-Response
Title: "Response Access Authorization for EU ePrescriptions"
Description: "Displays Response Parameters for EU Access Authorization"
* insert Profile(GEM_ERP_PR_PAR_EU_Access_Authorization_Response)

* parameter 4..4
* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains 
  countryCode 1..1 MS 
  and accessCode 1..1 MS
  and validUntil 1..1 MS 
  and createdAt 1..1 MS
  
* parameter[countryCode]
  * name MS
  * name = "countryCode"
  * value[x] 1..1
  * value[x] only Coding
  * valueCoding.system 1..1
  * valueCoding.system = $cs-iso-3166
  * valueCoding from Iso3166-1-2 (required) // Nach VZD Profil NCPeHCountryEx
  * resource 0..0

* parameter[accessCode]
  * name MS
  * name = "accessCode"
  * value[x] 1..1
  * value[x] only GEM_ERP_PR_Access_Code_EU
  * resource 0..0

* parameter[validUntil]
  * name MS
  * name = "validUntil"
  * value[x] 1..1
  * value[x] only instant
  * resource 0..0

* parameter[createdAt]
  * name MS
  * name = "createdAt"
  * value[x] 1..1
  * value[x] only instant
  * resource 0..0
