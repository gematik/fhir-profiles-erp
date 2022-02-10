ValueSet: DocumenttypeVS
Id: GEM-ERP-VS-DocumentType
Title: "ValueSet of Documenttype Codes"
Description: "Type of document depending on the recipient."
* ^url = "https://gematik.de/fhir/ValueSet/Documenttype"
* ^version = "1.1.1"
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.gematik.de"
* ^expansion.identifier = "fe7e0ee0-f72e-4909-bf48-7c84ff97bac5"
* ^expansion.timestamp = "2020-05-07T07:48:29+00:00"
* ^expansion.total = 3
* ^expansion.contains[0].system = "https://gematik.de/fhir/CodeSystem/Documenttype"
* ^expansion.contains[=].code = #1
* ^expansion.contains[=].display = "Health Care Provider Prescription"
* ^expansion.contains[+].system = "https://gematik.de/fhir/CodeSystem/Documenttype"
* ^expansion.contains[=].code = #2
* ^expansion.contains[=].display = "Patient Confirmation"
* ^expansion.contains[+].system = "https://gematik.de/fhir/CodeSystem/Documenttype"
* ^expansion.contains[=].code = #3
* ^expansion.contains[=].display = "Receipt"
* include codes from system DocumenttypeCS