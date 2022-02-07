Instance: Create Operation
InstanceOf: OperationDefinition
Usage: #definition
* url = "http://gematik.de/fhir/OperationDefinition/CreateOperationDefinition"
* version = "1.1.1"
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
* outputProfile = "https://gematik.de/fhir/StructureDefinition/ErxTask"
* parameter[0].name = #workflowType
* parameter[=].use = #in
* parameter[=].min = "1"
* parameter[=].max = "1"
* parameter[=].documentation = "This parameter defines the type of a prescription."
* parameter[=].type = #integer
* parameter[+].name = #task
* parameter[=].use = #out
* parameter[=].min = "1"
* parameter[=].max = "1"
* parameter[=].documentation = "The created Task."
* parameter[=].type = #Task