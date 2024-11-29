Profile: GEM_ERP_PR_EUOrganization
Parent: Organization
Id: GEM-ERP-PR-EUOrganization
Title: "Organization Information Received from the EU"
Description: "This Organization Profile is sent by the NCPeH when redeeming a Prescription in the EU"
* insert Profile(GEM_ERP_PR_EUOrganization)

* identifier 0..*
* identifier
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.description = "Identifier for the practitioner"
  * ^slicing.ordered = false
  
* identifier contains ehdsi 0..1

* identifier[ehdsi]
  * system MS
  * system = "ehdsi-dataelement-285" (exactly) //TODO: Check if this is the correct system
  * use = #official (exactly)
  * value MS

* name 1..1 MS
