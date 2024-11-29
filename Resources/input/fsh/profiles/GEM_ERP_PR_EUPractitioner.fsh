Profile: GEM_ERP_PR_EUPractitioner
Parent: Practitioner
Id: GEM-ERP-PR-EUPractitioner
Title: "Practitioner Information Received from the EU"
Description: "This Practitioner Profile is sent by the NCPeH when redeeming a Prescription in the EU"
* insert Profile(GEM_ERP_PR_EUPractitioner)

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
  * system = "ehdsi-dataelement-303" (exactly) //TODO: Check if this is the correct system
  * use = #official (exactly)
  * value MS

* name 1..1 MS
* name only HumannameDeBasis

* address 0..1 MS
  * line MS
  * city MS
  * postalCode MS
  * state MS
  * country MS
