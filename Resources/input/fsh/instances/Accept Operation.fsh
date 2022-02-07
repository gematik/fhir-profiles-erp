Instance: Accept Operation
InstanceOf: OperationDefinition
Usage: #definition
* url = "http://gematik.de/fhir/OperationDefinition/AcceptOperationDefinition"
* version = "1.1.1"
* name = "Accept Operation"
* status = #draft
* kind = #operation
* date = "2020-07-01"
* description = "The accept operation assigns an e-prescription to a healthcare provider (pharmacy). The status of the referenced Task changes into 'in-progres'."
* code = #accept
* resource = #Task
* system = false
* type = false
* instance = true
* parameter[0].name = #ac
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The secret parameter that lets users access the Task exclusively as the URL an Paramter ?ac."
* parameter[=].type = #string
* parameter[+].name = #Task
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Collection of resources to let a pharmacy process a ePrescriptionn containing 1. the updated Task (including a secret, that gives a pharmacy exclusive access to the Task) and 2. a base64Binary of the qualified signed ePrescription. The status of the Task changes into in-progres. The prescription server creates a random number and stores it in Task.identifier:Secret."
* parameter[=].type = #Bundle