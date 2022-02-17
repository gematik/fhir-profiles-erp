Profile: GEM_ERP_PR_Consent
Parent: Consent
Id: GEM-ERP-PR-Consent
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Consent"
* ^version = "1.2"
* ^status = #draft
* status MS
* scope MS
* scope.coding.system = "http://terminology.hl7.org/CodeSystem/consentscope" (exactly)
* scope.coding.code = #patient-privacy (exactly)
* scope.coding.display = "Privacy Consent" (exactly)
* category from GEM_ERP_VS_ConsentType (extensible)
* category.coding.system = "https://gematik.de/fhir/erp/CodeSystem/ConsentType" (exactly)
* patient 1.. MS
* patient.identifier only $identifier-kvid-10
* dateTime 1.. MS
* policyRule MS