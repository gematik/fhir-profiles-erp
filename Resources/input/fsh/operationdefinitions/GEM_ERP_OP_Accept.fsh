Instance: AcceptOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Accept)
* description = "With the accept operation a pharmacy claims an e-prescription. The status of the referenced Task changes into 'in-progres'."
* code = #accept
* outputProfile = "http://hl7.org/fhir/StructureDefinition/Bundle"
// in
* parameter[0].name = #ac
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The secret parameter that lets users access the Task exclusively as the URL an Paramter ?ac."
* parameter[=].type = #string
// out
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Collection of resources (Task and Binary) to let a pharmacy process a ePrescriptionn containing 1. the updated Task (including a secret, that gives a pharmacy exclusive access to the Task) and 2. a base64Binary of the qualified signed ePrescription. The status of the Task changes into in-progres. The prescription server creates a random number and stores it in Task.identifier:Secret."
* parameter[=].type = #Bundle
