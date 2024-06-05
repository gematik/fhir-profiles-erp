Profile: GEM_ERP_PR_MedicationDispense
Parent: $ePAMedicationDispense
Id: GEM-ERP-PR-MedicationDispense
Title: "Dispensation of the Prescription"
Description: "Handles information about the redeem of the prescription and the submited medication."
* insert Profile(GEM_ERP_PR_MedicationDispense)

* identifier contains prescriptionID 1..1
* identifier[prescriptionID] only GEM_ERP_PR_PrescriptionId
* identifier[prescriptionID] ^patternIdentifier.system = $prescription-id-ns
* identifier ^short = "ePrescription identifier"

* status = #completed (exactly)
* status ^short = "completed"

* medication[x] only Reference(GEM_ERP_PR_Medication)
* medication[x] MS
* medication[x] ^definition = "The MedicationDispense shows a contained medication which was dispensed"
* medication[x] ^type.aggregation = #contained

* performer 1..1
* performer.actor.identifier 1..
* performer.actor.identifier only IdentifierTelematikId
* whenPrepared ^mustSupport = false
* whenHandedOver 1..
* whenHandedOver obeys workflow-abgabeDatumsFormat
* dosageInstruction MS

Invariant: workflow-abgabeDatumsFormat
Description: "Wert muss ein Datum in der Form: YYYY-MM-DD sein."
* severity = #error
* expression = "toString().length()=10"

Instance: Example-MedicationDispense
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "1-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* whenPrepared = "2024-04-03"
* contained[+] = SumatripanMedication
* medicationReference.reference = "#001413e4-a5e9-48da-9b07-c17bab476407"

Instance: Example-DiGA-MedicationDispense
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "1-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* whenPrepared = "2024-04-03"
* medicationReference.display = "Beispiel App für Diabetestherapie"



/*

Instance: INVALID-DATE-Example-MedicationDispense-1
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "1-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024"
* whenPrepared = "2024"
* contained[+] = SumatripanMedication
* medicationReference.reference = "#001413e4-a5e9-48da-9b07-c17bab476407"

Instance: INVALID-DATE-Example-MedicationDispense-2
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "1-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04"
* whenPrepared = "2024-04"
* contained[+] = SumatripanMedication
* medicationReference.reference = "#001413e4-a5e9-48da-9b07-c17bab476407"

Instance: INVALID-DATE-Example-MedicationDispense-3
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "1-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03T15:28:00+00:00"
* whenPrepared = "2024-04-03T15:28:00+00:00"
* contained[+] = SumatripanMedication
* medicationReference.reference = "#001413e4-a5e9-48da-9b07-c17bab476407"

Instance: INVALID-DATE-Example-MedicationDispense-4
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "1-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03T00:00:00.000Z"
* whenPrepared = "2024-04-03T00:00:00.000Z"
* contained[+] = SumatripanMedication
* medicationReference.reference = "#001413e4-a5e9-48da-9b07-c17bab476407"

*/