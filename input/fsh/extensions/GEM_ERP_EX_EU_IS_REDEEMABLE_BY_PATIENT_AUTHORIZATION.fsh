Extension: GEM_ERP_EX_EU_IS_REDEEMABLE_BY_PATIENT_AUTHORIZATION
Id: GEM-ERP-EX-EU-IS-REDEEMABLE-BY-PATIENT-AUTHORIZATION
Context: Task, Extension
* insert StructureDefinition(GEM_ERP_EX_EU_IS_REDEEMABLE_BY_PATIENT_AUTHORIZATION)
* . ^short = "Einlösbares EU-E-Rezept durch Patientenautorisierung"
* . ^definition = "Diese Flagge wird vom Benutzer gesetzt, um anzugeben, ob das E-Rezept in der EU zur Einlösung verfügbar sein soll oder nicht."
* value[x] only boolean
* valueBoolean 1..1 MS
* valueBoolean ^short = "Sollte in EU eingelöst werden Flagge"
* valueBoolean ^definition = "Diese Flagge wird vom Benutzer gesetzt, um anzugeben, ob das E-Rezept in der EU zur Einlösung verfügbar sein soll oder nicht."
