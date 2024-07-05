Instance: CloseOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Close)
* description = "The operation $close finishes the e-prescription workflow and creates a receipt. The Output of this operation is a signed Bundle, to be used for further financial processing. The status of the Task then changes into #completed"
* code = #close
* system = false
* type = false
* instance = true
* resource = #Task

* inputProfile = Canonical(GEM_ERP_PR_CloseOperation_Input)
* outputProfile = Canonical(GEM_ERP_PR_CloseOperation_Output)
* outputProfile = Canonical(GEM_ERP_PR_Bundle)
// TODO: Which output profile?

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
  * min = 0
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
    * min = 0
    * max = "1"

// out
* parameter[+]
  * name = #receipt
  * use = #out
  * min = 0
  * max = "1"
  * documentation = "The receipt Bundle containing the signing Device, the pharmacy`s TelematikID and a signature."
  * type = #Bundle
* parameter[+]
  * name = #operationOutcome
  * use = #out
  * min = 0
  * max = "1"
  * documentation = "In case of errors or issues the E-Rezept-Fachdienst will issue an OperationOutcome."
  * type = #OperationOutcome