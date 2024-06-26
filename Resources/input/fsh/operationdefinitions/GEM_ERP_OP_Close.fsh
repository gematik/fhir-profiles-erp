Instance: CloseOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Close)
* description = "The operation $close finishes the e-prescription workflow and creates a receipt. The Output of this operation is a signed Bundle, to be used for further financial processing. The status of the Task then changes into #completed"
* code = #close
* outputProfile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle"
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
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Information on dispensed Medication(s)"
* parameter[=].type = #canonical
* parameter[=]
  * insert PackageTargetProfile(StructureDefinition/GEM_ERP_PR_MedicationDispense)
  * insert PackageTargetProfile(StructureDefinition/GEM_ERP_PR_MedicationDispense_DiGA)
  * insert PackageTargetProfile(StructureDefinition/GEM_ERP_PR_CloseOperationInputBundle)
  
// out
* parameter[+].name = #Receipt
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The receipt Bundle containing the signing Device, the pharmacy`s TelematikID and a signature."
* parameter[=].type = #Bundle

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
