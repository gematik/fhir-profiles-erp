Mapping: VerschreibungsNachweisMapping
Source: EBtMVerschreibungsnachweisFachmodell
Target: "GEM_ERP_PR_Bundle_Practitioner_Documentation"
Id: mapping-verschreibungsnachweis-to-practitioner-documentation
Title: "Verschreibungsnachweis zu Pracitioner_Documentation_Bundle Mapping"
Description: "Mapping für Verschreibungsnachweis zum Bundle GEM_ERP_PR_Bundle_Practitioner_Documentation"
* -> "GEM_ERP_PR_Bundle_Practitioner_Documentation" "Das Modell mapt auf das E-BtM-VerschreibungsNachweis Bundle"
* verordnungsdatensatz -> "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle"
* verordnungsBestaetigungBfArM -> "GEM_ERP_PR_BfArMApproval"
  * telematikIdVerordnender -> "Provenance.agent[practitioner].who.identifier.value"
  * rezeptId -> "Provenance.target.identifier.value"
  * zeitstempelDesOperationsaufrufs -> "Provenance.recorded"
  * signatur -> "Provenance.signature"
    * date -> "Provenance.signature.when"
    * signierender -> "Provenance.signature.who"
    * autorisierendeEinrichtung -> "Provenance.signature.onBehalfOf"
    * signaturdaten -> "Provenance.signature.data"