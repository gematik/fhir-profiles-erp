Instance: AcceptOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Accept)
* description = "Mit der $accept-Operation beansprucht eine Apotheke ein E-Rezept. Der Status der referenzierten Aufgabe ändert sich in 'in-progress'."
* code = #accept
* outputProfile = Canonical(GEM_ERP_PR_PAR_AcceptOperation_Output)

// in
* parameter[+]
  * name = #ac
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Der Secret-Parameter, der es Benutzern ermöglicht, exklusiv über die URL und den Parameter ?ac auf die Aufgabe zuzugreifen."
  * type = #string

// out
* parameter[+]
  * name = #return
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "Sammlung von Ressourcen (Task und Binary), damit eine Apotheke ein eRezept verarbeiten kann, das Folgendes enthält: 1. die aktualisierte Task (einschließlich eines Geheimnisses, das einer Apotheke exklusiven Zugriff auf die Task gewährt) und 2. eine base64Binary des qualifiziert signierten eRezepts. Der Status der Task ändert sich in 'in-progress'. Der Rezeptserver erstellt ein secret und speichert sie in Task.identifier:Secret."
  * type = #Bundle
