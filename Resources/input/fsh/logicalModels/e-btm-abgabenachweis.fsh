Logical: EBtMAbgabenachweisFachmodell
Id: e-btm-abgabenachweis-logical-model
Title: "E-BtM-Abgabenachweis Fachmodell"
Description: "Darstellung eines Dokumentes für den Abgebenden zur Dokumentation der Abgabe eines BtM. Dieses Dokument wird im AVS erstellt und für Dokumentationszwecke aufbewahrt."
* abgabenachweisComposition 1..1 Composition "Zusammensetzung des Abgabenachweises als Inhaltsverzeichnis. Enthält Verweise zu den einzelnen FHIR-Ressourcen."
* verordnungsdatensatz 1..1 Binary "Base64 codierter PKCS7 Datensatz der Verordnung mit QES"
* abgabedatensatz 1..1 Binary "DAV-AbgabeDatensatz (GKV oder PKV) signiert als PKCS7" "GKV: https://simplifier.net/erezeptabgabedaten und PKV: https://simplifier.net/erezeptabgabedatenpkv"
* quittung 1..1 Element "Quittung vom Fachdienst nach Aufruf der $close-Operation, welche die Signatur des E-Rezept-Fachdienst enthält."
  * abgabeStart 1..1 Element "Zeitpunkt des Starts der Belieferung = Aufruf der $accept-Operation"
  * abgabeEnde 1..1 Element "Zeitpunkt des Beendens der Belieferung seitens des Abgebenden = Aufruf der $close-Operation"
  * signature 1..1 Element "Signatur des E-Rezept-Fachdienstes"