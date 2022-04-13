Profile: GEM_ERP_PR_Consent
Parent: Consent
Id: GEM-ERP-PR-Consent
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Consent"
* ^version = "1.2"
* ^status = #draft
* status = #active (exactly)
* scope MS
* scope.coding.system = "http://terminology.hl7.org/CodeSystem/consentscope" (exactly)
* scope.coding.code = #patient-privacy (exactly)
* scope.coding.display = "Privacy Consent" (exactly)
* category 1..1
* category from GEM_ERP_VS_ConsentType (extensible)
* category.coding.system = "https://gematik.de/fhir/erp/CodeSystem/ConsentType" (exactly)
* category.coding.system 1..
* category.coding.code 1..
* patient 1.. 
* patient.identifier only $identifier-kvid-10 or $identifier-pkv
* dateTime 1..
* policyRule MS



Instance: ChargeItemConsent
InstanceOf: GEM_ERP_PR_Consent
Title:   "Consent to store digital ChargeItem"
Usage: #example 
* id = "0dcc5d4c-bf24-4c06-b02e-be5bc24587e2"
* status = #active    
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy "Privacy Consent"
* category = https://gematik.de/fhir/erp/CodeSystem/ConsentType#CHARGCONS "Saving electronic charge item."
* patient.identifier.type.coding[+].system = "http://fhir.de/CodeSystem/identifier-type-de-basis"
* patient.identifier.type.coding[=].code = #PKV
* patient.identifier.value = "X234567890"
* patient.identifier.assigner.display = "Name einer privaten Krankenversicherung"
* dateTime = "2021-06-01T07:13:00+05:00"
* policyRule = http://terminology.hl7.org/CodeSystem/v3-ActCode#OPTIN