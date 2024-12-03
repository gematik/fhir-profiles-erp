Profile: GEM_ERP_PR_Practitioner_EU
Parent: Practitioner
Id: GEM-ERP-PR-Practitioner-EU
Title: "Practitioner Information Received from the EU"
Description: "This Practitioner Profile is sent by the NCPeH when redeeming a Prescription in the EU"
* insert Profile(GEM_ERP_PR_Practitioner_EU)

* identifier 0..* MS
* identifier
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.description = "Identifier for the practitioner"
  * ^slicing.ordered = false
  
//TODO: change name of identifier
* identifier contains ehdsi 0..1

* identifier[ehdsi] MS
  * system MS
  * system = "ehdsi-dataelement-303" (exactly) //TODO: Check if this is the correct system
  * use = #official (exactly)
  * value MS

* name only HumannameDeBasis
* name 1..* MS
  * given MS
  * family MS