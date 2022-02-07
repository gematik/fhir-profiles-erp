ValueSet: AvailabilityStatusVS
Id: AvailabilityStatusVS
Title: "ValueSet of AvailabilityStatus Codes"
Description: "Type of the availability status for medication availability request"
* ^url = "https://gematik.de/fhir/ValueSet/AvailabilityStatus"
* ^version = "1.1.1"
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.gematik.de"
* ^expansion.identifier = "fe7e0ee0-f72e-4909-bf48-7c84ff97bac5"
* ^expansion.timestamp = "2020-05-07T07:48:29+00:00"
* ^expansion.total = 6
* ^expansion.contains[0].system = "https://gematik.de/fhir/CodeSystem/AvailabilityStatus"
* ^expansion.contains[=].code = #10
* ^expansion.contains[=].display = "sofort verfügbar"
* ^expansion.contains[+].system = "https://gematik.de/fhir/CodeSystem/AvailabilityStatus"
* ^expansion.contains[=].code = #20
* ^expansion.contains[=].display = "noch Heute verfügbar"
* ^expansion.contains[+].system = "https://gematik.de/fhir/CodeSystem/AvailabilityStatus"
* ^expansion.contains[=].code = #30
* ^expansion.contains[=].display = "am nächsten Werktag - vormittags"
* ^expansion.contains[+].system = "https://gematik.de/fhir/CodeSystem/AvailabilityStatus"
* ^expansion.contains[=].code = #40
* ^expansion.contains[=].display = "am nächsten Werktag- nachmittags"
* ^expansion.contains[+].system = "https://gematik.de/fhir/CodeSystem/AvailabilityStatus"
* ^expansion.contains[=].code = #50
* ^expansion.contains[=].display = "nicht verfügbar"
* ^expansion.contains[+].system = "https://gematik.de/fhir/CodeSystem/AvailabilityStatus"
* ^expansion.contains[=].code = #90
* ^expansion.contains[=].display = "unbekannt"
* include codes from system AvailabilityStatusCS