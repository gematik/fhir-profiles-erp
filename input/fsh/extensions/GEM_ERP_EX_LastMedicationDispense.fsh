Extension: GEM_ERP_EX_LastMedicationDispense
Id: GEM-ERP-EX-LastMedicationDispense
Title: "Letzte Medikamentenabgabe"
Description: "Diese Erweiterung sollte in der Task-Ressource verwendet werden. Sie zeigt den Zeitstempel der letzten Ausgabe an."
* insert StructureDefinition(GEM_ERP_EX_LastMedicationDispense)
* . ^short = "Zeitstempel, der gesetzt wird, wenn ein Medikament für diese Aufgabe ausgegeben wurde. Angegeben im Format YYYY-MM-DDTHH:MM:SS(Z|±HH:MM)"
* . ^definition = "Dieses Feld ermöglicht es der E-Rezept-FdV, dem Benutzer anzuzeigen, dass ein Medikament abgegeben wurde, bevor es von der Apotheke abgeschlossen wurde."
* ^context.type = #element
* ^context.expression = "Task"
* value[x] only instant
  * ^short = "Zeitstempel, der gesetzt wird, wenn ein Medikament für diese Aufgabe ausgegeben wurde."
  * ^comment = "Im Format YYYY-MM-DDTHH:MM:SS(Z|±HH:MM) angegeben"

