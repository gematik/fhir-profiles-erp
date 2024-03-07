Mapping: AbgabeNachweisMapping
Source: EBtMAbgabenachweis
Target: "GEM_ERP_PR_Bundle_Pharmacy_Proof"
Id: mapping-abgabenachweis-to-pharmacy-proof-bundle
Title: "Abgabe Nachweis zu Bundle Mapping"
Description: "Mapping für Abgabenachweis zum Bundle GEM_ERP_PR_Bundle_Pharmacy_Proof"
* -> "GEM_ERP_PR_Bundle_Pharmacy_Proof" "Das Modell mapt auf das E-BtM-AbgabeNachweis Bundle"
* verordnungsdatensatz -> "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle"
* abgabedatensatz -> "https://simplifier.net/erezeptabgabedaten"
* abgabedatensatz -> "https://simplifier.net/erezeptabgabedatenpkv"
* abgabedatensatz.abgabezeitpunkt -> "DAV_PR_ERP_AbgabedatenComposition.date"
* abgabedatensatz.aussteller -> "DAV_PR_ERP_AbgabedatenComposition.author"
* abgabedatensatz.abgegebenesMedikament -> "DAV_PR_ERP_Abgabeinformationen.medication"
* quittung -> "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle"
* quittung.abgabeStart -> "Composition.event.period.start"
* quittung.abgabeEnde -> "Composition.event.period.end"
