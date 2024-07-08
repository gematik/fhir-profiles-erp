Profile: GEM_ERP_PR_CloseOperation_Output
Parent: Parameters
Id: gem-erp-pr-close-operation-output
Title: "GEM ERP PR CloseOperation Output"
Description: "This profile defines the parameters for dispensing a medication from AVS to the E-Rezept-Fachdienst. This can be used for the $close-operation."
* insert Profile(GEM_ERP_PR_CloseOperation_Output)

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
  * resource only GEM_ERP_PR_Bundle
  * part 0..0
