Extension: GEM_ERP_EX_AcceptDate
Id: GEM-ERP-EX-AcceptDate
Title: "GEM ERP EX AcceptDate"
Description: "Diese Extension sollte in der Task-Ressource verwendet werden. Sie speichert das Datum, bis zu dem eine Krankenkasse die Verschreibung akzeptiert und bezahlt."
* insert StructureDefinition(GEM_ERP_EX_AcceptDate)
* . ^short = "Akzeptanzdatum der Verschreibung"
* . ^definition = "Datum, bis zu dem die Krankenkasse die Verschreibung akzeptiert."
* ^context.type = #element
* ^context.expression = "Task"
* value[x] only date
