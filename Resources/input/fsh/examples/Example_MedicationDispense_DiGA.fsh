
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
* medicationReference.identifier.system = "https://fhir.bfarm.de/Identifier/DigaVeId"
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
* medicationReference.identifier.system = "https://fhir.bfarm.de/Identifier/DigaVeId"
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

/*
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
* medicationReference.identifier.system = "https://fhir.bfarm.de/Identifier/DigaVeId"
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

*/