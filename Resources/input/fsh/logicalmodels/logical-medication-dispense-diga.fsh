Logical: LogicalDiGAMedicationDispense
Parent: Base
Id: logical-diga-medication-dispense
Title: "Logical DiGA Medication Dispense"
Description: "Fachliches Modell zur Beschreibung der Informationen, die bei $close und $dispense in der MedicationDispense-Ressource für DiGAs übermittelt werden."
* prescriptionId 1..1 string "ID des E-Rezepts"
* status 1..1 code "Status fixedValue: #completed"
* patientKVNR 1..1 string "KVNR des Patienten"
* angabeAbgebendeInstutition 1..1 Identifier "Telematik-ID der abgebenden Institution"
* freischaltCode 0..1 string "Freischaltcode für die DiGA"
  * ^definition = "Optional, da die Kasse die Bereitstellung eines Freischaltcodes ablehnen kann."
* deepLink 0..1 string "Universeller Deep Link, der vom DiGA Hersteller bereitgestellt wird"
* angabenZurDiGA 1..1 BackboneElement "Angaben zur DiGA"
  * name 1..1 string "Name der DiGA"
  * digaVeId 0..0 string "Eindeutige Identifikationsnummer zu einer Verordnungseinheit einer digitalen Gesundheitsanwendung (DiGA-VE)."
* abgabeDatum 1..1 dateTime "Abgabedatum im Format YYYY-MM-DD"
* abgabeHinweise 0..* Annotation "Hinweise zur Abgabe, wenn vorhanden"

