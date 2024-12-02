Mapping: GEM_ERP_MAP_EU_Dispense_Data_Organization
Source: GEM_ERP_LOG_EU_DispenseData
Target: "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Organization_EU"
Id: GEM-ERP-MAP-MedicationDispense-DiGA-Organization
Title: "Mapping for EU DispenseData to EU-Organization"
Description: "This mapping maps the logical information of the EU DispenseData to the EU-Organization"
* OrganizationData -> "Organization"
  * FacilityIdentifier -> "Organization.identifier[facilityId]"
  * OrganizationIdentifier -> "Organization.identifier[ehdsi]"
  * OrganizationName -> "Organization.name"
  * StreetAddress -> "Organization.address.line"
  * City -> "Organization.address.city"
  * ZipOrPostalCode -> "Organization.address.postalCode"
  * StateOrProvince -> "Organization.address.state"
  * Country -> "Organization.address.country"
