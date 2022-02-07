Instance: GOFSH-GENERATED-ID-2
InstanceOf: Consent
Usage: #example
* meta.profile = "https://gematik.de/fhir/StructureDefinition/ErxConsent|1.1.0"
* meta.tag.display = "Example for a Consent Document for saving a ChargeItem"
* status = #active
* scope = $consentscope#patient-privacy "Privacy Consent"
* category = $Consenttype#CHARGCONS "Consent for saving electronic charge item"
* patient.identifier.system = "http://fhir.de/NamingSystem/gkv/kvid-10"
* patient.identifier.value = "X123456789"
* dateTime = "2021-06-01T07:13:00+05:00"
* policyRule = $v3-ActCode#OPTIN