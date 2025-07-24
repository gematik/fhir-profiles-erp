Profile: GEM_ERP_PR_Task
Parent: Task
Id: GEM-ERP-PR-Task
Title: "Task für die Verwaltung des E-Rezept-Workflows"
Description: "Diese Ressource verwaltet den E-Rezept-Workflow"
* insert Profile(GEM_ERP_PR_Task)

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.description = "Erweiterungen für die Aufgabe, die durch url unterschieden werden."
* extension ^slicing.rules = #closed
* extension ^slicing.ordered = false

* extension contains GEM_ERP_EX_PrescriptionType named flowType 1..1 MS
and GEM_ERP_EX_AcceptDate named acceptDate 0..1 MS
and GEM_ERP_EX_ExpiryDate named expiryDate 0..1 MS
and GEM_ERP_EX_LastMedicationDispense named lastMedicationDispense 0..1
and GEM_ERP_EX_EU_IS_REDEEMABLE_BY_PROPERTIES named eu-isRedeemableByProperties 0..1 MS
and GEM_ERP_EX_EU_IS_REDEEMABLE_BY_PATIENT_AUTHORIZATION named eu-isRedeemableByPatientAuthorization 0..1 MS

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.description = "Die Task-Ressource enthält zwei Kennungen. Die erste ist die Kennung für den Task, die ein E-Rezept darstellt. Die andere Kennung repräsentiert den Patienten als Eigentümer des E-Rezepts via Krankenversichertennummer (KVNR)"
* identifier ^slicing.rules = #closed
* identifier contains
    PrescriptionID 1..1 and
    AccessCode 0..1 and
    Secret 0..1
* identifier[PrescriptionID] only EPrescriptionId
  * ^short = "E-Rezept-ID"
  * ^definition = "Die E-Rezept-ID ist der Hauptidentifikator für die Task Ressource und den gesamten E-Rezept Workflow. Dieser Identifikator wird vom E-Rezept Fachdienst generiert und darf nicht manuell geändert werden."
* identifier[AccessCode] 
  * ^short = "AccessCode Identifier"
  * ^definition = "Generiert vom E-Rezept Fachdienst. Dieser Identifikator muss in jeder Anfrage zur Task Ressource übertragen werden."
  * system 1..
  * system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode" (exactly)
  * value 1..
* identifier[Secret] 
  * ^short = "Secret"
  * system 1..
  * system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret" (exactly)
  * value 1..
* intent = #order (exactly)
* for ^short = "Kennung des Patienten (KVID or PKV-Identifier)"
* for.identifier only IdentifierKvid10
* performerType.coding from GEM_ERP_VS_OrganizationType (required)
* performerType.coding 1..

* input MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "type.coding.code"
  * ^slicing.rules = #closed
  * ^short = "Input Bundle"
  * ^definition = "Referenz auf Eingabe und Ergebnis des E-Rezeptes während des Prozesses"
* input contains ePrescription 0..1 and patientReceipt 0..1

// QES Binary ePrescription
* input[ePrescription] 0..1 MS
  * ^short = "QES-Binary des E-Rezept"
  * value[x] only Reference(GEM_ERP_PR_Binary)
  * type.coding 1..1
  * type.coding from GEM_ERP_VS_DocumentType (required)
    * system 1..1
    * code 1..1
    * code = #1 (exactly)

// ePriscription for the patient
* input[patientReceipt] 0..1 MS
  * ^short = "JSON-Bundle des E-Rezepts, das vom E-Rezept-FdV konsumiert werden soll"
  * value[x] only Reference(Bundle)
    * ^comment = "Dies ist ein Bundle eines Rezepts, z.B. KBV_PR_ERP_Bundle oder KBV_PR_EVDGA_Bundle"
  * type.coding 1..1
  * type.coding from GEM_ERP_VS_DocumentType (required)
    * system 1..1
    * code 1..1
    * code = #2 (exactly)

* output MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "type.coding.code"
  * ^slicing.rules = #closed
  * ^short = "Output Bundle"
  * ^definition = "Referenz auf das Bundle, das die Quittung darstellt."
* output contains receipt 0..1

// Receipt
* output[receipt] 0..1 MS
  * value[x] only Reference(GEM_ERP_PR_Bundle)
  * type.coding 1..1
  * type.coding from GEM_ERP_VS_DocumentType (required)
    * system 1..1
    * code 1..1
    * code = #3 (exactly)
