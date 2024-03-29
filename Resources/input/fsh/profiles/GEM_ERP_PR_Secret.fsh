Profile: GEM_ERP_PR_Secret
Parent: Identifier
Id: GEM-ERP-PR-Secret
Title: "Identifier Profile for Secret"
Description: "The Secret is a generated secret, that grants access to an ePrescription resource, eg. Task"
* insert StructureDefinition(GEM_ERP_PR_Secret)
* use = #official (exactly)
* system 1.. MS
* system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret" (exactly)
* value 1.. MS
  * ^short = "Secret for the dispensing pharmacy."
  * ^definition = "The secret that the pharmacy receives when the ePrescription is being accepted from the ePrescription server."
