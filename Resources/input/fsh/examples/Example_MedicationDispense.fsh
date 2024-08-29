
Instance: Example-MedicationDispense
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* medicationReference = Reference(SumatripanMedication)

Instance: Example-MedicationDispense-2
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example another Medication Dispense"
Description: "Example of another Medication Dispense."
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* medicationReference = Reference(Medication-Without-Strength-Code)

Instance: Example-MedicationDispense-Kombipackung
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example Kombipackung Medication Dispense"
Description: "Example of a Kombipackung Medication Dispense."
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* medicationReference = Reference(Medication-Kombipackung)

Instance: Example-MedicationDispense-Rezeptur
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example Rezeptur Medication Dispense"
Description: "Example of a Rezeptur Medication Dispense."
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* medicationReference = Reference(Medication-Rezeptur)

/*

Instance: INVALID-DATE-Example-MedicationDispense-1
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024"
* contained[+] = SumatripanMedication
* medicationReference = Reference(SumatripanMedication)

Instance: INVALID-DATE-Example-MedicationDispense-2
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04"
* contained[+] = SumatripanMedication
* medicationReference = Reference(SumatripanMedication)

Instance: INVALID-DATE-Example-MedicationDispense-3
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "1-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03T15:28:00+00:00"
* contained[+] = SumatripanMedication
* medicationReference = Reference(SumatripanMedication)

Instance: INVALID-DATE-Example-MedicationDispense-4
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03T00:00:00.000Z"
* contained[+] = SumatripanMedication
* medicationReference = Reference(SumatripanMedication)

*/