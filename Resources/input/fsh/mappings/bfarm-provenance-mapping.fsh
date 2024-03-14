Mapping: BfarmProvenanceMapping
Source: VerordnungsBestaetigungBfArMFachmodell
Target: "GEM_ERP_PR_BfArMApproval"
Id: mapping-fachmodell-to-bfarm-approval
Title: "Mappgin für BfArM-Prüfung"
Description: "Mapping für des Fachmodells der BfArM Prüfung zum Profil GEM_ERP_PR_BfArMApproval"
* -> "GEM_ERP_PR_BfArMApproval" "Das Modell mapt auf das BfArM Approval"

* akteur -> "GEM_ERP_PR_BfArMApproval.agent"
* akteurFachdienst -> "GEM_ERP_PR_BfArMApproval.agent[eprescription-server]"
* akteurPruefdienst -> "GEM_ERP_PR_BfArMApproval.agent[bfarm-server]"
* akteurVerordnender -> "GEM_ERP_PR_BfArMApproval.agent[practitioner]"


* rezeptId -> "GEM_ERP_PR_BfArMApproval.target.identifier"
* zeitstempelDesOperationsaufrufs -> "GEM_ERP_PR_BfArMApproval.recorded"
* signatur -> "GEM_ERP_PR_BfArMApproval.signature"
  * datumDerSignatur -> "GEM_ERP_PR_BfArMApproval.signature.when"
  * signierender -> "GEM_ERP_PR_BfArMApproval.signature.who"
  * autorisierendeEinrichtung -> "GEM_ERP_PR_BfArMApproval.signature.onBehalfOf"
  * signaturdaten -> "GEM_ERP_PR_BfArMApproval.signature.data"