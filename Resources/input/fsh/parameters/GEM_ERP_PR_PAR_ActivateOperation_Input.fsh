Profile: GEM_ERP_PR_PAR_ActivateOperation_Input
Parent: Parameters
Id: GEM-ERP-PR-PAR-Activate-Operation-Input
Title: "GEM ERP PR ActivateOperation Input"
Description: "This profile defines the parameters for activating a workflow for a prescription from PVS to the E-Rezept-Fachdienst."
// Das muss bleiben, damit PVS für $create kein meta.profile angeben müssen
* insert StructureDefinition(GEM_ERP_PR_PAR_ActivateOperation_Input)

* parameter 1..1
* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains ePrescription 1..1
  
* parameter[ePrescription]
  * name MS
  * name = "ePrescription"
  * value[x] 0..0
  * resource 1..1 
  * resource only GEM_ERP_PR_Binary