Profile: GEM_ERP_PR_Communication_DispReq
Parent: Communication
Id: GEM-ERP-PR-Communication-DispReq
Title: "Anfrage zur Einlösung des E-Rezepts"
Description: "Ressource, die für die Kommunikation einer Einlöseanfrage zwischen Patient und Leistungserbringer auf Basis des E-Rezepts verwendet wird."
* insert Profile(GEM_ERP_PR_Communication_DispReq)
* obeys workflow-communication-payload-1

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.description = "Extensions are always sliced by (at least) url"
* extension ^slicing.rules = #open
* extension ^slicing.ordered = false

* extension contains GEM_ERP_EX_PrescriptionType named flowType 1..1

* recipient 1..1 MS
* recipient.identifier 1.. MS
* recipient.identifier only IdentifierTelematikId

* sender.identifier 1.. MS
* sender.identifier only IdentifierKvid10

* payload 0..1 MS
* payload.content[x] only string

Invariant: workflow-communication-payload-1
Description: "Payload muss angegeben werden, wenn eine Zuweisung für ein Arzneimittel vorgenommen wird"
* severity = #error
* expression = "(extension.where(url = 'https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType').value.code = '162' implies payload.exists().not()) and (extension.where(url = 'https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType').value.code != '162' implies payload.exists() and payload.empty().not())"
