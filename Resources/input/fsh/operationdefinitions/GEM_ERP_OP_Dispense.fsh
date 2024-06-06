Instance: DispenseOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Dispense)
* description = "The operation $dispense lets the pharmacy perform a dispense for a medication without changing the status of the task. This actions lets a frontend display that a medication has been dispensed before it is closed by the pharmacy."
* code = #dispense
* outputProfile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense"
// in
* parameter[0].name = #secret
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The secret parameter that lets a pharmacy access the Task exclusively as part of the URL. This paramter must be equal to the value stored in Task.identifier:Secret. Otherwise the Operation aborts with an error."
* parameter[=].type = #string
// in
* parameter[+].name = #MedicationDispense
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Information on dispensed Medication(s)"
* parameter[=].type = #canonical
* parameter[=]
  * insert PackageTargetProfile(StructureDefinition/GEM_ERP_PR_MedicationDispense)
  * insert PackageTargetProfile(StructureDefinition/GEM_ERP_PR_MedicationDispense_DiGA)
  * insert PackageTargetProfile(StructureDefinition/GEM_ERP_PR_CloseOperationInputBundle)

// out
* parameter[+].name = #MedicationDispense
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The MedicationDispense that has been transmitted by the pharmacy as a confirmation, that it has been successfully uploaded."
* parameter[=].type = #canonical
* parameter[=]
  * insert PackageTargetProfile(StructureDefinition/GEM_ERP_PR_MedicationDispense)
  * insert PackageTargetProfile(StructureDefinition/GEM_ERP_PR_MedicationDispense_DiGA)
  * insert PackageTargetProfile(StructureDefinition/GEM_ERP_PR_CloseOperationInputBundle)

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
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_CloseOperationInputBundle)
* meta.tag.display = "MedicationDispense Bundle for $close-Operation on dispensation of multiple medications"
* type = #collection
* entry[+].fullUrl = "http://hier-koennte-ihre-werbung-stehen"
* entry[=].resource = OperationDispenseParametersInputMedicationDispense
* entry[+].fullUrl = "http://waltraud-was-here"
* entry[=].resource = OperationDispenseParametersInputMedicationDispense
