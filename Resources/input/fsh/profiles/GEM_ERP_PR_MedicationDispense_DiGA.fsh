Profile: GEM_ERP_PR_MedicationDispense_DiGA
Parent: MedicationDispense //TODO: Erben von E-PA MedicationDispense
Id: GEM-ERP-PR-MedicationDispense-DiGA
Title: "Dispensation of a DiGA-Prescription"
Description: "Handles information about the dispensed DiGA"
* insert Profile(GEM_ERP_PR_MedicationDispense_DiGA)

* identifier 1..1
* identifier only GEM_ERP_PR_PrescriptionId
* identifier ^short = "ePrescription identifier"
* status = #completed (exactly)
* status ^short = "completed"

* medication[x] MS
* medication[x] only CodeableConcept
* medication[x] ^short = "Information concerning the dispensed medication"
* medication[x] ^definition = "This profile supports two ways of medication information. The first way is to use the medicationReference element to reference a medication resource which is issued . The second way is to use the medicationCodeableConcept element to provide the medication information directly."

// medicationCodeableConcept für die Angabe von DiGAs
* medicationCodeableConcept MS
* medicationCodeableConcept.coding 1..1
* medicationCodeableConcept.coding ^slicing.discriminator.type = #pattern
* medicationCodeableConcept.coding ^slicing.discriminator.path = "$this"
* medicationCodeableConcept.coding ^slicing.rules = #closed
* medicationCodeableConcept.coding contains pznCode 1..1
* medicationCodeableConcept.coding[pznCode] ^short = "ID of the product (PZN)"
* medicationCodeableConcept.coding[pznCode] ^definition = "Pharmaceutical Central Number (PZN), which is used by the Information Office for Pharmaceutical Specialties (IFA) in relation to products and is agreed upon with the pharmaceutical industry according to § 131 SGB V and with the German Pharmacists' Association according to § 300 for statutory health insurance funds. The information such as trade name, dosage form, package size, etc. is derived from the price and product information according to § 131 Abs. 4 SGB V."
* medicationCodeableConcept.coding[pznCode].system = $PZN
* medicationCodeableConcept.coding[pznCode].code 1..1
* medicationCodeableConcept.text 1..1
* medicationCodeableConcept.text ^short = "Trade name"
* medicationCodeableConcept.text ^definition = "Trade name of the prescribed DiGA, derived from the PZN"

// supportingInformation für die Angabe des Freischaltcodes
* supportingInformation ^slicing.discriminator.type = #value
* supportingInformation ^slicing.discriminator.path = identifier.value
* supportingInformation ^slicing.rules = #open
* supportingInformation ^slicing.ordered = false
* supportingInformation ^slicing.description = "Additional Information for using the product"
* supportingInformation contains 
    redeemCode 1..1
    and deepLink 0..1

* supportingInformation[redeemCode].identifier.value = "redeemCode" (exactly)
* supportingInformation[redeemCode].display 1..1
* supportingInformation[redeemCode].display ^short = "Redeem Code"

* supportingInformation[deepLink].identifier.value = "deepLink" (exactly)
* supportingInformation[deepLink].display 1..1
* supportingInformation[deepLink].display ^short = "Deep Link"

* subject 1..
* subject.identifier 1..
* subject.identifier only $identifier-kvid-10 // Hier nur die KVNR der GKV, da für PKV kein DiGA angedacht ist
* subject.identifier ^short = "The patients KVNR"
* subject.identifier ^comment = "There is no PKV identifier available since it is not in the scope for DiGA prescriptions."
* performer 1..1
* performer.actor.identifier 1..
* performer.actor.identifier only IdentifierTelematikId
* whenPrepared ^mustSupport = false
* whenHandedOver 1..
* whenHandedOver obeys workflow-abgabeDatumsFormat
* dosageInstruction MS


Instance: Example-MedicationDispense-DiGA
InstanceOf: GEM_ERP_PR_MedicationDispense_DiGA
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier.value = "162.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "8-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* medicationCodeableConcept.coding[pznCode].system = $PZN
* medicationCodeableConcept.coding[pznCode].code = #17946626
* medicationCodeableConcept.text = "glucura Diabetestherapie"
* supportingInformation[redeemCode].display = "DE12345678901234"
* supportingInformation[redeemCode].identifier.value = "redeemCode"

Instance: Example-MedicationDispense-DiGA-DeepLink
InstanceOf: GEM_ERP_PR_MedicationDispense_DiGA
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier.value = "162.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "8-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* medicationCodeableConcept.coding[pznCode].system = $PZN
* medicationCodeableConcept.coding[pznCode].code = #17946626
* medicationCodeableConcept.text = "diabetico Diabetestherapie"
* supportingInformation[redeemCode].display = "DE12345678901234"
* supportingInformation[redeemCode].identifier.value = "redeemCode"
* supportingInformation[deepLink].display = "https://www.diabetico.app?redeemCode=DE12345678901234"
* supportingInformation[deepLink].identifier.value = "deepLink"