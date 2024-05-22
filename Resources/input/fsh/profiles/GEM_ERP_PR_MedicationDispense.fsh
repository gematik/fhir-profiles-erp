Profile: GEM_ERP_PR_MedicationDispense
Parent: MedicationDispense
Id: GEM-ERP-PR-MedicationDispense
Title: "Dispensation of the Prescription"
Description: "Handles information about the redeem of the prescription and the submited medication."
* insert Profile(GEM_ERP_PR_MedicationDispense)

* identifier 1..1
* identifier only GEM_ERP_PR_PrescriptionId
* identifier ^short = "ePrescription identifier"
* status = #completed (exactly)
* status ^short = "completed"

* medication[x] MS
//TODO: Beschreibungen für die Entwickler einfügen
* medication[x] ^definition = "The MedicationDispense shows a contained medication based on the four KBV Medication-Profiles (KBV_PR_ERP_Medication_Compounding, KBV_PR_ERP_Medication_FreeText, KBV_PR_ERP_Medication_Ingredient, KBV_PR_ERP_Medication_PZN)."

// medicationReference für die Angabe von Arzneimitteln
* medicationReference ^type.aggregation = #contained

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
* subject.identifier only $identifier-kvid-10 or $identifier-pkv
* subject.identifier ^short = "The patients KVNR"
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

Invariant: workflow-dispense-medicationInformation
Description: "Wenn eine Dispense zu einer DiGA erfolgt müssen die Angaben zur DiGA in medicationCodeableConcept angegeben werden. Andernfalls muss medicationReference angegeben werden."
* severity = #error
* expression = "(iif(identifier.value.startsWith('162'), medicationCodeableConcept.exists() and medicationReference.empty(), medicationReference.exists() and medicationCodeableConcept.empty()))"

Invariant: workflow-dispense-redeemCode
Description: "Wenn eine Dispense zu einer DiGA erfolgt muss der Freischaltcode angegeben werden."
* severity = #error
* expression = "(iif(identifier.value.startsWith('162'), supportingInformation.where(sliceName = 'redeemCode').exists(), true))"

Instance: Example-MedicationDispense
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier.value = "160.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "1-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03"
* whenPrepared = "2024-04-03"
* contained[+] = SumatripanMedication
* medicationReference.reference = "#001413e4-a5e9-48da-9b07-c17bab476407"

/*

Instance: INVALID-DATE-Example-MedicationDispense-1
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example-Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier.value = "160.000.033.491.280.78"
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
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier.value = "160.000.033.491.280.78"
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
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier.value = "160.000.033.491.280.78"
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
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier.value = "160.000.033.491.280.78"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "1-SMC-B-Testkarte-883110000095957"
* whenHandedOver = "2024-04-03T00:00:00.000Z"
* whenPrepared = "2024-04-03T00:00:00.000Z"
* contained[+] = SumatripanMedication
* medicationReference.reference = "#001413e4-a5e9-48da-9b07-c17bab476407"

*/