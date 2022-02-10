Profile: Gem_baseTelematikID
Parent: Identifier
Id: b1857946-8a68-11ec-a8a3-0242ac120002
Title: "Identifier Profile for Telematik ID"
* ^url = "https://gematik.de/fhir/StructureDefinition/BaseTelematikID"
* ^version = "1.1.1"
* ^status = #draft
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.gematik.de"
* . ^definition = "An identifier - identifies some entity uniquely and unambiguously. Typically this is used for business identifiers."
* system 1..
* system = "https://gematik.de/fhir/NamingSystem/TelematikID" (exactly)
* value 1..