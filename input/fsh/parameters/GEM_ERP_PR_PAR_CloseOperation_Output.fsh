Profile: GEM_ERP_PR_PAR_CloseOperation_Output
Parent: Parameters
Id: GEM-ERP-PR-PAR-Close-Operation-Output
Title: "GEM ERP PR CloseOperation Output"
Description: "Dieses Profil definiert die Parameter für die Ausgabe eines Medikaments von AVS an den E-Rezept-Fachdienst. Dies kann für die $close-Operation verwendet werden."
* insert Profile(GEM_ERP_PR_PAR_CloseOperation_Output)

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
