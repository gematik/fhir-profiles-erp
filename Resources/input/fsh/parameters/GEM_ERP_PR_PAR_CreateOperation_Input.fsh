Profile: GEM_ERP_PR_PAR_CreateOperation_Input
Parent: Parameters
Id: GEM-ERP-PR-PAR-Create-Operation-Input
Title: "GEM ERP PR CreateOperation Input Parameter"
Description: "This profile defines the parameters for creating a workflow for a prescription from PVS to the E-Rezept-Fachdienst."
* insert Profile(GEM_ERP_PR_PAR_CreateOperation_Input)

* parameter 1..1
* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains workflowType 1..1
  
* parameter[workflowType]
  * name MS
  * name = "workflowType"
  * value[x] 1..1
  * value[x] only Coding
  * valueCoding from GEM_ERP_VS_FlowType (required)