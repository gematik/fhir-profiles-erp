Logical: GEM_ERP_LOG_MedicationDispense_DiGA
Parent: Base
Id: logMedDispenseDiGA
Title: "Logical DiGA Medication Dispense"
Description: "Fachliches Modell zur Beschreibung der Informationen, die bei $close und $dispense in der MedicationDispense-Ressource für DiGAs übermittelt werden."
* prescriptionId 1..1 string "ID des E-Rezepts"
* status 1..1 code "Status fixedValue: #completed"
* patientKVNR 1..1 string "KVNR des Patienten"
* angabeAbgebendeInstutition 1..1 Identifier "Telematik-ID der abgebenden Institution"
* freischaltCode 0..1 string "Freischaltcode für die DiGA"
  * ^definition = "Optional, da die Kasse die Bereitstellung eines Freischaltcodes ablehnen kann."
* deepLink 0..1 string "Universeller Deep Link, der vom DiGA Hersteller bereitgestellt wird"
* angabenZurDiGA 0..1 BackboneElement "Angaben zur DiGA. Zwingend anzugeben, wenn ein Freischaltcode bereitgestellt wird."
  * name 1..1 string "Name der DiGA"
  * digaVeId 1..1 string "Eindeutige Identifikationsnummer zu einer Verordnungseinheit einer digitalen Gesundheitsanwendung (DiGA-VE-ID)."
  * dataAbsentReason 0..1 code "Wird angegeben, wenn kein Freischaltcode bereitgestellt wird. fixedValue: #unknown"
* datum 1..1 dateTime "Abgabedatum im Format YYYY-MM-DD"
* note 0..1 Annotation "Wenn der Workflow abgeschlossen wird, ohne dass ein Freischaltcode bereitgestellt wird, muss dieser Wert angegeben werden."
* substitution 0..0 BackboneElement "Substitution darf lt. BAS nicht erfolgen."
