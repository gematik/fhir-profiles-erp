Profile: ErxConsent
Parent: Consent
Id: b1857d38-8a68-11ec-a8a3-0242ac120002
* ^url = "https://gematik.de/fhir/StructureDefinition/ErxConsent"
* ^version = "1.1.1"
* ^status = #draft
* status MS
* scope MS
* scope.coding.system = "http://terminology.hl7.org/CodeSystem/consentscope" (exactly)
* scope.coding.code = #patient-privacy (exactly)
* scope.coding.display = "Privacy Consent" (exactly)
* category from ConsentTypeVS (extensible)
* category.coding.system = "https://gematik.de/fhir/CodeSystem/Consenttype" (exactly)
* patient 1.. MS
* patient.identifier only $identifier-kvid-10
* dateTime 1.. MS
* policyRule MS