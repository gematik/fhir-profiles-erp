Profile: GEM_ERP_PR_PAR_CreateOperation_Output
Parent: Parameters
Id: GEM-ERP-PR-PAR-Create-Operation-Output
Title: "GEM ERP PR CreateOperation Output"
Description: "This profile defines the parameters for creating a Task from PVS to the E-Rezept-Fachdienst. This can be used for the $create-operation."
* insert Profile(GEM_ERP_PR_PAR_CreateOperation_Output)

* parameter 1..1

* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains return 1..1

* parameter[return]
  * name MS
  * name = "return"
  * value[x] 0..0
  * resource 1..1
  * resource only GEM_ERP_PR_Task
  * part 0..0
