Instance: ExampleOperationRejectError
InstanceOf: OperationOutcome
Title: "Beispiel für Reject-Operation Fehlerantwort"
Description: "Beispiel für eine Fehlerantwort bei der Reject-Operation wegen falschen Task-Status"
Usage: #example
* issue[+]
  * severity = #error
  * code = #forbidden
  * details.text = "Task not in status in progress, is: ready"