Instance: GOFSH-GENERATED-ID-0
InstanceOf: ChargeItem
Usage: #example
* meta.profile = "https://gematik.de/fhir/StructureDefinition/ErxChargeItem|1.1.0"
* meta.tag.display = "Example for PKV billing information."
* extension.url = "https://gematik.de/fhir/StructureDefinition/MarkingFlag"
* extension.extension[0].url = "insuranceProvider"
* extension.extension[=].valueBoolean = false
* extension.extension[+].url = "subsidy"
* extension.extension[=].valueBoolean = false
* extension.extension[+].url = "taxOffice"
* extension.extension[=].valueBoolean = false
* identifier.system = "https://gematik.de/fhir/NamingSystem/PrescriptionID"
* identifier.value = "160.123.456.789.123.58"
* status = #billable
* code = $data-absent-reason#not-applicable
* subject.identifier.system = "http://fhir.de/NamingSystem/gkv/kvid-10"
* subject.identifier.value = "X234567890"
* enterer.identifier.system = "https://gematik.de/fhir/NamingSystem/TelematikID"
* enterer.identifier.value = "606358757"
* enteredDate = "2021-06-01T07:13:00+05:00"
* supportingInformation[0] = Reference(0428d416-149e-48a4-977c-394887b3d85c) "E-Rezept"
* supportingInformation[=].type = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle"
* supportingInformation[+] = Reference(72bd741c-7ad8-41d8-97c3-9aabbdd0f5b4) "Abgabedatensatz"
* supportingInformation[=].type = "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-PR-ERP-AbgabedatenBundle"
* supportingInformation[+] = Reference(160.123.456.789.123.58) "Quittung"
* supportingInformation[=].type = "https://gematik.de/fhir/StructureDefinition/ErxReceipt"