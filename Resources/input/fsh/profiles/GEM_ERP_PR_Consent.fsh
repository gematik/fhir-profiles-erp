Profile: GEM_ERP_PR_Consent
Parent: Consent
Id: GEM-ERP-PR-Consent
Title: "Consent for ePrescriptions"
Description: "Records the consent of the patient for an operation in the context of ePrescription."
* ^abstract = true

* status = #active (exactly)
* scope.coding 1..1 MS

* category 1..1 MS
* category.coding 1..1 MS

* patient 1..1 MS
  * identifier 1..1 MS
  * identifier only IdentifierKvid10
    * assigner MS
    * assigner.identifier MS
    * assigner.identifier only IdentifierIknr
* dateTime MS

* policyRule MS
* policyRule from GEM_ERP_VS_Consent_PolicyRule (required)