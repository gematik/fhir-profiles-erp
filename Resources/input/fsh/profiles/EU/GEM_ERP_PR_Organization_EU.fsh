Profile: GEM_ERP_PR_Organization_EU
Parent: Organization
Id: GEM-ERP-PR-Organization-EU
Title: "Organization Information Received from the EU"
Description: "This Organization Profile is sent by the NCPeH when redeeming a Prescription in the EU"
* insert Profile(GEM_ERP_PR_Organization_EU)

* identifier 0..* MS
* identifier
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.description = "Identifier for the practitioner"
  * ^slicing.ordered = false
  
//TODO: change name of identifier
* identifier contains 
  ehdsi 0..1 MS
  and facilityId 0..1 MS

* identifier[ehdsi]
  * system MS
  * system = "ehdsi-dataelement-285" (exactly) //TODO: Check if this is the correct system
  * use = #official (exactly)
  * value MS

* identifier[facilityId]
  * system MS
  * system = "facilityId" (exactly) //TODO: Check if this is the correct system
  * use = #official (exactly)
  * value MS

* type 1..1 MS
  * coding 1..1 MS
  * coding from GEM_ERP_VS_HealthCareFacilityType_EU (required)
    * system 1..1 MS
    * code 1..1 MS
    * display 0..1 MS

* name 1..1 MS

* address 0..1 MS
  * line MS
  * city MS
  * postalCode MS
  * state MS
  * country MS
