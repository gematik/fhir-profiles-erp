ValueSet: GEM_ERP_VS_AvailabilityStatus
Id: GEM-ERP-VS-AvailabilityStatus
Title: "ValueSet of AvailabilityStatus Codes"
Description: "Type of the availability status for medication availability request"
* ^url = "https://gematik.de/fhir/erp/ValueSet/GEM_ERP_VS_AvailabilityStatus"
* ^version = "1.2"
* ^status = #draft
* ^publisher = "gematik GmbH"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.gematik.de"
//* ^expansion.identifier = "fe7e0ee0-f72e-4909-bf48-7c84ff97bac5"
//* ^expansion.timestamp = "2020-05-07T07:48:29+00:00"
//* ^expansion.total = 6
//* ^expansion.contains[0].system = "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_AvailabilityStatus"
//* ^expansion.contains[=].code = #10
//* ^expansion.contains[=].display = "sofort verfügbar"
//* ^expansion.contains[+].system = "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_AvailabilityStatus"
//* ^expansion.contains[=].code = #20
//* ^expansion.contains[=].display = "noch heute verfügbar"
//* ^expansion.contains[+].system = "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_AvailabilityStatus"
//* ^expansion.contains[=].code = #30
//* ^expansion.contains[=].display = "am nächsten Werktag - vormittags"
//* ^expansion.contains[+].system = "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_AvailabilityStatus"
//* ^expansion.contains[=].code = #40
//* ^expansion.contains[=].display = "am nächsten Werktag- nachmittags"
//* ^expansion.contains[+].system = "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_AvailabilityStatus"
//* ^expansion.contains[=].code = #50
//* ^expansion.contains[=].display = "nicht verfügbar"
//* ^expansion.contains[+].system = "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_AvailabilityStatus"
//* ^expansion.contains[=].code = #90
//* ^expansion.contains[=].display = "unbekannt"
* include codes from system GEM_ERP_CS_AvailabilityStatus