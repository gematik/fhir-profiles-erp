Instance: ActivateEBtMOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Activate-E-BtM)
* date = "2024-03-01"
* description = "This operation activates the created Task for a narcotics prescription (Betäubungsmittel). The input parameter must contain the qualified signed Bundle of the prescription. The prescription server checks if the practitionier is authorized by BfArM, validates the prescription, updates the task ressource and starts the workflow."
* code = #activate-ebtm
* outputProfile = "http://hl7.org/fhir/StructureDefinition/Bundle"
// in
* parameter[0].name = #ePrescription
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The qualified signed narcotics prescription element to activate the ePrescription workflow."
* parameter[=].type = #Binary
// out
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Returns a Bundle which contains the Task and a Documentation-Bundle of Narcotics Approval."
* parameter[=].type = #canonical
* parameter[=].targetProfile = "http://hl7.org/fhir/StructureDefinition/Bundle"