Instance: CreateOperation
InstanceOf: OperationDefinition
Usage: #definition
* url = "http://gematik.de/fhir/erp/OperationDefinition/CreateOperationDefinition"
* version = "1.2"
* name = "Create Operation"
* status = #draft
* kind = #operation
* date = "2020-07-01"
* description = "This operation creates a Task for the prescription of a specific workflowType."
* code = #create
* resource = #Task
* system = false
* type = true
* instance = false
* outputProfile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Task"
* parameter[0].name = #workflowType
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "This parameter defines the type of a prescription."
* parameter[=].type = #integer
* parameter[+].name = #task
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The previously created Task's ID"
* parameter[=].type = #Task