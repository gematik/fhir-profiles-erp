Profile: GEM_ERP_PR_Communication
Parent: Communication
Id: GEM-ERP-PR-Communication
Title: "Generische Workflow-Communication"
Description: "Diese Communication beschreibt Felder und Anforderungen für alle Communications im Workflow-Paket."
* insert StructureDefinition(GEM_ERP_PR_Communication)
* ^abstract = true

* basedOn
  * ^short = "Gibt das E-Rezept-Token gemäß gemSpec_DM_eRp an."
  * ^comment = "Hat die Form 'Task/{{PrescriptionID}}'"
  * reference
    * ^short = "Gibt das E-Rezept-Token gemäß gemSpec_DM_eRp an."
    * ^comment = "Hat die Form 'Task/{{PrescriptionID}}'"
* status
  * ^comment = "Muss standardmäßig laut FHIR Core Specification angegeben werden, wird jedoch während des Lebenszyklus der Ressource nicht verändert."
* sent
  * ^short = "Der Zeitpunkt, zu dem diese Kommunikation gesendet wurde."
  * ^comment = "Wird vom E-Rezept-Server gesetzt. Ein Client hat diesen Wert daher immer verfügbar."
* received
  * ^short = "Der Zeitpunkt, zu dem diese Kommunikation empfangen wurde."
  * ^comment = "Wird vom E-Rezept-Server gesetzt. Ein Client hat diesen Wert daher immer verfügbar."

* recipient
  * ^short = "Die Entität (z. B. Person, Organisation), die Ziel der Kommunikation war."
  * ^comment = "Muss vom Absender der Kommunikation gesetzt werden, um das Ziel festzulegen."

* sender
  * ^short = "Die Entität (z. B. Person, Organisation), die Quelle der Kommunikation war."
  * ^comment = "Wird vom E-Rezept-Server unter Verwendung der AuthN-Credential des Clients gesetzt."
  * ^definition = "Nachrichtenabsender — wird vom E-Rezept-Server unter Verwendung der AuthN-Credential des Clients gesetzt.\r\nDie Entität (z. B. Person, Organisation), die Quelle der Kommunikation war."
* payload
  * content[x]
    * ^short = "Der tatsächliche Inhalt der Nachricht"
    * ^comment = "Dieser Inhalt muss ein JSON gemäß gemSpec_DM_eRp sein."

// Remove unused fields
* instantiatesCanonical 0..0
* instantiatesUri 0..0
* partOf 0..0
* inResponseTo 0..0
* statusReason 0..0
* category 0..0
* priority 0..0
* medium 0..0
* subject 0..0
* topic 0..0
* about 0..0
* encounter 0..0
* reasonCode 0..0
* reasonReference 0..0
* note 0..0