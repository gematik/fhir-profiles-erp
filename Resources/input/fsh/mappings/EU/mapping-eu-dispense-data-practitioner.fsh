Mapping: GEM_ERP_MAP_EU_Dispense_Data_Practitioner
Source: GEM_ERP_LOG_EU_DispenseData
Target: "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Practitioner_EU"
Id: GEM-ERP-MAP-MedicationDispense-DiGA-Practitioner
Title: "Mapping for EU DispenseData to EU-Practitioner"
Description: "This mapping maps the logical information of the EU DispenseData to the EU-Practitioner"
* HealthCareProfessionalData -> "Practitioner"
  * HPIdentifier -> "Practitioner.identifier[ehdsi]"
  * GivenName -> "Practitioner.name.given"
  * FamilyNameSurname -> "Practitioner.family"
  * FamilyNameSurname -> "Practitioner.family.extension[nachname]"