Logical:         EBtMVerschreibungsnachweis
Id:              e-btm-verschreibungsnachweis-logical-model
Title:           "E-BtM-Verschreibungsnachweis"
Description:     "Darstellung eines Dokumentes für den Verordnenden zur Verschreibung eines E-BtM"
* verordnungsdatensatz 1..1 Binary "Base64 codierter PKCS7 Datensatz der Verordnung mit QES"
* verordnungsBestaetigung 1..1 Provenance "Provenance Ressource als Bestätigung des BfArMs zur Verordnung des E-BtM"
  * telematikIdVerordnender 1..1 Identifier "Telematik-ID des Verordnenden LE"
  * informationFachdienst 1..1 Identifier "Informationen zum Fachdienst"
  * signature 1..1 signature "Signatur des BfArM"
    * date 1..1 date "Datum der Signatur"
    * testFeld 1..1 Element "Test Feld"

Logical:         EBtMAbgabenachweis
Id:              e-btm-abgabenachweis-logical-model
Title:           "E-BtM-Abgabenachweis"
Description:     "Darstellung eines Dokumentes für den Abgebenden zur Dokumentation der Abgabe eines BtM"
* verordnungsdatensatz 1..1 Binary "Base64 codierter PKCS7 Datensatz der Verordnung mit QES"
* abgabedatensatz 1..1 Binary "DAV-AbgabeDatensatz signiert als PKCS7" "GKV: https://simplifier.net/erezeptabgabedaten und PKV: https://simplifier.net/erezeptabgabedatenpkv"
  * abgabezeitpunkt 1..1 dateTime "Zeitpunkt der Abgabe"
  * aussteller 1..1 Reference(Practitioner or Organization)d "Ersteller des Abgabedatensatzes"
  * abgegebenesMedikament 1..1 Medication "Arzneimittel, welches abgegeben wurde"
* quittung 1..1 Element "Quittung vom Fachdienst nach Aufruf der $close-Operation" "Definition der Quittung"
  * abgabeStart 1..1 Element "Zeitpunkt des Starts der Belieferung = Aufruf der $accept-Operation"
  * abgabeEnde 1..1 Element "Zeitpunkt des Beendens der Belieferung seitens des Abgebenden = Aufruf der $close-Operation"