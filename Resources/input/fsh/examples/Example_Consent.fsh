
Instance: ExampleEUConsent
InstanceOf: GEM_ERP_PR_Consent
Title: "Example for a Consent to redeem EU Prescritptions"
Usage: #example
* id = "f97a0772-c99f-4159-90c6-2a41c7d96779"
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_Consent)

* scope = $cs-consent-scope#patient-privacy "Privacy Consent"
* category = GEM_ERP_CS_ConsentType#EUDISPCONS "Consent for redeeming e-prescriptions in EU countries"
* patient.identifier.value = "X123456789"
* patient.identifier.assigner.identifier.value = "98765543"
* dateTime = "2025-10-01T12:03:23Z"
* policyRule = v3-ActCode#OPTIN

Instance: ExampleGetConsent
InstanceOf: Bundle
Title: "Example for a Bundle with a Consent"
Usage: #example
* type = #searchset
* timestamp = "2025-10-01T12:03:23Z"
* total = 1
* entry.fullUrl = "https://erp-dev.zentral.erp.splitdns.ti-dienste.de/Consent/f97a0772-c99f-4159-90c6-2a41c7d96779"
* entry.resource = ExampleEUConsent