Profile: GEM_ERP_PR_EU_Access_Code
Parent: Identifier
Id: GEM-ERP-PR-EU-AccessCode
Title: "Identifier Profile for EU AccessCode"
Description: "The AccessCode that is generated by the FdV in order to access the ePrescription in an EU country."
* insert StructureDefinition(GEM_ERP_PR_EU_Access_Code)
* use = #official (exactly)
* system 1..1 MS
* system = $eu-access-code-ns
* value 1..1 MS
  * ^short = "The AccessCode"
  * ^comment = "6-digit code that is generated by the FdV in order to access the ePrescription in an EU country."
