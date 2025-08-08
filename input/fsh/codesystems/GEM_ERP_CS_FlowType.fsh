CodeSystem: GEM_ERP_CS_FlowType
Id: GEM-ERP-CS-FlowType
Title: "CodeSystem der Flowtypen"
Description: """
Zeigt die verschiedenen Typen des E-Rezept Workflows entsprechend der Verordnungsformulare.

WICHTIG: Der Codebereich 9xx ist reserviert für Abrechnungsprozesse in Apotheken wie z.B. Pharmazeutische Dienstleistungen!
"""
* insert CodeSystem(GEM_ERP_CS_FlowType)
* ^content = #complete
* #160 "Flowtype für Apothekenpflichtige Arzneimittel"
* #162 "Flowtype für Digitale Gesundheitsanwendungen"
* #165 "Flowtype für Betäubungsmittel"
* #166 "Flowtype für Arzneimittel nach § 3a AMVV"
* #169 "Flowtype zur Workflow-Steuerung durch Leistungserbringer"
* #200 "Flowtype für Apothekenpflichtige Arzneimittel (PKV)"
* #209 "Flowtype zur Workflow-Steuerung durch Leistungserbringer (PKV)"
// Der Codebereich 9xx ist reserviert für Abrechnungsprozesse in Apotheken wie z.B. Pharmazeutische Dienstleistungen!