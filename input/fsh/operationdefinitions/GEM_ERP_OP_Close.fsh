Instance: CloseOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Close)
* description = "Die $close-Operation beendet den E-Rezept-Workflow und erstellt eine Quittung. Das Ergebnis dieses Vorgangs ist ein signiertes Bundle, das für weitere finanzielle Verarbeitung verwendet wird. Der Status der Aufgabe ändert sich anschließend in #completed."
* code = #close
* system = false
* type = false
* instance = true
* resource = #Task

* inputProfile = Canonical(GEM_ERP_PR_PAR_CloseOperation_Input)
* outputProfile = Canonical(GEM_ERP_PR_PAR_CloseOperation_Output)

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
  * min = 0
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
    * min = 0 // optional durch DiGA
    * max = "1"

// out
* parameter[+]
  * name = #return
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "Das Quittungs Bundle, das Angaben zum signierenden Fachdienst, die Telematik-ID der Apotheke und die Signatur enthält."
  * type = #Bundle