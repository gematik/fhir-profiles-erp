Profile: GEM_ERP_PR_Practitioner_EU
Parent: Practitioner
Id: GEM-ERP-PR-Practitioner-EU
Title: "Practitioner Information Received from the EU"
Description: "This Practitioner Profile is sent by the NCPeH when redeeming a Prescription in the EU"
* insert Profile(GEM_ERP_PR_Practitioner_EU)

* identifier 1..* MS
  * ^comment = "There are not yet specific identifier systems defined. Therefore the field system is optional, but has to be used if there is a known identifier system."
  * system MS
  * value 1..1 MS

* name only HumannameDeBasis

* name 1..* MS
  * given MS
  * family MS