Instance: ExampleOperationAcceptError
InstanceOf: OperationOutcome
Title: "Beispiel für Accept-Operation Fehlerantwort"
Description: "Beispiel für eine Fehlerantwort bei der Accept-Operation eines E-Rezepts"
Usage: #example
* issue[+]
  * severity = #error
  * code = #conflict
  * details.text = "Task has invalid status draft"