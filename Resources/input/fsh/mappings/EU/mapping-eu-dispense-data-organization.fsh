Mapping: GEM_ERP_MAP_EU_Dispense_Data_Organization
Source: GEM_ERP_LOG_EU_DispenseData
Target: "GEM_ERP_PR_EUOrganization"
Id: GEM-ERP-MAP-MedicationDispense-DiGA-Organization
Title: "Mapping for EU DispenseData to EU-Organization"
Description: "This mapping maps the logical information of the EU DispenseData to the EU-Organization"
* OrganizationData -> "GEM_ERP_PR_EUOrganization"
  * FacilityIdentifier -> "GEM_ERP_PR_EUOrganization.identifier[facilityId]"
  * OrganizationIdentifier -> "GEM_ERP_PR_EUOrganization.identifier[ehdsi]"
  * OrganizationName -> "GEM_ERP_PR_EUOrganization.name"
  * StreetAddress -> "GEM_ERP_PR_EUOrganization.address.line"
  * City -> "GEM_ERP_PR_EUOrganization.address.city"
  * ZipOrPostalCode -> "GEM_ERP_PR_EUOrganization.address.postalCode"
  * StateOrProvince -> "GEM_ERP_PR_EUOrganization.address.state"
  * Country -> "GEM_ERP_PR_EUOrganization.address.country"
