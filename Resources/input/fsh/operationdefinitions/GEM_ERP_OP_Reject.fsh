Instance: RejectOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Reject)
* description = "Rejects the dispense of a ePrescription. The Task will be reset to an active state, the secret will be deleted, and the Task will be accessible by any other pharmacist or it can be deleted by the patient."
* code = #reject
// in
* parameter.name = #secret
* parameter.use = #in
* parameter.min = 1
* parameter.max = "1"
* parameter.documentation = "The secret parameter that lets a pharmacy access the Task exclusively."
* parameter.type = #string
