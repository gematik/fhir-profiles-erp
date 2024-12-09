Mapping: GEM_ERP_MAP_EU_Dispense_Data_Organization
Source: GEM_ERP_LOG_EU_DispenseData
Target: "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Organization_EU"
Id: GEM-ERP-MAP-EU-Data-Organization
Title: "Mapping for EU DispenseData to EU-Organization"
Description: "This mapping maps the logical information of the EU DispenseData to the EU-Organization"
* OrganizationData -> "GEM_ERP_PR_Organization_EU"
  * FacilityIdentifier -> "Organization.identifier"
  * OrganizationIdentifier -> "Organization.identifier"
  * OrganizationName -> "Organization.name"
  * StreetAddress -> "Organization.address.line"
  * City -> "Organization.address.city"
  * ZipOrPostalCode -> "Organization.address.postalCode"
  * StateOrProvince -> "Organization.address.state"
  * Country -> "Organization.address.country"