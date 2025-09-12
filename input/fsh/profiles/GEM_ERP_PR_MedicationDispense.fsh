Profile: GEM_ERP_PR_MedicationDispense
Parent: EPAMedicationDispense
Id: GEM-ERP-PR-MedicationDispense
Title: "Dispensierung eines E-Rezepts"
Description: "Verarbeitet Informationen über die Dispensierung eines E-Rezepts und die abgegebenen Medikamente."
* insert Profile(GEM_ERP_PR_MedicationDispense)
* identifier contains prescriptionID 1..1
* identifier[prescriptionID] only EPrescriptionId
* identifier[prescriptionID] ^patternIdentifier.system = $prescription-id-ns
* identifier ^short = "E-Rezept-ID"

* status = #completed (exactly)
* status ^short = "completed"

* medication[x] only Reference(GEM_ERP_PR_Medication)
* medication[x] MS
* medication[x] ^definition = "Die MedicationDispense verweist auf ein Medikament, das abgegeben wurde."

* performer 1..1
* performer.actor.identifier 1..
* performer.actor.identifier only IdentifierTelematikId
* whenPrepared ^mustSupport = false
* whenPrepared obeys workflow-abgabeDatumsFormat
* whenHandedOver 1..
* whenHandedOver obeys workflow-abgabeDatumsFormat

* dosageInstruction MS
* dosageInstruction only DosageDgMP

// Additions to support structured Dosageinstruction
* extension contains $medicationDispense-renderedDosageInstruction-r5 named renderedDosageInstruction 0..1 MS
  and GeneratedDosageInstructionsMeta named generatedDosageInstructionsMeta 0..1 MS

* extension[renderedDosageInstruction]
  * ^short = "Dosierungsanweisung"
  * ^definition = "Diese R5 backport Extension enthält die algorithmisch generierten gerenderten Dosierungsanweisungen, die für den Patienten bestimmt sind, um eine klare und verständliche Anweisung zur Einnahme des Medikaments zu geben."
  * valueMarkdown
    * ^short = "Hinweis: In der ersten Ausbaustufe des dgMP ist nur einfacher Text (String) zulässig; Markdown wird nicht unterstützt."
    * ^definition = "Abweichend von FHIR R5 (Typ Markdown) darf in der ersten Ausbaustufe des dgMP ausschließlich Klartext ohne Markdown‑Formatierungen (z. B. Überschriften, Listen, Links) geliefert werden."

* extension[generatedDosageInstructionsMeta]
  * ^short = "Metadaten zu den generierten Dosierungsanweisungen"
  * ^definition = "Diese Extension enthält zusätzliche Metadaten zu den automatisch generierten Dosierungsanweisungen, wie z.B. Informationen zur Generierung oder zum Ursprung der Daten."

// TODO: Constraint für wenn dosage dann extensions

Invariant: workflow-abgabeDatumsFormat
Description: "Wert muss ein Datum in der Form: YYYY-MM-DD sein."
* severity = #error
* expression = "toString().length()=10"

Invariant: workflow-dosageExtensionBeiDosierung
Description: "Wenn eine Dosierung angegeben wurde, muss der generierte Dosierungstext, sowie die Metainformationen zur Generierung angegeben werden."
Expression: "dosageInstruction.exists() implies extenstion.where(url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationDispense.renderedDosageInstruction').exists() and extenstion.where(url = 'http://ig.fhir.de/igs/medication/StructureDefinition/GeneratedDosageInstructionsMeta').exists()"
Severity: #error


