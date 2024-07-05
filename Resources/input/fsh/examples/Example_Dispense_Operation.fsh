
Instance: OperationDispenseParametersInputMedicationDispense
InstanceOf: MedicationDispense
Title:   "MedicationDispense handed to Günther at a pharmacy"
Usage: #example
* id = "26fbffa8-b0df-4074-b2cf-143269aff176"
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_MedicationDispense)
* contained[+] = SumatripanMedication
* identifier[+].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[=].value = "160.000.033.491.280.78"
* status = #completed
* medicationReference.reference = "#SumatripanMedication"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X234567890"
* performer[+].actor.identifier.system = $identifier-telematik-id
* performer[=].actor.identifier.value = "3-abc-1234567890"
* whenHandedOver = "2022-02-28"
* dosageInstruction[+].text = "1-0-1-0"

Instance: OperationDispenseOutputMedicationDispense
InstanceOf: MedicationDispense
Title:   "MedicationDispense returned by the E-Rezept-Fachdienst"
Usage: #example
* id = "cd6a4805-9861-412e-91aa-ec6af3f03d87"
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_MedicationDispense)
* contained[+] = SumatripanMedication
* identifier[+].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[=].value = "160.000.033.491.280.78"
* status = #completed
* medicationReference.reference = "#SumatripanMedication"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X234567890"
* performer[+].actor.identifier.system = $identifier-telematik-id
* performer[=].actor.identifier.value = "3-abc-1234567890"
* whenHandedOver = "2022-02-28"
* dosageInstruction[+].text = "1-0-1-0"

Instance: OperationDispenseOutputBundle
InstanceOf: Bundle
Title:   "Bundle of 2 MedicationDispense handed to Waltraud at a pharmacy"
Description: "Lets asume, Waltraud needs 40 TABs and the pharmacy hands out 2*20, then there will be 2 MedicationDispenses for the E-Rezept backend"
Usage: #example
* id = "558c2f69-62f6-4a74-8d13-70e945d28b71"
* meta.tag.display = "MedicationDispense Bundle for $close-Operation on dispensation of multiple medications"
* type = #collection
* entry[+].fullUrl = "http://hier-koennte-ihre-werbung-stehen"
* entry[=].resource = OperationDispenseParametersInputMedicationDispense
* entry[+].fullUrl = "http://waltraud-was-here"
* entry[=].resource = OperationDispenseParametersInputMedicationDispense
