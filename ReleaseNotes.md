<img align="right" width="250" height="47" src="./Resources/images/gematik_logo.png" /> <br />    
 
# Release Notes E-Rezept Workflow

## Release 1.6.0 (2025-09-30)
//TODO
- Insert generic Communication Profile to restrict all Workflow Communications
 
## Release 1.5.0 (2025-04-10)

### Breaking Changes
- `breaking-change` new meta.profile Version 1.5
- `breaking-change` new dependencies:
	- de.basisprofil.r4
	- de gematik.epa.medication
	- de gematik.terminology

### Profile Changes
- `new profile` GEM_ERP_PR_Communication_DiGA, used by Health Care Provider to interact with Patient concerning DiGA Prescriptions
- `retired profile` retired GEM_ERP_PR_Communication_InfoReq as it is not allowed
- `removed` Removed $create and $activate Input Parameter Profiles and in OperationDefinitions
- `removed` EPADosage for GEM_ERP_PR_Medication.dosageInstruction
- `added` Add Flag for Task to identify a Task redeemable in the EU

### Terminology Changes
- `removed` Removed unused GEM_ERP_VS_PerformerType
- `removed` Removed unused Code in GEM_ERP_CS_DocumentType

### Changed
- `changed` Remove Dependency for KBV Packages
- `changed` Add Must Supports in GEM_ERP_PR_Medication

## Release 1.4.0 (2024-07-15)

### Allgemeine Änderungen
- Anheben der Abhängigkeit "de.basisprofil.r4" auf 1.5.0
- Vollständige Abbildung der OperationDefinitions
- Hinzufügen von Beispielen

### Änderungen für ePA/eML
- MedicationDispense basiert auf ePA-MedicationDispense
- Einführung einer Workflow Medication basierend auf ePA-Medication
- Änderung der API für $close und $dispense (s. OperationDefinitions und dazugehörige Parametersprofile)

### Änderungen für DiGA
- Einführen einer DiGA-MedicationDispense zur Abgabe eines Freischaltcodes für DiGAs
- Einführung zwei neuer Extensions zur Angabe von Freischaltcode und eines universal Deep Links
- Einführung neuer Flow-Type 162 für DiGAs
- Neuer Organisationstyp_oid für Kostenträger
- Änderungen Communication_DispReq zur Zuweisung von DiGAS an Kostenträger

### Patch Changes
#### Änderungen von 1.4.2 zu 1.4.3
- Entfernen von meta.profile 1..1 für $create und $activate input Parameters

#### Änderungen von 1.4.1 zu 1.4.2
- Verbesserungen der FHIR-Path Expressions in Constraints
- Neue Constraints für die Operationen $close und $dispense

#### Änderungen von 1.4.0 zu 1.4.1
- Entfernen veralteter KBV-FOR-PKV Identifier
- Fix URLs für Extensions DeepLink and RedeemCode
- Setzen des Identifiers für DiGA-Abgabedaten auf PZN