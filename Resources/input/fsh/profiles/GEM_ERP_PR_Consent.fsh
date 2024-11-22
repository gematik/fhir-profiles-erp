Profile: GEM_ERP_PR_Consent
Parent: Consent
Id: GEM-ERP-PR-Consent
Title: "Consent for ePrescriptions"
Description: "Records the consent of the patient for an operation in the context of ePrescription."
//* insert ProfileNoMetaProfileFixed(GEM_ERP_PR_Consent)

* insert StructureDefinition({name})
* meta 1..1
  * profile 1..*
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "value"
    * ^slicing.rules = #open
    * ^slicing.description = "Slicing for profiles"
    * ^slicing.ordered = false

  * profile contains consent 1..1
  * profile[consent] = "https://gematik.de/fhir/erp/GEM_ERP_PR_Consent|1.5" (exactly)
  

* status = #active (exactly)
* scope.coding 1..1
  * system = "http://terminology.hl7.org/CodeSystem/consentscope" (exactly)
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
* dateTime 1..1

* policyRule MS
* policyRule from GEM_ERP_VS_Consent_PolicyRule (required)