Profile: GEM_ERP_PR_Task
Parent: Task
Id: GEM-ERP-PR-Task
Title: "Task for Management of ePrescription Workflow"
Description: "This resource manages the ePrescription workflow"
* insert Profile(GEM_ERP_PR_Task)
/*
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #closed
* extension contains
    GEM_ERP_EX_PrescriptionType named flowType 1..1 and
    GEM_ERP_EX_AcceptDate named acceptDate 0..1 and
    GEM_ERP_EX_ExpiryDate named expiryDate 0..1



*/
* extension ^slicing.rules = #closed
* extension contains GEM_ERP_EX_PrescriptionType named flowType 1..1
* extension contains GEM_ERP_EX_AcceptDate named acceptDate 0..1
* extension contains GEM_ERP_EX_ExpiryDate named expiryDate 0..1
* extension contains GEM_ERP_EX_LastMedicationDispense named lastMedicationDispense 0..1
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.description = "The task ressource contains three identifier. The first one is the identifier for the ask representing one e-prescription. The other identifier are representing the patient as owner of the prescription. One is the \"Krankenversichertennummer\" which identify each patient by his health insurance company and the other is \"Institutionskennzeichen\"."
* identifier ^slicing.rules = #closed
* identifier contains
    PrescriptionID 1..1 and
    AccessCode 0..1 and
    Secret 0..1
* identifier[PrescriptionID] only GEM_ERP_PR_PrescriptionId
* identifier[PrescriptionID] ^short = "Prescription Identifier"
* identifier[PrescriptionID] ^definition = "The prescription identifier is the main identifier for the task ressource and the whole prescription workflow. This identifier is genereted by the \"E-Rezept Fachdienst\" and should not be changed manually."
* identifier[AccessCode] ^short = "AccessCode Identifier"
* identifier[AccessCode] ^definition = "Generated by the \"E-Rezept Fachdienst\". This identifier is transported in every task request."
* identifier[AccessCode].system 1..
* identifier[AccessCode].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode" (exactly)
* identifier[AccessCode].value 1..
* identifier[Secret] ^short = "Secret"
* identifier[Secret].system 1..
* identifier[Secret].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret" (exactly)
* identifier[Secret].value 1..
* intent = #order (exactly)
* for ^short = "Identifier of Patient (KVID or PKV-Identifier)"
* for.identifier only $identifier-kvid-10 or $identifier-pkv
* performerType.coding from GEM_ERP_VS_OrganizationType (required)
* performerType.coding 1..
* input ..3 MS
* input ^slicing.discriminator.type = #value
* input ^slicing.discriminator.path = "type.coding.code"
* input ^slicing.rules = #closed
* input ^short = "Input Bundle"
* input ^definition = "Reference to ePrescription input and outcome during the process"
* input contains
    ePrescription 0..1 and
    patientReceipt 0..1 and
    MedicationDispense 0..1
* input[ePrescription].type.coding from GEM_ERP_VS_DocumentType (required)
* input[ePrescription].type.coding.system 1..
//* input[ePrescription].type.coding.system = "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_VS_DocumentType" (exactly)
* input[ePrescription].type.coding.code 1..
* input[ePrescription].type.coding.code = #1 (exactly)
* input[ePrescription].value[x] only Reference(GEM_ERP_PR_Binary)
* input[ePrescription].value[x].reference 1..
* input[patientReceipt].type.coding from GEM_ERP_VS_DocumentType (required)
* input[patientReceipt].type.coding.system 1..
//* input[patientReceipt].type.coding.system = "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_VS_DocumentType" (exactly)
* input[patientReceipt].type.coding.code 1..
* input[patientReceipt].type.coding.code = #2 (exactly)
* input[patientReceipt].value[x] only Reference(Bundle)
* input[MedicationDispense].type.coding from GEM_ERP_VS_DocumentType (required)
* input[MedicationDispense].type.coding.system 1..
//* input[MedicationDispense].type.coding.system = "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_VS_DocumentType" (exactly)
* input[MedicationDispense].type.coding.code 1..
* input[MedicationDispense].type.coding.code = #4 (exactly)
* input[MedicationDispense].value[x] only Reference(MedicationDispense)
* output ..1 MS
* output ^slicing.discriminator.type = #value
* output ^slicing.discriminator.path = "type.coding.code"
* output ^slicing.rules = #closed
* output ^short = "Output Bundle"
* output ^definition = "Reference to the Bundle which represent the receipt."
* output contains receipt 0..1
* output[receipt].type.coding from GEM_ERP_VS_DocumentType (required)
* output[receipt].type.coding.system 1..
//* output[receipt].type.coding.system = "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_VS_DocumentType" (exactly)
* output[receipt].type.coding.code 1..
* output[receipt].type.coding.code = #3 (exactly)
* output[receipt].value[x] only Reference(GEM_ERP_PR_Bundle)

Instance: TaskInCreatedState
InstanceOf: GEM_ERP_PR_Task
Title:   "Task just created by Fachdienst via $create operation"
Description:   "Task just created by Fachdienst via $create operation"
Usage: #example
* id = "b12eb5f7-91ce-4887-93c7-800454601377"
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_Task)
* meta.tag.display = "Task in DRAFT state just created by Fachdienst via $create operation"
* extension[flowType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* extension[flowType].valueCoding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType#160 "Muster 16 (Apothekenpflichtige Arzneimittel)"
* extension[acceptDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AcceptDate"
* extension[acceptDate].valueDate = "2022-04-02"
* extension[expiryDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate"
* extension[expiryDate].valueDate = "2022-06-02"
* identifier[PrescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[PrescriptionID].value = "160.000.033.491.280.78"
* identifier[AccessCode].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode"
* identifier[AccessCode].value = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #draft
* intent = #order
* authoredOn = "2022-03-18T15:26:00+00:00"
//* performerType[+].coding = urn:ietf:rfc:3986#urn:oid:1.2.276.0.76.4.54 "Öffentliche Apotheke"
* performerType[+].coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_OrganizationType#urn:oid:1.2.276.0.76.4.54 "Öffentliche Apotheke"

Instance: TaskInReadyState
InstanceOf: GEM_ERP_PR_Task
Title:   "Task activated by (Z)PVS/KIS via $activate operation that carries a dispensable ePrescription"
Usage: #example
* id = "607255ed-ce41-47fc-aad3-cfce1c39963f"
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_Task)
* meta.tag.display = "Task in READY state activated by (Z)PVS/KIS via $activate operation"
* extension[flowType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* extension[flowType].valueCoding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType#160 "Muster 16 (Apothekenpflichtige Arzneimittel)"
* extension[acceptDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AcceptDate"
* extension[acceptDate].valueDate = "2022-04-02"
* extension[expiryDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate"
* extension[expiryDate].valueDate = "2022-06-02"
* identifier[PrescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[PrescriptionID].value = "160.000.033.491.280.78"
* identifier[AccessCode].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode"
* identifier[AccessCode].value = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #ready
* intent = #order
* authoredOn = "2022-03-18T15:26:00+00:00"
* performerType[+].coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_OrganizationType#urn:oid:1.2.276.0.76.4.54 "Öffentliche Apotheke"
* for.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* for.identifier.value = "X123456789"
* lastModified = "2022-03-18T15:27:00+00:00"
* input[ePrescription].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#1 "Health Care Provider Prescription"
* input[ePrescription].valueReference.reference = "281a985c-f25b-4aae-91a6-41ad744080b0"
* input[patientReceipt].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#2 "Patient Confirmation"
* input[patientReceipt].valueReference.reference = "f8c2298f-7c00-4a68-af29-8a2862d55d43"

Instance: TaskInIn-ProgressState
InstanceOf: GEM_ERP_PR_Task
Title:   "Task claimed by pharmacy via $accept operation"
Usage: #example
* id = "d70932d1-9e1c-483c-b2d4-b7dced09b35e"
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_Task)
* meta.tag.display = "Task in IN-PROGRESS state claimed by pharmacy via $accept operation"
* extension[flowType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* extension[flowType].valueCoding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType#160 "Muster 16 (Apothekenpflichtige Arzneimittel)"
* extension[acceptDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AcceptDate"
* extension[acceptDate].valueDate = "2022-04-02"
* extension[expiryDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate"
* extension[expiryDate].valueDate = "2022-06-02"
* identifier[PrescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[PrescriptionID].value = "160.000.033.491.280.78"
* identifier[AccessCode].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode"
* identifier[AccessCode].value = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #in-progress
* intent = #order
* authoredOn = "2022-03-18T15:26:00+00:00"
* performerType[+].coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_OrganizationType#urn:oid:1.2.276.0.76.4.54 "Öffentliche Apotheke"
* for.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* for.identifier.value = "X123456789"
* lastModified = "2022-03-18T15:28:00+00:00"
* input[ePrescription].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#1 "Health Care Provider Prescription"
* input[ePrescription].valueReference.reference = "281a985c-f25b-4aae-91a6-41ad744080b0"
* input[patientReceipt].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#2 "Patient Confirmation"
* input[patientReceipt].valueReference.reference = "f8c2298f-7c00-4a68-af29-8a2862d55d43"

Instance: TaskInIn-ProgressState-Dispensed
InstanceOf: GEM_ERP_PR_Task
Title:   "Task claimed by pharmacy and then dispensed via the $dispense operation"
Usage: #example
* id = "9b48f82c-9c11-4a57-aa72-a805f9537a82"
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_Task)
* meta.tag.display = "Task in IN-PROGRESS state claimed by pharmacy via $accept operation"
* extension[flowType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* extension[flowType].valueCoding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType#160 "Muster 16 (Apothekenpflichtige Arzneimittel)"
* extension[acceptDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AcceptDate"
* extension[acceptDate].valueDate = "2022-04-02"
* extension[expiryDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate"
* extension[expiryDate].valueDate = "2022-06-02"
* extension[lastMedicationDispense].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_LastMedicationDispense"
* extension[lastMedicationDispense].valueInstant = "2022-05-20T13:28:17+02:00"
* identifier[PrescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[PrescriptionID].value = "160.000.033.491.280.78"
* identifier[AccessCode].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode"
* identifier[AccessCode].value = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #in-progress
* intent = #order
* authoredOn = "2022-03-18T15:26:00+00:00"
* performerType[+].coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_OrganizationType#urn:oid:1.2.276.0.76.4.54 "Öffentliche Apotheke"
* for.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* for.identifier.value = "X123456789"
* lastModified = "2022-03-18T15:28:00+00:00"
* input[ePrescription].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#1 "Health Care Provider Prescription"
* input[ePrescription].valueReference.reference = "281a985c-f25b-4aae-91a6-41ad744080b0"
* input[patientReceipt].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#2 "Patient Confirmation"
* input[patientReceipt].valueReference.reference = "f8c2298f-7c00-4a68-af29-8a2862d55d43"
* input[MedicationDispense].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#4 "Medication Dispense"
* input[MedicationDispense].valueReference.reference = "0b9ed877-006f-41ff-81df-813109915c81"

Instance: TaskInClosedState
InstanceOf: GEM_ERP_PR_Task
Title:   "Task finished by pharmacy via $close operation"
Usage: #example
* id = "09330307-16ce-4cdc-810a-ca24ef80dde3"
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_Task)
* meta.tag.display = "Task in COMPLETED state dispensed by pharmacy via $closed operation"
* extension[flowType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* extension[flowType].valueCoding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType#160 "Muster 16 (Apothekenpflichtige Arzneimittel)"
* extension[acceptDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AcceptDate"
* extension[acceptDate].valueDate = "2022-04-02"
* extension[expiryDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate"
* extension[expiryDate].valueDate = "2022-06-02"
* identifier[PrescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[PrescriptionID].value = "160.000.033.491.280.78"
* identifier[AccessCode].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode"
* identifier[AccessCode].value = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #completed
* intent = #order
* authoredOn = "2022-03-18T15:26:00+00:00"
* performerType[+].coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_OrganizationType#urn:oid:1.2.276.0.76.4.54 "Öffentliche Apotheke"
* for.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* for.identifier.value = "X123456789"
* lastModified = "2022-03-18T15:29:00+00:00"
* input[ePrescription].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#1 "Health Care Provider Prescription"
* input[ePrescription].valueReference.reference = "281a985c-f25b-4aae-91a6-41ad744080b0"
* input[patientReceipt].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#2 "Patient Confirmation"
* input[patientReceipt].valueReference.reference = "f8c2298f-7c00-4a68-af29-8a2862d55d43"
* output[receipt].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#3 "Receipt"
* output[receipt].valueReference.reference = "dffbfd6a-5712-4798-bdc8-07201eb77ab8"
