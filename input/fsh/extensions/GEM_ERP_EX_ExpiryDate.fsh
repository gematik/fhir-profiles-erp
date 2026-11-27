Extension: GEM_ERP_EX_ExpiryDate
Id: GEM-ERP-EX-ExpiryDate
Title: "Einlösefrist der Verordnung"
Description: "Diese Erweiterung sollte in der Task-Ressource verwendet werden. Sie zeigt die Einlösefrist der Verordnung an."
* insert StructureDefinition(GEM_ERP_EX_ExpiryDate)
* . ^short = "Einlösefrist der Verordnung"
* . ^definition = "Frist bis zu welcher ein Rezept beliefert werden darf (Frist endet zu Task.extension:expiryDate, bei Kassenrezepten 3 Monate nach Ausstellung). Danach darf ein Rezept nicht mehr von der Apotheke beliefert werden (§2, Abs. 5 AMVV)."
* ^context.type = #element
* ^context.expression = "Task"
* value[x] only date
