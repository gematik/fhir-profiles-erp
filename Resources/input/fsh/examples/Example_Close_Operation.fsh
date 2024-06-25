
Instance: OperationCloseParametersInputMedicationDispense
InstanceOf: MedicationDispense
Title:   "MedicationDispense handed to Günther at a pharmacy"
Usage: #example
* id = "3465270a-11e7-4bbf-ae53-378f9cc52747"
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

Instance: OperationCloseParametersInputBundle
InstanceOf: Bundle
Title:   "Bundle of 2 MedicationDispense handed to Waltraud at a pharmacy"
Description: "Lets asume, Waltraud needs 40 TABs and the pharmacy hands out 2*20, then there will be 2 MedicationDispenses for the E-Rezept backend"
Usage: #example
* id = "9145d0d0-7b77-483f-ad89-cd9d34fc1f08"
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_CloseOperationInputBundle)
* meta.tag.display = "MedicationDispense Bundle for $close-Operation on dispensation of multiple medications"
* type = #collection
* entry[+].fullUrl = "http://hier-koennte-ihre-werbung-stehen"
* entry[=].resource = OperationCloseParametersInputMedicationDispense
* entry[+].fullUrl = "http://waltraud-was-here"
* entry[=].resource = OperationCloseParametersInputMedicationDispense
