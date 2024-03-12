Logical: EBtMVerschreibungsnachweisFachmodell
Id: e-btm-verschreibungsnachweis-logical-model
Title: "E-BtM-Verschreibungsnachweis"
Description: "Darstellung eines Dokumentes für den Verordnenden zur Verschreibung eines E-BtM. Dieses Dokument wird nach Aufruf der $activate-ebtm Operation vom E-Rezept-Fachdienst an den Verordnenden übermittelt."
* verordnungsdatensatz 1..1 Binary "Base64 codierter PKCS7 Datensatz der Verordnung mit QES"
* verordnungsBestaetigungBfArM 1..1 Provenance "Provenance Ressource als Bestätigung des BfArMs zur Verordnung des E-BtM, welche vom BfArM Prüfdienst signiert wurde."
  * telematikIdVerordnender 1..1 Identifier "Telematik-ID des Verordnenden LE"
  * rezeptId 1..1 Identifier "Rezept-ID"
  * zeitstempelDesOperationsaufrufs 1..1 instant "Zeitstempel des Operationsaufrufs $activate-ebtm"
  * signatur 1..1 signature "Signatur des BfArM"
    * date 1..1 date "Datum der Signatur"
    * signierender 1..1 string "Bundesdruckerei"
    * autorisierendeEinrichtung 1..1 string "BfArM"
    * signaturdaten 1..1 base64Binary "Signaturdaten als PKCS7 Datensatz"