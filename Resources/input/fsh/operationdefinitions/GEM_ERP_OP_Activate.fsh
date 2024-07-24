Instance: ActivateOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Activate)
* description = "This operation activates the created Task for the prescription. The input parameter must contain the qualified signed Bundle of the prescription. The prescription server validates the prescription, updates the task ressource and starts the workflow."
* code = #activate
* inputProfile = Canonical(GEM_ERP_PR_PAR_ActivateOperation_Input)
* outputProfile = Canonical(GEM_ERP_PR_PAR_ActivateOperation_Output)

// in
* parameter[+]
  * name = #ePrescription
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "The qualified signed prescription element to activate the ePrescription workflow."
  * type = #Binary

// out
* parameter[+]
  * name = #return
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "Return the updated and activated Task."
  * type = #Task

