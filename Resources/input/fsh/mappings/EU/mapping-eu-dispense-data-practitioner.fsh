Mapping: GEM_ERP_MAP_EU_Dispense_Data_Practitioner
Source: GEM_ERP_LOG_EU_DispenseData
Target: "GEM_ERP_PR_EUPractitioner"
Id: GEM-ERP-MAP-MedicationDispense-DiGA-Practitioner
Title: "Mapping for EU DispenseData to EU-Practitioner"
Description: "This mapping maps the logical information of the EU DispenseData to the EU-Practitioner"
* HealthCareProfessionalData -> "GEM_ERP_PR_EUPractitioner"
  * HPIdentifier -> "GEM_ERP_PR_EUPractitioner.identifier[ehdsi]"
  * GivenName -> "GEM_ERP_PR_EUPractitioner.name.given"
  * FamilyNameSurname -> "GEM_ERP_PR_EUPractitioner.family"
  * FamilyNameSurname -> "GEM_ERP_PR_EUPractitioner.family.extension[nachname]"