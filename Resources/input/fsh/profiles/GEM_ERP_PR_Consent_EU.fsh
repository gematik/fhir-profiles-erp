Profile: GEM_ERP_PR_Consent_EU
Parent: GEM_ERP_PR_Consent
Id: GEM-ERP-PR-Consent-EU
Title: "Consent for ePrescriptions in the EU"
Description: "Records the consent of the patient for an operation in the context of ePrescriptions that are to be redeemed in the EU."
* insert Profile(GEM_ERP_PR_Consent_EU)

* scope.coding = $cs-consent-scope#patient-privacy

* category from GEM_ERP_VS_ConsentType (required)
* category = GEM_ERP_CS_ConsentType#EUDISPCONS

* policyRule = v3-ActCode#OPTIN