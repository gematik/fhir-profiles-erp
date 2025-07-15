Instance: ActivateOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Activate)
* description = "Diese Operation aktiviert die erstellte Aufgabe für das Rezept. Der Eingabeparameter muss das qualifizierte signierte Bundle des Rezepts enthalten. Der E-Rezept-Fachdienst validiert das Rezept, aktualisiert die Task-ressource und startet den Workflow."
* code = #activate
* inputProfile = Canonical(Parameters)
* outputProfile = Canonical(GEM_ERP_PR_PAR_ActivateOperation_Output)

// in
* parameter[+]
  * name = #ePrescription
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Das qualifizierte unterzeichnete Verordnung (QES) zur Aktivierung des E-Rezept-Workflows."
  * type = #Binary

// out
* parameter[+]
  * name = #return
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "Geben Sie die aktualisierte und aktivierte Aufgabe zurück."
  * type = #Task

