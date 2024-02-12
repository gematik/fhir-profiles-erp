ValueSet: GEM_ERP_VS_FlowType
Id: GEM-ERP-VS-FlowType
Title: "ValueSet of Flowtype Codes"
Description: "Shows the different types of the ePrescription according to the prescription forms."
* insert ValueSet(GEM_ERP_VS_FlowType)
//* ^expansion.identifier = "fe7e0ee0-f72e-4909-bf48-7c84ff97bac5"
//* ^expansion.timestamp = "2022-02-07T07:48:29+00:00"
//* ^expansion.total = 5
//* ^expansion.contains[+].system = "https://gematik.de/fhir/erp/CodeSystem/FlowType"
//* ^expansion.contains[=].code = #160
//* ^expansion.contains[=].display = "Muster 16 (Apothekenpflichtige Arzneimittel)"
//* ^expansion.contains[+].system = "https://gematik.de/fhir/erp/CodeSystem/FlowType"
//* ^expansion.contains[=].code = #165
//* ^expansion.contains[=].display = "Muster 16 (Betäubungsmittel)"
//* ^expansion.contains[+].system = "https://gematik.de/fhir/erp/CodeSystem/FlowType"
//* ^expansion.contains[=].code = #166
//* ^expansion.contains[=].display = "Muster 16 (T-Rezepte)"
//* ^expansion.contains[+].system = "https://gematik.de/fhir/erp/CodeSystem/FlowType"
//* ^expansion.contains[=].code = #169
//* ^expansion.contains[=].display = "Muster 16 (Direkte Zuweisung)"
//* ^expansion.contains[+].system = "https://gematik.de/fhir/erp/CodeSystem/FlowType"
//* ^expansion.contains[=].code = #200
//* ^expansion.contains[=].display = "PKV (Apothekenpflichtige Arzneimittel)"
//* ^expansion.contains[=].code = #209
//* ^expansion.contains[=].display = "PKV (Direkte Zuweisung)"
* include codes from system GEM_ERP_CS_FlowType
