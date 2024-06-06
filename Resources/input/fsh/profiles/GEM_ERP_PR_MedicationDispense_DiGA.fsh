Profile: GEM_ERP_PR_MedicationDispense_DiGA
Parent: $ePAMedicationDispense
Id: GEM-ERP-PR-MedicationDispense-DiGA
Title: "Dispensation of a DiGA-Prescription"
Description: "Handles information about the dispensed DiGA"
* insert Profile(GEM_ERP_PR_MedicationDispense_DiGA)
* obeys workflow-medicationdispense-redeemcode-1
* obeys workflow-medicationdispense-redeemcode-2
* obeys workflow-medicationdispense-redeemcode-3

* extension 0..*
* extension contains 
    GEM_ERP_EX_RedeemCode named redeemCode 0..1
    and GEM_ERP_EX_DeepLink named deepLink 0..1

* identifier contains prescriptionID 1..1
* identifier[prescriptionID] only GEM_ERP_PR_PrescriptionId
* identifier[prescriptionID] ^patternIdentifier.system = $prescription-id-ns
* identifier ^short = "ePrescription identifier"

* status = #completed (exactly)
* status ^short = "completed"

* medication[x] only Reference
* medication[x] MS
* medication[x] ^definition = "Information about the medication that is being dispensed. To include are name and DiGA-VE-ID."
* medicationReference.display 0..1 MS
  * ^short = "Name of the DiGA"
* medicationReference.identifier 0..1 MS
* medicationReference.identifier.system 1..1 MS
* medicationReference.identifier.system = "https://fhir.bfarm.de/Identifier/DigaId" (exactly)
* medicationReference.identifier.value 1..1 MS
  * ^short = "Unique identification number for a prescription unit of a DiGA (DiGA-ID)."

// Extension, falls die DiGA vom Kostenträger nicht bezahlt wird
* medicationReference.extension contains DataAbsentReason named data-absent-reason 0..1
* medicationReference.extension[data-absent-reason].valueCode = #asked-declined

// KVNR des Versicherten
* subject 1..
* subject.identifier 1..
* subject.identifier only $identifier-kvid-10 // Hier nur die KVNR der GKV, da für PKV kein DiGA angedacht ist
* subject.identifier ^short = "The patients KVNR"
* subject.identifier ^comment = "There is no PKV identifier available since it is not in the scope for DiGA prescriptions."

// Kostenträger 
* performer 1..1
* performer.actor.identifier 1..
* performer.actor.identifier only IdentifierTelematikId

// Abgabedatum
* whenHandedOver 1..1
* whenHandedOver ^short = "Date of dispensation"
* whenHandedOver obeys workflow-abgabeDatumsFormat

* substitution 0..0
  * ^comment = "According to BAS the substitution for DiGAs is not allowed"

Invariant: workflow-medicationdispense-redeemcode-1
Description: "A note was not found, but is mandatory if no redeem code is provided."
Expression: "extension.where(url = 'https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-EX-RedeemCode').empty() implies note.exists()"
Severity: #error

Invariant: workflow-medicationdispense-redeemcode-2
Description: "The data absent reason was not found, but is mandatory if no redeem code is provided."
Expression: "extension.where(url = 'https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-EX-RedeemCode').empty() implies medicationReference.extension.where(url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason').exists()"
Severity: #error

Invariant: workflow-medicationdispense-redeemcode-3
Description: "Name of the DiGA and DiGA-ID was not found, but is mandatory if a redeem code is provided."
Expression: "extension.where(url = 'https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-EX-RedeemCode').exists() implies (medicationReference.display.exists() and medicationReference.identifier.exists())"
Severity: #error

Instance: Example-MedicationDispense-DiGA-Name-And-VE-ID
InstanceOf: GEM_ERP_PR_MedicationDispense_DiGA
Usage: #example
Title: "Medication Dispense DiGA, Name and DiGA-VE-ID"
Description: "Example of a Medication Dispense for DiGAs only stating the name of the DiGA."
* extension[redeemCode].valueString = "DE12345678901234"
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "162.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "8-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* medicationReference.display = "Gematico Diabetestherapie"
* medicationReference.identifier.system = "https://fhir.bfarm.de/Identifier/DigaId"
* medicationReference.identifier.value = "12345678"

Instance: Example-MedicationDispense-DiGA-DeepLink
InstanceOf: GEM_ERP_PR_MedicationDispense_DiGA
Usage: #example
Title: "Medication Dispense DiGA with a deep link."
Description: "Example of a Medication Dispense for DiGAs which states a deep link."
* extension[redeemCode].valueString = "DE12345678901234"
* extension[deepLink].valueUrl = "https://gematico.de?redeemCode=DE12345678901234"
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "162.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "8-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* medicationReference.display = "Gematico Diabetestherapie"
* medicationReference.identifier.system = "https://fhir.bfarm.de/Identifier/DigaId"
* medicationReference.identifier.value = "12345678"

Instance: Example-MedicationDispense-DiGA-NoRedeemCode
InstanceOf: GEM_ERP_PR_MedicationDispense_DiGA
Usage: #example
Title: "Medication Dispense DiGA without a redeem code"
Description: "Example of a Medication Dispense for DiGAs which has no redeem code."
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "162.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "8-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* note.text = "Freischaltcode für DiGA konnte nicht erstellt werden"
* medicationReference.extension[data-absent-reason].valueCode = #asked-declined

Instance: INVALID-Example-MedicationDispense-DiGA-Only-Name
InstanceOf: GEM_ERP_PR_MedicationDispense_DiGA
Usage: #example
Title: "Medication Dispense DiGA, Name only"
Description: "Example of a Medication Dispense for DiGAs only stating the name of the DiGA."
* extension[redeemCode].valueString = "DE12345678901234"
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "162.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "8-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* medicationReference.display = "Gematico Diabetestherapie"

Instance: INVALID-Example-MedicationDispense-DiGA-MissingNote
InstanceOf: GEM_ERP_PR_MedicationDispense_DiGA
Usage: #example
Title: "Invalid MedicationDispense for missing Note"
Description: "A Note needs to be provided if no redeem code is provided."
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "162.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "8-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* medicationReference.extension[data-absent-reason].valueCode = #asked-declined

Instance: INVALID-Example-MedicationDispense-DiGA-MissingDataAbsentReason
InstanceOf: GEM_ERP_PR_MedicationDispense_DiGA
Usage: #example
Title: "Invalid MedicationDispense for missing DataAbsentReason"
Description: "A DataAbsentReason needs to be provided if no redeem code is provided."
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "162.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "8-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* note.text = "Freischaltcode für DiGA konnte nicht erstellt werden"
* medicationReference.display = "whitespace"

Instance: INVALID-Example-MedicationDispense-Missing-DiGA-Name
InstanceOf: GEM_ERP_PR_MedicationDispense_DiGA
Usage: #example
Title: "Invalid Medication Dispense DiGA. Missing Name"
Description: "When a redeem code is provided, the name of the DiGA is mandatory."
* extension[redeemCode].valueString = "DE12345678901234"
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "162.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "8-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* medicationReference.identifier.system = "https://fhir.bfarm.de/Identifier/DigaId"
* medicationReference.identifier.value = "12345678"

Instance: INVALID-Example-MedicationDispense-Missing-DiGA-VE-ID
InstanceOf: GEM_ERP_PR_MedicationDispense_DiGA
Usage: #example
Title: "Invalid Medication Dispense DiGA. Missing DiGA-VE-ID"
Description: "When a redeem code is provided, the DiGA-VE-ID is mandatory."
* extension[redeemCode].valueString = "DE12345678901234"
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "162.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "8-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* medicationReference.display = "Gematico Diabetestherapie"

Instance: INVALID-Example-MedicationDispense-Missing-DiGA-Name-And-VE-ID
InstanceOf: GEM_ERP_PR_MedicationDispense_DiGA
Usage: #example
Title: "Invalid Medication Dispense DiGA. Missing Name and DiGA-VE-ID"
Description: "When a redeem code is provided, the Name and DiGA-VE-ID are mandatory."
* extension[redeemCode].valueString = "DE12345678901234"
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "162.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "8-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* medicationReference.display = "whitespace"