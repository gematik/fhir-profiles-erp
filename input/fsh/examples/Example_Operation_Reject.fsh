Instance: ExampleOperationRejectError
InstanceOf: OperationOutcome
Title: "Example Reject operation error response"
Usage: #example
* issue[+]
  * severity = #error
  * code = #forbidden
  * details.text = "Task not in status in progress, is: ready"