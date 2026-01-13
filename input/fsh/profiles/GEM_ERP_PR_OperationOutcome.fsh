Profile: GEM_ERP_PR_OperationOutcome
Parent: OperationOutcome
Id: GEM-ERP-PR-OperationOutcome
Title: "GEM ERP PR OperationOutcome"
Description: "OperationOutcome für Angabe von Fehlermeldungen vom E-Rezept-Fachdienst"
* insert Profile(GEM_ERP_PR_OperationOutcome)

* issue.severity MS
* issue.code MS
* issue.details 1..1 MS
* issue.details from GEM_ERP_VS_OperationOutcomeDetails