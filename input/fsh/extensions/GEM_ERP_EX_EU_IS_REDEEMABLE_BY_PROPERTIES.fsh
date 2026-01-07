Extension: GEM_ERP_EX_EU_IS_REDEEMABLE_BY_PROPERTIES
Id: GEM-ERP-EX-EU-IS-REDEEMABLE-BY-PROPERTIES
Title: "GEM ERP EX EU IS REDEEMABLE BY PROPERTIES"
Description: "Extension zur vom E-Rezept-Fachdienst ermittelten Angabe, ob das E-Rezept in der EU zur Einlösung verfügbar sein soll oder nicht."
Context: Task, Extension
* insert StructureDefinition(GEM_ERP_EX_EU_IS_REDEEMABLE_BY_PROPERTIES)
* . ^short = "Einlösbar in EU-Flagge"
* . ^definition = "Diese Flagge wird vom E-Rezept-Fachdienst gesetzt, wenn das E-Rezept in der EU einlösbar ist."
* value[x] only boolean
* valueBoolean 1..1 MS
* valueBoolean ^short = "Einlösbar in EU-Flagge"
* valueBoolean ^definition = "Diese Flagge wird vom E-Rezept-Fachdienst gesetzt, wenn das E-Rezept in der EU einlösbar ist."
