Profile: GEM_ERP_PR_MedicationDispense_DiGA
Parent: $ePAMedicationDispense
Id: GEM-ERP-PR-MedicationDispense-DiGA
Title: "Dispensation of a DiGA-Prescription"
Description: "Handles information about the dispensed DiGA"
* insert Profile(GEM_ERP_PR_MedicationDispense_DiGA)

* extension 1..*
* extension contains 
    GEM_ERP_EX_RedeemCode named redeemCode 1..1
    and GEM_ERP_EX_DeepLinks named deepLinks 0..*

* identifier contains prescriptionID 1..1
* identifier[prescriptionID] only GEM_ERP_PR_PrescriptionId
* identifier ^short = "ePrescription identifier"

* status = #completed (exactly)
* status ^short = "completed"

* medication[x] only Reference(GEM_ERP_PR_Medication)
* medication[x] MS
* medication[x] ^definition = "The MedicationDispense shows a contained medication which was dispensed. The medication should state the pzn of the DiGA."
* medication[x] ^type.aggregation = #contained

* subject 1..
* subject.identifier 1..
* subject.identifier only $identifier-kvid-10 // Hier nur die KVNR der GKV, da für PKV kein DiGA angedacht ist
* subject.identifier ^short = "The patients KVNR"
* subject.identifier ^comment = "There is no PKV identifier available since it is not in the scope for DiGA prescriptions."
* performer 1..1
* performer.actor.identifier 1..
* performer.actor.identifier only IdentifierTelematikId
* whenHandedOver 1..1
* whenHandedOver ^short = "Date of dispensation"
* whenHandedOver obeys workflow-abgabeDatumsFormat
* dosageInstruction MS

Instance: Example-MedicationDispense-DiGA-Name
InstanceOf: GEM_ERP_PR_MedicationDispense_DiGA
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* extension[redeemCode].valueString = "DE12345678901234"
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier.value = "162.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "8-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* medicationReference.display = "Gematico Diabetestherapie"

Instance: Example-MedicationDispense-DiGA-Name-And-PZN
InstanceOf: GEM_ERP_PR_MedicationDispense_DiGA
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* extension[redeemCode].valueString = "DE12345678901234"
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier.value = "162.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "8-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* medicationReference.display = "Gematico Diabetestherapie"
* medicationReference.identifier.system = $PZN
* medicationReference.identifier.value = "12345678"



Instance: Example-DiGA-Medication
InstanceOf: GEM_ERP_PR_Medication
Usage: #example
Title: "Example-Medication for DiGA Diapense"
Description: "Example of a Medication for DiGA Dispense."
* code.coding[pzn].code = #17946626
* code.text = "gematico Diabetestherapie"

Instance: Example-MedicationDispense-DiGA-Medication-Object
InstanceOf: GEM_ERP_PR_MedicationDispense_DiGA
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* extension[redeemCode].valueString = "DE12345678901234"
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier.value = "162.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "8-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* contained[+] = Example-DiGA-Medication
* medicationReference.reference = "#Example-DiGA-Medication"



Instance: Example-MedicationDispense-DiGA-DeepLink
InstanceOf: GEM_ERP_PR_MedicationDispense_DiGA
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* extension[redeemCode].valueString = "DE12345678901234"
* extension[deepLinks].extension[apple].valueUrl = "https://apple.gematico.de?redeemCode=DE12345678901234"
* extension[deepLinks].extension[android].valueUrl = "https://google-play.gematico.de?redeemCode=DE12345678901234"
* extension[deepLinks].extension[web].valueUrl = "https://www.gematico.de?redeemCode=DE12345678901234"
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier.value = "162.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "8-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* medicationReference.display = "Gematico Diabetestherapie"