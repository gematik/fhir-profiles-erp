Instance: DispenseOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Dispense)
* description = "Die Operation $dispense ermöglicht es der Apotheke, eine Ausgabe für ein Medikament durchzuführen, ohne den Status der Aufgabe zu ändern. Diese Aktion erlaubt es einem Frontend anzuzeigen, dass ein Medikament ausgegeben wurde, bevor es von der Apotheke abgeschlossen wird."
* code = #dispense
* system = false
* type = false
* instance = true
* resource = #Task

* inputProfile = Canonical(GEM_ERP_PR_PAR_DispenseOperation_Input)
* outputProfile = Canonical(GEM_ERP_PR_PAR_DispenseOperation_Output)

// in
* parameter[0]
  * name = #secret
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Der secret Parameter, der einer Apotheke den exklusiven Zugriff auf die Aufgabe als Teil der URL ermöglicht. Dieser Parameter muss dem Wert entsprechen, der in Task.identifier:Secret gespeichert ist. Andernfalls wird der Vorgang mit einem Fehler abgebrochen."
  * type = #string

// in
* parameter[+]
  * name = #rxDispensation
  * use = #in
  * min = 1
  * max = "*"
  * documentation = "Informationen zu abgegebenen Medikament(en)"
  * part[+]
    * name = #medicationDispense
    * type = #MedicationDispense
    * use = #in
    * min = 1
    * max = "1"
  * part[+]
    * name = #medication
    * type = #Medication
    * use = #in
    * min = 1
    * max = "1"

// out
* parameter[+]
  * name = #rxDispensation
  * use = #out
  * min = 1
  * max = "*"
  * documentation = "Die MedicationDispense, die von der Apotheke als Bestätigung übermittelt wurde, dass sie erfolgreich hochgeladen wurde."
  * part[+]
    * name = #medicationDispense
    * type = #MedicationDispense
    * use = #out
    * min = 0
    * max = "1"
  * part[+]
    * name = #medication
    * type = #Medication
    * use = #out
    * min = 0
    * max = "1"
  * part[+]
    * name = #operationOutcome
    * use = #out
    * min = 0
    * max = "1"
    * documentation = "Im Falle von Fehlern oder Problemen gibt der E-Rezept-Fachdienst ein OperationOutcome aus."
    * type = #OperationOutcome