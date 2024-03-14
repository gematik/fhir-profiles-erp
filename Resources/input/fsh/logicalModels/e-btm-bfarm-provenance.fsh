Logical: VerordnungsBestaetigungBfArMFachmodell
Id: verordnungs-bestaetigung-bfarm-fachmodell
Title: "Fachmodell BfArM-Verordnungsbestätigung"
Description: "Provenance Ressource als Bestätigung des BfArMs zur Verordnung des E-BtM, welche vom BfArM Prüfdienst signiert wurde."


// Akteure in der Provenance Ressource
* akteur 3..3 BackboneElement "Akteure"
  * rolle 1..1 CodeableConcept "Rolle des Akteurs"
    * coding 1..1 Coding "Rolle des Akteurs"
      * code 1..1 code "Rollenkennung"
      * display 1..1 string "Rollenbezeichnung"

* akteurFachdienst 1..1 BackboneElement "E-Rezept-Fachdienst"
  * rolle 1..1 CodeableConcept "Rolle des Akteurs"
  * rolle.coding.display = "Data Processor"
  * rolle.coding.code = #dataprocessor

* akteurPruefdienst 1..1 BackboneElement "BfArM-Prüfdienst"
  * rolle 1..1 CodeableConcept "Rolle des Akteurs"
  * rolle.coding..display = "Verifier"
  * rolle.coding.code = #VERF

* akteurVerordnender 1..1 BackboneElement "Verordnender"
  * rolle 1..1 CodeableConcept "Rolle des Akteurs"
  * rolle.coding..display = "author (originator)"
  * telematikIdVerordnender 1..1 Identifier "Telematik-ID des Verordnenden LE"


* rezeptId 1..1 Identifier "Rezept-ID"
* zeitstempelDesOperationsaufrufs 1..1 instant "Zeitstempel des Operationsaufrufs $activate-ebtm"
* signatur 1..1 signature "Signatur des BfArM"
  * date 1..1 date "Datum der Signatur"
  * signierender 1..1 string "Bundesdruckerei"
  * autorisierendeEinrichtung 1..1 string "BfArM"
  * signaturdaten 1..1 base64Binary "Signaturdaten als PKCS7 Datensatz"