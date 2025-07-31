Instance: Example-MedicationDispense
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Beispiel Medikamentenabgabe"
Description: "Beispiel für eine Medikamentenabgabe mit vollständigen Angaben"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* insert Date(whenHandedOver)
* medicationReference = Reference(SumatripanMedication)

Instance: Example-MedicationDispense-ToID
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #inline
Title: "Beispiel Medikamentenabgabe mit ID"
Description: "Beispiel für eine Medikamentenabgabe mit spezifischer ID zur Referenzierung"
* id = "160.000.033.491.280.78"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* insert Date(whenHandedOver)
* medicationReference = Reference(30e0e53f-275c-46f5-9e59-04d55735dabb)

Instance: Example-MedicationDispense-Without-Medication
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Beispiel Medikamentenabgabe ohne Medikament"
Description: "Beispiel für eine Medikamentenabgabe ohne Medikamentenreferenz"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* insert Date(whenHandedOver)
* medicationReference = Reference(SumatripanMedication)

Instance: Example-MedicationDispense-2
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Zweites Beispiel Medikamentenabgabe"
Description: "Zweites Beispiel für eine Medikamentenabgabe mit anderen Eigenschaften"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* insert Date(whenHandedOver)
* medicationReference = Reference(SimpleMedication)

Instance: Example-MedicationDispense-Kombipackung
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Beispiel Kombipackung Medikamentenabgabe"
Description: "Beispiel für eine Medikamentenabgabe einer Kombipackung"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* insert Date(whenHandedOver)
* medicationReference = Reference(Medication-Kombipackung)

Instance: Example-MedicationDispense-Rezeptur
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example Rezeptur Medication Dispense"
Description: "Example of a Rezeptur Medication Dispense."
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* insert Date(whenHandedOver)
* medicationReference = Reference(Medication-Rezeptur)

/*

Instance: INVALID-DATE-Example-MedicationDispense-1
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* insert Date(whenHandedOver)
* contained[+] = SumatripanMedication
* medicationReference = Reference(SumatripanMedication)

Instance: INVALID-DATE-Example-MedicationDispense-2
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* insert Date(whenHandedOver)
* contained[+] = SumatripanMedication
* medicationReference = Reference(SumatripanMedication)

Instance: INVALID-DATE-Example-MedicationDispense-3
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "1-SMC-B-Testkarte-883110000095957"
* insert Date(whenHandedOver)
* contained[+] = SumatripanMedication
* medicationReference = Reference(SumatripanMedication)

Instance: INVALID-DATE-Example-MedicationDispense-4
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* insert Date(whenHandedOver)
* contained[+] = SumatripanMedication
* medicationReference = Reference(SumatripanMedication)

*/