Profile: GEM_ERP_PR_MedicationDispense_DiGA
Parent: MedicationDispense
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
* medicationCodeableConcept.coding ..1 MS
* medicationCodeableConcept.coding ^slicing.discriminator.type = #pattern
* medicationCodeableConcept.coding ^slicing.discriminator.path = "$this"
* medicationCodeableConcept.coding ^slicing.rules = #closed
* medicationCodeableConcept.coding contains pznCode 1..1
* medicationCodeableConcept.coding[pznCode] ^short = "ID des Produktes (PZN)"
* medicationCodeableConcept.coding[pznCode] ^definition = "Pharmazentralnummer (PZN), die von der Informationsstelle für Arzneispezialitäten (IFA) produktbezogen verwendet wird und für die gesetzlichen Krankenkassen gemäß Vereinbarung nach § 131 SGB V mit der pharmazeutischen Industrie und nach § 300 dem Deutschen Apothekerverband vereinbart ist.\r\nDie Angaben Handelsname, Darreichungsform, Packungsgröße usw. entstammen dem Preis- und Produktangaben nach §131 Abs. 4 SGB V."
* medicationCodeableConcept.coding[pznCode].system MS
* medicationCodeableConcept.coding[pznCode].system = $PZN
* medicationCodeableConcept.coding[pznCode].code MS
* medicationCodeableConcept.text 1..1 MS
* medicationCodeableConcept.text ^short = "Handelsname"
* medicationCodeableConcept.text ^definition = "Handelsname der verordneten DiGA, aus der PZN abgeleitet"

* subject 1..
* subject.identifier 1..
* subject.identifier only $identifier-kvid-10
* subject.identifier ^short = "The patients KVNR"
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
* whenPrepared = "2024-04-03"
* medicationCodeableConcept.coding[pznCode].system = $PZN
* medicationCodeableConcept.coding[pznCode].code = #17946626
* medicationCodeableConcept.text = "glucura Diabetestherapie"
