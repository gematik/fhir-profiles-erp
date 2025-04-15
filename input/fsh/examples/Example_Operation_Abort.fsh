Instance: ExampleOperationAbortErrorAVS
InstanceOf: OperationOutcome
Title: "Example Abort operation error response"
Usage: #example
* issue[+]
  * severity = #error
  * code = #forbidden
  * details.text = "Abort not expected for newly created Task"

Instance: ExampleOperationAbortErrorPVS
InstanceOf: OperationOutcome
Title: "Example Abort operation error response"
Usage: #example
* issue[+]
  * severity = #error
  * code = #forbidden
  * details.text = "Task must not be in progress for users other than pharmacy, but is: in-progress"