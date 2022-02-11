CodeSystem: AvailabilityStatusCS
Id: GEM-ERP-CS-AvailabilityStatus
Title: "CodeSystem of AvailabilityStatus"
Description: "Type of the availability status for medication availability request."
* ^url = "https://gematik.de/fhir/erp/CodeSystem/AvailabilityStatus"
* ^version = "1.2"
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.gematik.de"
* ^copyright = "gematik GmbH"
* ^caseSensitive = true
* ^content = #complete
* #10 "sofort verfügbar"
* #20 "noch Heute verfügbar"
* #30 "am nächsten Werktag - vormittags"
* #40 "am nächsten Werktag- nachmittags"
* #50 "nicht verfügbar"
* #90 "unbekannt"