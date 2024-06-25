Instance: DispenseOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Dispense)
* description = "The operation $dispense lets the pharmacy perform a dispense for a medication without changing the status of the task. This actions lets a frontend display that a medication has been dispensed before it is closed by the pharmacy."
* code = #dispense
* system = false
* type = false
* instance = true
* resource = #Task

* inputProfile = Canonical(GEM_ERP_PR_DispenseOperation_Input)
* outputProfile = Canonical(GEM_ERP_PR_DispenseOperation_Output) //TODO "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle"

// in
* parameter[0]
  * name = #secret
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "The secret parameter that lets a pharmacy access the Task exclusively as part of the URL. This paramter must be equal to the value stored in Task.identifier:Secret. Otherwise the Operation aborts with an error."
  * type = #string


// in
* parameter[+]
  * name = #rxDispensation
  * use = #in
  * min = 1
  * max = "*"
  * documentation = "Information on dispensed Medication(s)"
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
  * name = #medicationDispense
  * use = #out
  * min = 0
  * max = "1"
  * documentation = "The MedicationDispense that has been transmitted by the pharmacy as a confirmation, that it has been successfully uploaded."
  * part[+]
    * name = #medicationDispense
    * type = #MedicationDispense
    * use = #out
    * min = 1
    * max = "1"
  * part[+]
    * name = #medication
    * type = #Medication
    * use = #out
    * min = 1
    * max = "1"

* parameter[+]
  * name = #operationOutcome
  * use = #out
  * min = 0
  * max = "1"
  * documentation = "In case of errors or issues the E-Rezept-Fachdienst will issue an OperationOutcome."
  * type = #OperationOutcome