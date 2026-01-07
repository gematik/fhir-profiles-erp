Extension: GEM_ERP_EX_SupplyOptionsType
Id: GEM-ERP-EX-SupplyOptionsType
Title: "GEM ERP EX SupplyOptionsType"
Description: "Extension zur Angabe des bevorzugten Versorgungskanals"
* insert StructureDefinition(GEM_ERP_EX_SupplyOptionsType)
* ^context.type = #element
* ^context.expression = "Communication.payload"
* . ^short = "Optionen für bevorzugte oder angebotene Versorgungskanäle"
* . ^comment = "Sowohl Patient als auch Apotheke können ihre Lieferoptionen oder Angebote für die Abgabe von Medikamenten angeben."
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #closed
* extension contains
    delivery 1..1 and
    onPremise 1..1 and
    shipment 1..1
* extension[onPremise] ^short = "Dispensation wird vor Ort angeboten/bevorzugt."
* extension[onPremise] ^definition = "Patient oder Apotheke können ihre bevorzugte oder angebotene Lieferoption angeben, um Medikamente vor Ort abzuholen."
* extension[onPremise].value[x] only boolean
* extension[onPremise].value[x] ^short = "true = auf Prämisse akzeptiert/angeboten eingehen"
* extension[delivery] ^short = "Dispensation wird vom Boten angeboten/bevorzugt."
* extension[delivery] ^definition = "Patient oder Apotheke können ihre bevorzugte oder angebotene Lieferoption angeben, um Medikamente per Boten zuzustellen."
* extension[delivery].value[x] only boolean
* extension[delivery].value[x] ^short = "wahr = Lieferung per Bote akzeptiert/angeboten"
* extension[shipment] ^short = "Dispensation wird durch Versand angeboten/bevorzugt."
* extension[shipment] ^definition = "Patient oder Apotheke können ihre bevorzugte oder angebotene Lieferoption angeben, um Medikamente per Paketversand zu versenden."
* extension[shipment].value[x] only boolean
* extension[shipment].value[x] ^short = "wahr = Paketversand akzeptiert/angeboten"
