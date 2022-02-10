Instance: CloseOperation
InstanceOf: OperationDefinition
Usage: #definition
* url = "http://gematik.de/fhir/OperationDefinition/CloseOperationDefinition"
* version = "1.1.1"
* name = "Close Operation"
* status = #draft
* kind = #operation
* date = "2020-07-01"
* description = "The operation $close finishes the e-prescription workflow and creates a receipt. The Output of this operation is a signed Bundle, to be used for further financial processing. The status of the Task then changes into 'completed'"
* code = #close
* resource = #Task
* system = false
* type = false
* instance = true
* outputProfile = "https://gematik.de/fhir/StructureDefinition/erxReceipt"
* parameter[0].name = #secret
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The secret parameter that lets a pharmacy access the Task exclusively as part of the URL. This paramter must be equal to the value stored in Task.identifier:Secret. Otherwise the Operation aborts with an error."
* parameter[=].type = #string
* parameter[+].name = #Receipt
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The receipt Bundle containing the MedicationDispense resource and a signature."
* parameter[=].type = #Bundle