ValueSet: GEM_ERP_VS_HealthCareFacilityType_EU
Id: GEM-ERP-VS-HealthCareFacilityType-EU
Title: "ValueSet of NCPeH HealthCareFacility Types"
Description: "Type of HealthCareFacility from NCPeH"
* insert ValueSet(GEM_ERP_VS_HealthCareFacilityType_EU)
* include $cs-organization-profession-oid#1.2.276.0.76.4.53 "Krankenhaus"
* include $cs-organization-profession-oid#1.2.276.0.76.4.54 "Öffentliche Apotheke"
* include $cs-organization-profession-oid#1.2.276.0.76.4.50 "Betriebsstätte Arzt"
* include $cs-organization-profession-oid#1.2.276.0.76.4.51 "Zahnarztpraxis"

//TODO: Check if more values are needed: https://simplifier.net/vzd-fhir-directory/organizationprofessionoid