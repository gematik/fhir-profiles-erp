Instance: RejectOperation
InstanceOf: OperationDefinition
Usage: #definition
* url = "http://gematik.de/fhir/erp/OperationDefinition/RejectOperationDefinition"
* version = "1.2"
* name = "Reject Operation"
* status = #draft
* kind = #operation
* date = "2020-07-01"
* description = "Rejects the dispense of a ePrescription. The Task will be reset to an active state, the secret will be deleted, and the Task will be accessible by any other pharmacist or it can be deleted by the patient."
* code = #reject
* resource = #Task
* system = false
* type = false
* instance = true
* parameter.name = #secret
* parameter.use = #in
* parameter.min = 1
* parameter.max = "1"
* parameter.documentation = "The secret parameter that lets a pharmacy access the Task exclusively."
* parameter.type = #string