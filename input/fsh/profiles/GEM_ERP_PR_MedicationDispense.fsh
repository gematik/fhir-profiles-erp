Profile: GEM_ERP_PR_MedicationDispense
Parent: EPAMedicationDispense
Id: GEM-ERP-PR-MedicationDispense
Title: "Dispensierung eines E-Rezepts"
Description: "Verarbeitet Informationen über die Dispensierung eines E-Rezepts und die abgegebenen Medikamente."
* insert Profile(GEM_ERP_PR_MedicationDispense)
* obeys workflow-dosageExtensionBeiDosierung

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

Invariant: workflow-abgabeDatumsFormat
Description: "Wert muss ein Datum in der Form: YYYY-MM-DD sein."
* severity = #error
* expression = "toString().length()=10"

Invariant: workflow-dosageExtensionBeiDosierung
Description: "Wenn eine Dosierung angegeben wurde, muss der generierte Dosierungstext, sowie die Metainformationen zur Generierung angegeben werden."
Expression: "dosageInstruction.exists() implies extenstion.where(url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationDispense.renderedDosageInstruction').exists() and extenstion.where(url = 'http://ig.fhir.de/igs/medication/StructureDefinition/GeneratedDosageInstructionsMeta').exists()"
Severity: #error


