Instance: 521331b4-1fa2-11ec-9621-0242ac130002
InstanceOf: MedicationDispense
Usage: #example
* meta.profile = "https://gematik.de/fhir/StructureDefinition/ErxMedicationDispense|1.1.0"
* meta.tag.display = "Beispiel Abgabeinformationen für das dispensierte E-Rezept zur Anzeige in der E-Rezept-App"
* contained = Inline-Instance-for-521331b4-1fa2-11ec-9621-0242ac130002-1
* identifier.system = "https://gematik.de/fhir/NamingSystem/PrescriptionID"
* identifier.value = "160.000.033.491.280.78"
* status = #completed
* medicationReference = Reference(0c2befb0-7381-4b5e-8bb4-37019902fead) "Sumatriptan-1a Pharma 100 mg Tabletten"
* subject.identifier.system = "http://fhir.de/NamingSystem/gkv/kvid-10"
* subject.identifier.value = "X234567890"
* performer.actor.identifier.system = "https://gematik.de/fhir/NamingSystem/TelematikID"
* performer.actor.identifier.value = "3-abc-1234567890"
* whenHandedOver = "2020-03-20"
* dosageInstruction.text = "1-0-1-0"