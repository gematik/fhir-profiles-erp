Instance: Example-MedicationDispense-Dosage-tageszeit
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Beispiel Medikamentenabgabe mit Dosierung nach 4er Schema"
Description: "Beispiel für eine Medikamentenabgabe mit vollständigen Angaben und Dosierung nach 4er Schema"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* insert Date(whenHandedOver)
* medicationReference = Reference(SumatripanMedication)
* extension[renderedDosageInstruction].valueMarkdown = "1-0-2-0 Stück"
* extension[generatedDosageInstructionsMeta]
  * url = $generatedMeta
  * extension[+].url = "algorithmVersion"
  * extension[=].valueString = "1.0.0"
  * extension[+].url = "language"
  * extension[=].valueCode = #de-DE
* dosageInstruction[+]
  * timing.repeat
    * when[+] = #EVE
    * frequency = 1
    * period = 1
    * periodUnit = #d
  * doseAndRate.doseQuantity = 2 $kbv-dosiereinheit#1 "Stück"
* dosageInstruction[+]
  * timing.repeat
    * when[+] = #MORN
    * frequency = 1
    * period = 1
    * periodUnit = #d
  * doseAndRate.doseQuantity = 1 $kbv-dosiereinheit#1 "Stück"

Instance: Example-MedicationDispense-Dosage-uhrzeit
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Beispiel Medikamentenabgabe mit Dosierung nach Uhrzeitbezug"
Description: "Beispiel für eine Medikamentenabgabe mit vollständigen Angaben und Dosierung nach Uhrzeitbezug"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* insert Date(whenHandedOver)
* medicationReference = Reference(SumatripanMedication)
* extension[renderedDosageInstruction].valueMarkdown = "täglich: 08:00 Uhr — je 1 Stück"
* extension[generatedDosageInstructionsMeta]
  * url = $generatedMeta
  * extension[+].url = "algorithmVersion"
  * extension[=].valueString = "1.0.0"
  * extension[+].url = "language"
  * extension[=].valueCode = #de-DE
* dosageInstruction[+]
  * timing.repeat
    * timeOfDay[+] = "08:00:00"
    * frequency = 1
    * period = 1
    * periodUnit = #d
  * doseAndRate.doseQuantity = 1 $kbv-dosiereinheit#1 "Stück"

Instance: Example-MedicationDispense-Dosage-interval
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Beispiel Medikamentenabgabe mit Dosierung nach Interval"
Description: "Beispiel für eine Medikamentenabgabe mit vollständigen Angaben und Dosierung nach Interval"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* insert Date(whenHandedOver)
* medicationReference = Reference(SumatripanMedication)
* extension[renderedDosageInstruction].valueMarkdown = "alle 8 Tage: je 1 Stück"
* extension[generatedDosageInstructionsMeta]
  * url = $generatedMeta
  * extension[+].url = "algorithmVersion"
  * extension[=].valueString = "1.0.0"
  * extension[+].url = "language"
  * extension[=].valueCode = #de-DE
* dosageInstruction[+]
  * timing.repeat.frequency = 1
  * timing.repeat.period = 8
  * timing.repeat.periodUnit = #d
  * doseAndRate.doseQuantity = 1 $kbv-dosiereinheit#1 "Stück"

Instance: Example-MedicationDispense-Dosage-weekday
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Beispiel Medikamentenabgabe mit Dosierung nach Wochentagsbezug"
Description: "Beispiel für eine Medikamentenabgabe mit vollständigen Angaben und Dosierung nach Wochentagsbezug"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* insert Date(whenHandedOver)
* medicationReference = Reference(SumatripanMedication)
* extension[renderedDosageInstruction].valueMarkdown = "dienstags — je 2 Stück, donnerstags — je 2 Stück"
* extension[generatedDosageInstructionsMeta]
  * url = $generatedMeta
  * extension[+].url = "algorithmVersion"
  * extension[=].valueString = "1.0.0"
  * extension[+].url = "language"
  * extension[=].valueCode = #de-DE
* dosageInstruction[+]
  * timing.repeat
    * dayOfWeek[+] = #tue
    * dayOfWeek[+] = #thu
    * frequency = 2
    * period = 1
    * periodUnit = #wk
  * doseAndRate.doseQuantity = 2 $kbv-dosiereinheit#1 "Stück"

Instance: Example-MedicationDispense-Dosage-comb-interval
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Beispiel Medikamentenabgabe mit Dosierung nach Kombination des Intervals"
Description: "Beispiel für eine Medikamentenabgabe mit vollständigen Angaben und Dosierung nach Kombination des Intervals"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* insert Date(whenHandedOver)
* medicationReference = Reference(SumatripanMedication)
* extension[renderedDosageInstruction].valueMarkdown = "alle 2 Tage: 08:00 Uhr — je 1 Stück; 18:00 Uhr — je 2 Stück"
* extension[generatedDosageInstructionsMeta]
  * url = $generatedMeta
  * extension[+].url = "algorithmVersion"
  * extension[=].valueString = "1.0.0"
  * extension[+].url = "language"
  * extension[=].valueCode = #de-DE
* dosageInstruction[+]
  * timing.repeat
    * frequency = 1
    * period = 2
    * periodUnit = #d
    * timeOfDay[+] = "08:00:00"
  * doseAndRate.doseQuantity = 1 $kbv-dosiereinheit#1 "Stück"
* dosageInstruction[+]
  * timing.repeat
    * frequency = 1
    * period = 2
    * periodUnit = #d
    * timeOfDay[+] = "18:00:00"
  * doseAndRate.doseQuantity = 2 $kbv-dosiereinheit#1 "Stück"

Instance: Example-MedicationDispense-Dosage-comb-dayofweek
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Beispiel Medikamentenabgabe mit Dosierung nach Kombination des Wochentags"
Description: "Beispiel für eine Medikamentenabgabe mit vollständigen Angaben und Dosierung nach Kombination des Wochentags"
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* insert Date(whenHandedOver)
* medicationReference = Reference(SumatripanMedication)
* extension[renderedDosageInstruction].valueMarkdown = "montags 1-0-1-0, freitags 1-0-1-0 Stück"
* extension[generatedDosageInstructionsMeta]
  * url = $generatedMeta
  * extension[+].url = "algorithmVersion"
  * extension[=].valueString = "1.0.0"
  * extension[+].url = "language"
  * extension[=].valueCode = #de-DE
* dosageInstruction[+]
  * timing.repeat
    * dayOfWeek[+] = #mon
    * dayOfWeek[+] = #fri
    * when[+] = #MORN
    * when[+] = #EVE
    * frequency = 4
    * period = 1
    * periodUnit = #wk
  * doseAndRate.doseQuantity = 1 $kbv-dosiereinheit#1 "Stück"


