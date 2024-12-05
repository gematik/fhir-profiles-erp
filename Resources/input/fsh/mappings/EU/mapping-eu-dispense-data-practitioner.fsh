Mapping: GEM_ERP_MAP_EU_Dispense_Data_Practitioner
Source: GEM_ERP_LOG_EU_DispenseData
Target: "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Practitioner_EU"
Id: GEM-ERP-MAP-EU-Data-Practitioner
Title: "Mapping for EU DispenseData to EU-Practitioner"
Description: "This mapping maps the logical information of the EU DispenseData to the EU-Practitioner"
* HealthCareProfessionalData
  * PersonalInformation -> "GEM_ERP_PR_Practitioner_EU"
    * HPIdentifier -> "Practitioner.identifier[ehdsi]"
    * GivenName -> "Practitioner.name.given"
    * FamilyNameSurname -> "Practitioner.family"
    * FamilyNameSurname -> "Practitioner.family.extension[nachname]"
  * ProfessionalInformation -> "GEM_ERP_PR_PractitionerRole_EU"
    * Profession -> "PractitionerRole.code"
    * MedicalSpecialty -> "PractitionerRole.specialty.text"