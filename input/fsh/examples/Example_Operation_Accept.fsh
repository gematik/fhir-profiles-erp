Instance: ExampleOperationAcceptError
InstanceOf: OperationOutcome
Title: "Example Accept operation error response"
Usage: #example
* issue[+]
  * severity = #error
  * code = #conflict
  * details.text = "Task has invalid status draft"