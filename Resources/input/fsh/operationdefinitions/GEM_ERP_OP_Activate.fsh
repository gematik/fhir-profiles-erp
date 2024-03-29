Instance: ActivateOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Activate)
* description = "This operation activates the created Task for the prescription. The input parameter must contain the qualified signed Bundle of the prescription. The prescription server validates the prescription, updates the task ressource and starts the workflow."
* code = #activate
* outputProfile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Task"
// in
* parameter[0].name = #ePrescription
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The qualified signed prescription element to activate the ePrescription workflow."
* parameter[=].type = #Binary
// out
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Return the updated and activated Task."
* parameter[=].type = #canonical
* parameter[=].targetProfile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Task"

Instance: PrescriptionBinary
InstanceOf: Binary
Usage: #inline
* contentType = #application/pkcs7-mime
* data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="

Instance: OperationActivateParametersInputExample
InstanceOf: Parameters
Title: "Ativate operation input parameters"
Usage: #example
* parameter[+].name = "ePrescription"
* parameter[=].resource = PrescriptionBinary
