Profile: GEM_ERP_PR_PAR_AcceptOperation_Output
Parent: Parameters
Id: GEM-ERP-PR-PAR-Accept-Operation-Output
Title: "GEM ERP PR AcceptOperation Output"
Description: "This profile defines the parameters for accepting a medication from AVS to the E-Rezept-Fachdienst. This can be used for the $accept-operation."
* insert Profile(GEM_ERP_PR_PAR_AcceptOperation_Output)

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
  * resource only GEM_ERP_PR_Bundle_OP_Accept
  * part 0..0
