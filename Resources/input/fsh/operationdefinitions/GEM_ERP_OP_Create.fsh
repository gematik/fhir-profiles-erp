Instance: CreateOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Create)
* description = "This operation creates a Task for the prescription of a specific workflowType."
* code = #create
* type = true
* instance = false
* inputProfile = Canonical(GEM_ERP_PR_CreateOperation_Input)
* outputProfile = Canonical(GEM_ERP_PR_Task)
// in
* parameter[+]
  * name = #workflowType
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "This parameter requests the creation of a Task of a certain ePrescription flowType."
  * type = #ValueSet
  * binding.strength = #required
  * binding.valueSet = "https://gematik.de/fhir/erp/ValueSet/GEM_ERP_VS_FlowType"
// out
* parameter[+]
  * name = #task
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "The created Task with a flowType-specific prescriptionID"
  * type = #canonical
  * targetProfile[+] = Canonical(GEM_ERP_PR_Task)
