
Instance: ReceiptBundleBinary
InstanceOf: GEM_ERP_PR_Digest
Title: "Quittungs-Hash Binärdaten"
Description: "Binäre Digest-Daten für ein E-Rezept-Quittungs-Bundle"
Usage: #inline
* id = "b939a82a-9c23-4b6d-a139-f468d1b9d652"
* contentType = #application/octet-stream
* data = "tJg8c5ZtdhzEEhJ0ZpAsUVFx5dKuYgQFs5oKgthi17M="

Instance: ReceiptBundleQuittung
InstanceOf: GEM_ERP_PR_Bundle
Title: "Quittungs-Bundle für abgeschlossene Rezeptabgabe"
Description: "Beispiel für ein Quittungs-Bundle nach erfolgter Abgabe eines E-Rezepts"
Usage: #example
* id = "dffbfd6a-5712-4798-bdc8-07201eb77ab8"
* meta.tag.display = "Receipt Bundle 'Quittung' for completed dispensation of a prescription"
* identifier[+].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[=].value = "160.000.033.491.280.78"
* type = #document
* insert DateTime(timestamp)
* entry[DocumentInformation].fullUrl = "urn:uuid:c624cf47-e235-4624-af71-0a09dc9254dc"
* entry[DocumentInformation].resource = ReceiptBundleComposition
* entry[SigningDevice].fullUrl = "urn:uuid:1413b38d-81a6-432a-a801-98d7307a422b"
* entry[SigningDevice].resource = ReceiptBundleDevice
* entry[PrescriptionDigest].fullUrl = "urn:uuid:b939a82a-9c23-4b6d-a139-f468d1b9d652"
* entry[PrescriptionDigest].resource = ReceiptBundleBinary
* signature.type[AuthorsSignature].system = "urn:iso-astm:E1762-95:2013"
* signature.type[AuthorsSignature].code = #1.2.840.10065.1.12.1.1
* insert DateTime(signature.when)
* signature.who.reference = "urn:uuid:1413b38d-81a6-432a-a801-98d7307a422b"
* signature.sigFormat = #application/pkcs7-mime
* signature.data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="

Instance: Bundle-AcceptOperation
InstanceOf: GEM_ERP_PR_Bundle_OP_Accept
Usage: #example
Title: "Beispiel Accept-Bundle"
Description: "Dieses Bundle enthält den Task und das qualifiziert signierte E-Rezept für die Accept-Operation"
* type = #collection
* link[+].relation = "self"
* link[=].url = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task/160.000.033.491.280.78/$accept/"
* entry[erxTask].resource = TaskIn-ProgressState
* entry[erxTask].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task/d70932d1-9e1c-483c-b2d4-b7dced09b35e"
* entry[erxBinary].resource = PrescriptionBinaryWithMeta
* entry[erxBinary].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Binary/PrescriptionBinaryWithMeta"

Instance: KBVPrescriptionBundlePlaceholder
InstanceOf: Bundle
Title: "Platzhalter E-Rezept-Bundle (kbv.ita.erp)"
Description: "Das hier wäre ein E-Rezept Bundle aus kbv.ita.erp"
Usage: #example
* id = "f8c2298f-7c00-4a68-af29-8a2862d55d43"
* meta.tag.display = "Platzhalter: E-Rezept Bundle aus kbv.ita.erp"
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier.value = "160.000.033.491.280.78"
* type = #collection
* insert DateTime(timestamp)

Instance: KBVDiGAPrescriptionBundlePlaceholder
InstanceOf: Bundle
Title: "Platzhalter DiGA-Verordnungs-Bundle (kbv.ita.evdga)"
Description: "Das hier wäre ein DiGA-Verordnungs-Bundle aus kbv.ita.evdga"
Usage: #example
* id = "3e7f9a1c-5b2d-4c8e-a6f0-1d2b3c4e5f60"
* meta.tag.display = "Platzhalter: DiGA-Verordnungs-Bundle aus kbv.ita.evdga"
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier.value = "162.000.000.000.000.01"
* type = #collection
* insert DateTime(timestamp)
