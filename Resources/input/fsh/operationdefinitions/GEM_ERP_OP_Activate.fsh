Instance: ActivateOperation
InstanceOf: OperationDefinition
Usage: #definition
* url = "http://gematik.de/fhir/erp/OperationDefinition/ActivateOperationDefinition"
* version = "1.2"
* name = "Activate Operation"
* status = #draft
* kind = #operation
* date = "2020-07-01"
* description = "This operation activates the created Task for the prescription. The input parameter must contain the qualified signed Bundle of the prescription. The prescription server validates the prescription, updates the task ressource and starts the workflow."
* code = #activate
* resource = #Task
* system = false
* type = false
* instance = true
* outputProfile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Task"
* parameter[0].name = #ePrescription
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The qualified signed prescription element to activate the ePrescription workflow."
* parameter[=].type = #Binary
* parameter[=].targetProfile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Binary"
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Return the updated and activated Task."
* parameter[=].type = #Task