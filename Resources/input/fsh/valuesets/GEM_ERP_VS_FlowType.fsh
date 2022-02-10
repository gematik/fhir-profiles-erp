ValueSet: FlowtypeVS
Id: 4a694a48-8a69-11ec-a8a3-0242ac120002
Title: "ValueSet of Flowtype Codes"
Description: "Shows the different types of the ePrescription according to the prescription forms."
* ^url = "https://gematik.de/fhir/ValueSet/Flowtype"
* ^version = "1.1.1"
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.gematik.de"
* ^expansion.identifier = "fe7e0ee0-f72e-4909-bf48-7c84ff97bac5"
* ^expansion.timestamp = "2020-05-07T07:48:29+00:00"
* ^expansion.total = 7
* ^expansion.contains[0].system = "https://gematik.de/fhir/CodeSystem/Flowtype"
* ^expansion.contains[=].code = #160
* ^expansion.contains[=].display = "Muster 16 (Apothekenpflichtige Arzneimittel)"
* ^expansion.contains[+].system = "https://gematik.de/fhir/CodeSystem/Flowtype"
* ^expansion.contains[=].code = #169
* ^expansion.contains[=].display = "Muster 16 (Direkte Zuweisung)"
* ^expansion.contains[+].system = "https://gematik.de/fhir/CodeSystem/Flowtype"
* ^expansion.contains[=].code = #200
* ^expansion.contains[=].display = "PKV (Apothekenpflichtige Arzneimittel)"
* include codes from system FlowtypeCS