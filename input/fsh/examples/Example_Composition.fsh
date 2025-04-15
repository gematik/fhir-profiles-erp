
Instance: ReceiptBundleComposition
InstanceOf: GEM_ERP_PR_Composition
Title:   "Composition for Receipt Bundle 'Quittung'"
Usage: #inline
* id = "c624cf47-e235-4624-af71-0a09dc9254dc"
* extension[Beneficiary].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_Beneficiary"
* extension[Beneficiary].valueIdentifier.system = $identifier-telematik-id
* extension[Beneficiary].valueIdentifier.value = "3-SMC-B-Testkarte-883110000129070"
* status = #final
* type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#3 "Receipt"
* insert DateTime(date)
* insert DateTime(event.period.start)
* insert DateTime(event.period.end)
* author.reference = "urn:uuid:1413b38d-81a6-432a-a801-98d7307a422b"
* title = "Quittung"
* section[+].entry.reference = "urn:uuid:b939a82a-9c23-4b6d-a139-f468d1b9d652"
