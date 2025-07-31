Extension: GEM_ERP_EX_ExpiryDate
Id: GEM-ERP-EX-ExpiryDate
Title: "Ablaufdatum des Rezepts"
Description: "Diese Erweiterung sollte in der Task-Ressource verwendet werden. Sie zeigt das Ablaufdatum des Rezepts an."
* insert StructureDefinition(GEM_ERP_EX_ExpiryDate)
* . ^short = "Ablaufdatum des Rezepts"
* . ^definition = "Datum, an dem das Rezept abläuft und in der Apotheke nicht mehr eingelöst werden kann."
* ^context.type = #element
* ^context.expression = "Task"
* value[x] only date
