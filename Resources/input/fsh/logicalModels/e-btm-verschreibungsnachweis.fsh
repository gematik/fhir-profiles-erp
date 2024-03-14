Logical: EBtMVerschreibungsnachweisFachmodell
Id: e-btm-verschreibungsnachweis-logical-model
Title: "E-BtM-Verschreibungsnachweis"
Description: "Darstellung eines Dokumentes für den Verordnenden zur Verschreibung eines E-BtM. Dieses Dokument wird nach Aufruf der $activate-ebtm Operation vom E-Rezept-Fachdienst an den Verordnenden übermittelt."
* verordnungsdatensatz 1..1 Binary "Base64 codierter und signierter PKCS7 Datensatz der Verordnung mit QES"
* verordnungsBestaetigungBfArM 1..1 Binary "Base64 codierter und signierter PKCS7 Datensatz der BfArM-Verordnungsbestätigung mit nonQES des BfArM Prüfdienstes."