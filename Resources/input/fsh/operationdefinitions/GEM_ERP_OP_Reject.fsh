Instance: RejectOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Reject)
* description = "Rejects the dispense of a ePrescription. The Task will be reset to an active state, the secret will be deleted, and the Task will be accessible by any other pharmacist or it can be deleted by the patient."
* code = #reject

// in
* parameter[+]
  * name = #secret
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "The secret parameter that lets a pharmacy access the Task exclusively." //TODO: ergänzen URL Parameter
  * type = #string
