Profile: GEM_ERP_PR_Organization_EU
Parent: Organization
Id: GEM-ERP-PR-Organization-EU
Title: "Organization Information Received from the EU"
Description: "This Organization Profile is sent by the NCPeH when redeeming a Prescription in the EU"
* insert Profile(GEM_ERP_PR_Organization_EU)

* identifier 1..* MS

* identifier
  * system MS
  * value 1..1 MS

* type 1..1 MS
  * coding 1..1 MS
  * coding from GEM_ERP_VS_HealthCareFacilityType_EU (required)
    * system 1..1 MS
    * code 1..1 MS
    * display 0..1 MS

* name 1..1 MS

* address 1..1 MS
  * line 1..* MS
  * city 1..1 MS
  * postalCode 1..1 MS
  * state 1..1 MS
  * country 1..1 MS
