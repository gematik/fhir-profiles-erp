Profile: GEM_ERP_PR_MedicationDispense_DiGA
Parent: EPAMedicationDispense
Id: GEM-ERP-PR-MedicationDispense-DiGA
Title: "Dispensierung einer DiGA-Verordnung"
Description: "Verarbeitet Informationen über die ausgegebene DiGA"
* insert Profile(GEM_ERP_PR_MedicationDispense_DiGA)
* obeys workflow-medicationdispense-redeemcode-1
* obeys workflow-medicationdispense-redeemcode-2
* obeys workflow-medicationdispense-redeemcode-3

* extension 0..*
* extension contains 
    GEM_ERP_EX_RedeemCode named redeemCode 0..1
    and GEM_ERP_EX_DeepLink named deepLink 0..1

* identifier contains prescriptionID 1..1
* identifier[prescriptionID] only EPrescriptionId
* identifier[prescriptionID] ^patternIdentifier.system = $prescription-id-ns
* identifier ^short = "E-Rezept-ID"

* status = #completed (exactly)
* status ^short = "completed"

* medication[x] only Reference
* medication[x] MS
* medication[x] ^definition = "Informationen über das Medikament, das abgegeben wird. Dazu gehören der Name und die PZN-Kennzeichnung einer DiGA-Verordnungseinheit."
* medicationReference.display 0..1 MS
  * ^short = "Name der DiGA-Verschreibungseinheit."
* medicationReference.identifier 0..1 MS
  * ^short = "Eindeutige Identifikationsnummer für eine Verschreibungseinheit einer DiGA (PZN)."
  * system 1..1 MS
  * system = $cs-pzn (exactly)
  * value 1..1 MS

// Extension, falls die DiGA vom Kostenträger nicht bezahlt wird
* medicationReference.extension contains DataAbsentReason named data-absent-reason 0..1
* medicationReference.extension[data-absent-reason].valueCode = #asked-declined

// Kostenträger 
* performer 1..1
  * actor MS
    * identifier 1..1
    * identifier only IdentifierTelematikId

// Abgabedatum
* whenHandedOver 1..1
* whenHandedOver ^short = "Abgabedatum"
* whenHandedOver obeys workflow-abgabeDatumsFormat

* substitution 0..0
  * ^comment = "Laut Bundesamt für Soziale Sicherung ist der Ersatz für DiGAs nicht erlaubt."

Invariant: workflow-medicationdispense-redeemcode-1
Description: "Eine Notiz wurde nicht gefunden, ist jedoch obligatorisch, wenn kein Einlösecode angegeben wird."
Expression: "extension.where(url = 'https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_RedeemCode').empty() implies note.exists()"
Severity: #error

Invariant: workflow-medicationdispense-redeemcode-2
Description: "Der Grund für fehlende Daten wurde nicht gefunden, ist jedoch obligatorisch, wenn kein Einlösecode angegeben wird."
Expression: "extension.where(url = 'https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_RedeemCode').empty() implies medication.extension.where(url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason').exists()"
Severity: #error

Invariant: workflow-medicationdispense-redeemcode-3
Description: "Name und Kennung der DiGA wurden nicht gefunden, sind jedoch obligatorisch, wenn ein Einlösecode angegeben wird."
Expression: "extension.where(url = 'https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_RedeemCode').exists() implies (medication.display.exists() and medication.identifier.exists())"
Severity: #error
