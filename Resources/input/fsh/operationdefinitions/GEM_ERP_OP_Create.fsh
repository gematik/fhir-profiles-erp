Instance: CreateOperation
InstanceOf: OperationDefinition
Usage: #definition
* url = "https://gematik.de/fhir/erp/OperationDefinition/CreateOperationDefinition"
* version = "1.3.0"
* name = "Create"
* status = #active
* kind = #operation
* date = "2022-02-01"
* description = "This operation creates a Task for the prescription of a specific workflowType."
* affectsState = true
* code = #create
* resource = #Task
* system = false
* type = true
* instance = false
* outputProfile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Task"
// in
* parameter[0].name = #workflowType
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "This parameter requests the creation of a Task of a certain ePrescription flowType."
//* parameter[=].type = #canonical
//* parameter[=].targetProfile[+] = "https://gematik.de/fhir/erp/ValueSet/GEM_ERP_VS_FlowType"
* parameter[=].type = #ValueSet
* parameter[=].binding.strength = #required
* parameter[=].binding.valueSet = "https://gematik.de/fhir/erp/ValueSet/GEM_ERP_VS_FlowType"
// out
* parameter[+].name = #task
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The created Task with a flowType-specific prescriptionID"
* parameter[=].type = #canonical
* parameter[=].targetProfile[+] = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Task"

Instance: OperationCreateParametersInputExample
InstanceOf: Parameters
Title: "$create Operation Parameters sample"
Usage: #example
* parameter[+].name = "workflowType"
* parameter[=].valueCoding.system = "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType"
* parameter[=].valueCoding.code = #160