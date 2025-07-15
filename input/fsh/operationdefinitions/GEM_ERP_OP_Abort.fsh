Instance: AbortOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Abort)
* description = "Diese Operation bricht den Workflow eines E-Rezepts ab und löscht alle Daten, die mit dieser Aufgabe zusammenhängen."
* code = #abort
// in
* parameter[+]
  * name = #ac
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "[Nur von Patienten und Anbietern (Ärzten/Zahnärzten) zu verwenden] Der geheime Parameter, der es Benutzern ermöglicht, exklusiv über die URL und den Parameter ?ac auf die Aufgabe zuzugreifen."
  * type = #string

// alternative in
* parameter[+]
  * name = #secret
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "[Nur von der Apotheke zu verwenden] Der geheime Parameter, der es einer Apotheke ermöglicht, exklusiv über die URL und den Parameter ?secret auf die Aufgabe zuzugreifen."
  * type = #string
