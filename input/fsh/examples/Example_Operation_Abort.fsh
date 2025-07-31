Instance: ExampleOperationAbortErrorAVS
InstanceOf: OperationOutcome
Title: "Beispiel für Abort-Operation Fehlerantwort (AVS)"
Description: "Beispiel für eine Fehlerantwort bei der Abort-Operation aus Sicht des AVS"
Usage: #example
* issue[+]
  * severity = #error
  * code = #forbidden
  * details.text = "Abort not expected for newly created Task"

Instance: ExampleOperationAbortErrorPVS
InstanceOf: OperationOutcome
Title: "Beispiel für Abort-Operation Fehlerantwort (PVS)"
Description: "Beispiel für eine Fehlerantwort bei der Abort-Operation aus Sicht des PVS"
Usage: #example
* issue[+]
  * severity = #error
  * code = #forbidden
  * details.text = "Task must not be in progress for users other than pharmacy, but is: in-progress"