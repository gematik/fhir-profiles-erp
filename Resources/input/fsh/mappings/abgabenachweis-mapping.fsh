Mapping: AbgabeNachweisMapping
Source: EBtMAbgabenachweisFachmodell
Target: "GEM_ERP_PR_Bundle_Pharmacy_Proof"
Id: mapping-abgabenachweis-to-pharmacy-documentation
Title: "Abgabe Nachweis zu Bundle Mapping"
Description: "Mapping für Abgabenachweis zum Bundle GEM_ERP_PR_Bundle_Pharmacy_Documentation"
* -> "GEM_ERP_PR_Bundle_Pharmacy_Proof" "Das Modell mapt auf das E-BtM-AbgabeNachweis Bundle"
* verordnungsdatensatz -> "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle"
* abgabedatensatz -> "https://simplifier.net/erezeptabgabedaten"
* abgabedatensatz -> "https://simplifier.net/erezeptabgabedatenpkv"
* quittung -> "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle"
* quittung.abgabeStart -> "Composition.event.period.start"
* quittung.abgabeEnde -> "Composition.event.period.end"
* quittung.signature -> "Composition.signature"
