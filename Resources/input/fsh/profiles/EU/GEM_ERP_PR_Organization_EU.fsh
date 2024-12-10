Profile: GEM_ERP_PR_Organization_EU
Parent: Organization
Id: GEM-ERP-PR-Organization-EU
Title: "Organization Information Received from the EU"
Description: "This Organization Profile is sent by the NCPeH when redeeming a Prescription in the EU"
* insert Profile(GEM_ERP_PR_Organization_EU)

* identifier 1..* MS
  * ^short = "Organization Identifier"
  * ^definition = "An identifier for the organization"
  * ^comment = "There are not yet specific identifier systems defined. Therefore the field system is optional, but has to be used if there is a known identifier system."
  * system MS
  * value 1..1 MS

* type 1..1 MS
  * ^short = "Organization Type"
  * ^definition = "States the type of the organization as: pharmacy, hospital, doctor's office, dentitst's office"
  * coding 1..1 MS
    * ^definition = "States the type of the organization as: pharmacy, hospital, doctor's office, dentitst's office"
  * coding from GEM_ERP_VS_HealthCareFacilityType_EU (required)
    * system 1..1 MS
    * code 1..1 MS
    * display 0..1 MS

* name 1..1 MS

* address 1..1 MS
  * ^comment = "The address information is required for a dispensing organization. That means that the data can either be given or also stated with a data absent reason."
  * line 1..* MS
    * ^comment = "This information is required. That means that the data can either be given or also stated with a data absent reason."
  * city 1..1 MS
    * ^comment = "This information is required. That means that the data can either be given or also stated with a data absent reason."
  * postalCode 1..1 MS
    * ^comment = "This information is required. That means that the data can either be given or also stated with a data absent reason."
  * state 1..1 MS
    * ^comment = "This information is required. That means that the data can either be given or also stated with a data absent reason."
  * country 1..1 MS
    * ^comment = "This information is required. That means that the data can either be given or also stated with a data absent reason."
