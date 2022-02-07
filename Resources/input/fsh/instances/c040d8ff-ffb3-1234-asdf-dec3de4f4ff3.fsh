Instance: c040d8ff-ffb3-1234-asdf-dec3de4f4ff3
InstanceOf: Bundle
Usage: #example
* meta.profile = "https://gematik.de/fhir/StructureDefinition/ErxReceipt|1.1.0"
* meta.tag.display = "Beispiel Quittung für erfolgreich durchlaufenen E-Rezept-Workflow = dispensiertes E-Rezept"
* identifier.system = "https://gematik.de/fhir/NamingSystem/PrescriptionID"
* identifier.value = "160.123.456.789.123.58"
* type = #document
* timestamp = "2020-03-20T07:31:34.328+00:00"
* entry[0].fullUrl = "https://erp.zentral.erp.splitdns.ti-dienste.de/Composition/2186f464-1f9c-11ec-9621-0242ac130002"
* entry[=].resource = Inline-Instance-for-c040d8ff-ffb3-1234-asdf-dec3de4f4ff3-1
* entry[+].fullUrl = "https://erp.zentral.erp.splitdns.ti-dienste.de/Device/1"
* entry[=].resource = Inline-Instance-for-c040d8ff-ffb3-1234-asdf-dec3de4f4ff3-2
* entry[+].fullUrl = "https://erp.zentral.erp.splitdns.ti-dienste.de/Binary/Prescription123"
* entry[=].resource = Prescription123
* signature.type = urn:iso-astm:E1762-95:2013#1.2.840.10065.1.12.1.1
* signature.when = "2020-03-20T07:31:34.328+00:00"
* signature.who = Reference(https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Device/1)
* signature.sigFormat = #application/pkcs7-mime
* signature.data = "MIII FQYJ KoZI hvcN AQcC oIII BjCC CAIC AQEx DzAN Bglg hkgB ZQME AgEF ADAL"