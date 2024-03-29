Profile: GEM_ERP_PR_AccessCode
Parent: Identifier
Id: GEM-ERP-PR-AccessCode
Title: "Identifier Profile for Prescription IDs"
Description: "The AccessCode is a generated secret, that grants access to an ePrescription resource, eg. Task"
* insert StructureDefinition(GEM_ERP_PR_AccessCode)
* use = #official (exactly)
* system 1.. MS
* system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode" (exactly)
* value 1.. MS
  * ^comment = "Datamodel can be found in gemSpec_DM_eRp"
