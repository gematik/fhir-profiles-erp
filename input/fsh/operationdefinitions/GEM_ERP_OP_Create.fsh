Instance: CreateOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Create)
* description = "This operation creates a Task for the prescription of a specific workflowType."
* code = #create
* type = true
* instance = false
* inputProfile = Canonical(Parameters)
* outputProfile = Canonical(GEM_ERP_PR_PAR_CreateOperation_Output)

// in
* parameter[+]
  * name = #workflowType
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "This parameter requests the creation of a Task of a certain ePrescription flowType."
  * type = #Coding
  * binding.strength = #required
  * binding.valueSet = Canonical(GEM_ERP_VS_FlowType)
// out
* parameter[+]
  * name = #return
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "The created Task with a flowType-specific prescriptionID"
  * type = #Task
