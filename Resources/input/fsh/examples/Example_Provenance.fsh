
Instance: PractitionersNarcoticsApproval
InstanceOf: GEM_ERP_PR_BfArMApproval
Usage: #example
* id = "64d5081e-8d65-11ec-b909-0242ac120002"
* target[TaskReference].reference = "Task/160.100.000.000.024.67"
* insert DateTimeStamp(recorded)
* entity.what.identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* entity.what.identifier.value = "165.100.000.000.024.67"
* agent.who.reference = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Device/1"
* agent.onBehalfOf.identifier.system = $identifier-telematik-id
* agent.onBehalfOf.identifier.value = "1-HBA-Testkarte-883110000123465"
* signature.type.system = "urn:iso-astm:E1762-95:2013"
* signature.type.code = #1.2.840.10065.1.12.1.7
* signature.type.display = "Consent Signature"
* insert DateTime(signature.when)
* signature.who.reference = "https://www.bundesdruckerei.de/"
* signature.onBehalfOf.reference = "https://www.bfarm.de/"
* signature.sigFormat = #application/pkcs7-mime
* signature.data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="
