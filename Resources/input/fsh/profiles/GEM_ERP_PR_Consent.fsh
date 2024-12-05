Profile: GEM_ERP_PR_Consent
Parent: Consent
Id: GEM-ERP-PR-Consent
Title: "Consent for ePrescriptions"
Description: "Records the consent of the patient for an operation in the context of ePrescription."
* insert Profile(GEM_ERP_PR_Consent)

* status = #active (exactly)
* scope.coding 1..1
  * system = $cs-consent-scope (exactly)
  * code = #patient-privacy (exactly)
  * display = "Privacy Consent" (exactly)

* category 1..1
* category from GEM_ERP_VS_ConsentType (required)
* patient 1..1
  * identifier 1..1
  * identifier only IdentifierKvid10
    * assigner MS
    * assigner.identifier MS
    * assigner.identifier only IdentifierIknr
* dateTime MS

* policyRule MS
* policyRule from GEM_ERP_VS_Consent_PolicyRule (required)