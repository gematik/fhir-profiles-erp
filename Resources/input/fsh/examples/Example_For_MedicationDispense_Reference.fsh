Instance: SimpleMedicationDispenseBundle
InstanceOf: Bundle
Title:   "Example for Simple MedicationDispense with Medication"
Usage: #example
* type = #searchset
* entry[+].fullUrl = "urn:uuid:09796bf6-e84b-487c-878c-736affcd0a1f"
* entry[=].resource = Simple-MedicationDispense
* entry[+].fullUrl = "urn:uuid:86ce7563-9819-4dfa-9944-d307f7cfec9b"
* entry[=].resource = Simple-Medication


Instance: MultipleMedicationDispenseBundle
InstanceOf: Bundle
Title:   "Example for Multiple MedicationDispense with Medication for a Task"
Usage: #example
* type = #searchset
* entry[+].fullUrl = "urn:uuid:09796bf6-e84b-487c-878c-736affcd0a1f"
* entry[=].resource = Simple-MedicationDispense
* entry[+].fullUrl = "urn:uuid:86ce7563-9819-4dfa-9944-d307f7cfec9b"
* entry[=].resource = Simple-Medication
* entry[+].fullUrl = "urn:uuid:f428f616-4c97-45c9-845d-65c90277c8f5"
* entry[=].resource = Simple-MedicationDispense-2
* entry[+].fullUrl = "urn:uuid:56c61db7-0a94-4b7b-832a-b8ac3752035d"
* entry[=].resource = Simple-Medication-2


Instance: KomplexMedicationDispenseBundle
InstanceOf: Bundle
Title:   "Example for MedicationDispense with a complex Medication"
Usage: #example
* type = #searchset
* entry[+].fullUrl = "urn:uuid:09796bf6-e84b-487c-878c-736affcd0a1f"
* entry[=].resource = Complex-MedicationDispense
* entry[+].fullUrl = "urn:uuid:627e0f0c-1e11-4985-901a-033bffd9ac67"
* entry[=].resource = Medication-Complex-FD


Instance: SearchSetMultipleMedicationDispenseBundle
InstanceOf: Bundle
Title:   "Example for MedicationDispense with a complex Medication"
Usage: #example
* type = #searchset
* entry[+].fullUrl = "urn:uuid:09796bf6-e84b-487c-878c-736affcd0a1f"
* entry[=].resource = Simple-MedicationDispense
* entry[+].fullUrl = "urn:uuid:86ce7563-9819-4dfa-9944-d307f7cfec9b"
* entry[=].resource = Simple-Medication
* entry[+].fullUrl = "urn:uuid:f428f616-4c97-45c9-845d-65c90277c8f5"
* entry[=].resource = Simple-MedicationDispense-2
* entry[+].fullUrl = "urn:uuid:56c61db7-0a94-4b7b-832a-b8ac3752035d"
* entry[=].resource = Simple-Medication-2
//1.2
* entry[+].fullUrl = "urn:uuid:e546e4a6-c041-461a-b498-49d7d86c2059"
* entry[=].resource =  MedicationDispense-1-2
//1.3
* entry[+].fullUrl = "urn:uuid:7601c8d7-fd58-4043-b5f6-3a4591e2a742"
* entry[=].resource =  MedicationDispense-1-3

Instance: Simple-MedicationDispense
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #inline
Title: "Example Medication Dispense"
Description: "Example of a Medication Dispense."
* id = "09796bf6-e84b-487c-878c-736affcd0a1f"
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "160.000.000.000.000.01"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2025-09-06"
* medicationReference = Reference(urn:uuid:86ce7563-9819-4dfa-9944-d307f7cfec9b)

Instance: Simple-Medication
InstanceOf: GEM_ERP_PR_Medication
Title:   "Sample Simple Medication"
Usage: #inline
* id = "86ce7563-9819-4dfa-9944-d307f7cfec9b"
* code.coding[pzn].system = "http://fhir.de/CodeSystem/ifa/pzn"
* code.coding[pzn].code = #06313728

Instance: Simple-MedicationDispense-2
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #inline
Title: "Example Medication Dispense 2"
Description: "Example of a Medication Dispense 2."
* id = "f428f616-4c97-45c9-845d-65c90277c8f5"
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "160.000.000.000.000.02"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2025-09-06"
* medicationReference = Reference(urn:uuid:56c61db7-0a94-4b7b-832a-b8ac3752035d)

Instance: Complex-MedicationDispense
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #inline
Title: "Example Medication Dispense 2"
Description: "Example of a Medication Dispense 2."
* id = "f428f616-4c97-45c9-845d-65c90277c8f5"
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "160.000.000.000.000.03"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2025-09-06"
* medicationReference = Reference(urn:uuid:627e0f0c-1e11-4985-901a-033bffd9ac67)

Instance: Simple-Medication-2
InstanceOf: GEM_ERP_PR_Medication
Title:   "Sample Simple Medication 2"
Usage: #inline
* id = "56c61db7-0a94-4b7b-832a-b8ac3752035d"
* code.coding[pzn].system = "http://fhir.de/CodeSystem/ifa/pzn"
* code.coding[pzn].code = #06313728

// Rezeptur
Instance: Medication-Complex-FD
InstanceOf: GEM_ERP_PR_Medication
Title: "Medication-Rezeptur-FD"
Usage: #inline
* id = "627e0f0c-1e11-4985-901a-033bffd9ac67"
* contained[+] = Medication-Hydrocortison-FD
* contained[+] = Medication-Dexpanthenol-FD
* extension[type].valueCoding = $sct#1208954007 "Extemporaneous preparation (product)"
  * version = $sct_20240201
* ingredient[+].itemReference = Reference(Medication-Hydrocortison-FD)
* ingredient[+].itemReference = Reference(Medication-Hydrocortison-FD)


Instance: Medication-Hydrocortison-FD
InstanceOf: EPAMedicationPZNIngredient
Usage: #inline
* id = "44509630-ea44-4fe6-a66c-9fe0dded85e1"
* extension[type].valueCoding = $sct#781405001 "Medicinal product package (product)"
  * version = $sct_20240201
* code
  * coding[pzn]
    * code = #03424249
    * display = "Hydrocortison 1% Creme"
  * text = "Hydrocortison 1% Creme"

Instance: Medication-Dexpanthenol-FD
InstanceOf: EPAMedicationPZNIngredient
Usage: #inline
* id = "5c731ef9-fcce-46f8-80e2-d316a37057fe"
* extension[type].valueCoding = $sct#781405001 "Medicinal product package (product)"
  * version = $sct_20240201
* code
  * coding[pzn]
    * code = #16667195
    * display = "Dexpanthenol 5% Creme"
  * text = "Dexpanthenol 5% Creme"

//1.2
Alias: $pzn = http://fhir.de/CodeSystem/ifa/pzn
Alias: $KBV_CS_ERP_Medication_Category = https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category
Alias: $sct = http://snomed.info/sct
Alias: $KBV_CS_SFHIR_KBV_DARREICHUNGSFORM = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM

Instance: MedicationDispense-1-2
InstanceOf: MedicationDispense
Usage: #inline
* id = "e546e4a6-c041-461a-b498-49d7d86c2059"
* medicationReference = Reference(Medication-1-2)
* contained = Medication-1-2
* dosageInstruction.text = "1-0-1-0"
* subject.identifier.value = "Z828875733"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* status = #completed
* meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense|1.2"
* performer.actor.identifier.value = "3-abc-1234567890"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* whenHandedOver = "2024-07-02T09:29:09+02:00"
* identifier.value = "160.000.000.000.000.04"
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"

Instance: Medication-1-2
InstanceOf: Medication
Usage: #inline
* id = "65b6d139-93a6-459f-8b3c-5ae1d1f809a2"
* code.text = "Sumatriptan Dura 100mg"
* code = $pzn#04866280
* extension[0].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category"
* extension[=].valueCoding = $KBV_CS_ERP_Medication_Category#00
* extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type"
* extension[=].valueCodeableConcept.coding = $sct#763158003 "Medicinal product (product)"
* extension[=].valueCodeableConcept.coding.version = "http://snomed.info/sct/900000000000207008/version/20220331"
* extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine"
* extension[=].valueBoolean = false
* extension[+].url = "http://fhir.de/StructureDefinition/normgroesse"
* extension[=].valueCode = #N3
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN|1.1.0"
* form = $KBV_CS_SFHIR_KBV_DARREICHUNGSFORM#FTA
* amount.denominator.value = 1
* amount.numerator.extension.url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize"
* amount.numerator.extension.valueString = "12"
* amount.numerator.unit = "St"

//1.3
Instance: MedicationDispense-1-3
InstanceOf: MedicationDispense
Usage: #inline
* id = "7601c8d7-fd58-4043-b5f6-3a4591e2a742"
* medicationReference = Reference(Medication-1-3)
* contained = Medication-1-3
* dosageInstruction.text = "1-0-1-0"
* subject.identifier.value = "Z828875733"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* status = #completed
* meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense|1.3"
* performer.actor.identifier.value = "3-abc-1234567890"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* whenHandedOver = "2024-07-02T09:29:09+02:00"
* identifier.value = "160.000.000.000.000.05"
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"

Instance: Medication-1-3
InstanceOf: Medication
Usage: #inline
* id = "7ebb8f0c-06a7-4b71-b6b2-81000eabbf8d"
* code.text = "Sumatriptan Dura 100mg"
* code = $pzn#04866280
* extension[0].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category"
* extension[=].valueCoding = $KBV_CS_ERP_Medication_Category#00
* extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type"
* extension[=].valueCodeableConcept.coding = $sct#763158003 "Medicinal product (product)"
* extension[=].valueCodeableConcept.coding.version = "http://snomed.info/sct/900000000000207008/version/20220331"
* extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine"
* extension[=].valueBoolean = false
* extension[+].url = "http://fhir.de/StructureDefinition/normgroesse"
* extension[=].valueCode = #N3
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN|1.1.0"
* form = $KBV_CS_SFHIR_KBV_DARREICHUNGSFORM#FTA
* amount.denominator.value = 1
* amount.numerator.extension.url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize"
* amount.numerator.extension.valueString = "12"
* amount.numerator.unit = "St"