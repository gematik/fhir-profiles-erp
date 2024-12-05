
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
* insert Date(extension[acceptDate].valueDate)
* extension[expiryDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate"
* extension[expiryDate].valueDate = "2022-06-02"
* identifier[PrescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[PrescriptionID].value = "160.000.033.491.280.78"
* identifier[AccessCode].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode"
* identifier[AccessCode].value = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #draft
* intent = #order
* authoredOn = "2022-03-18T15:26:00+00:00"
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
* for.identifier.system = $identifier-kvid-10
* for.identifier.value = "X123456789"
* lastModified = "2022-03-18T15:27:00+00:00"
* input[ePrescription].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#1 "Health Care Provider Prescription"
* input[ePrescription].valueReference.reference = "281a985c-f25b-4aae-91a6-41ad744080b0"
* input[patientReceipt].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#2 "Patient Confirmation"
* input[patientReceipt].valueReference.reference = "f8c2298f-7c00-4a68-af29-8a2862d55d43"

Instance: TaskIn-ProgressState
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
* for.identifier.system = $identifier-kvid-10
* for.identifier.value = "X123456789"
* lastModified = "2022-03-18T15:28:00+00:00"
* input[ePrescription].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#1 "Health Care Provider Prescription"
* input[ePrescription].valueReference = Reference(PrescriptionBinary)

Instance: TaskIn-ProgressState-Dispensed
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
* for.identifier.system = $identifier-kvid-10
* for.identifier.value = "X123456789"
* lastModified = "2022-03-18T15:28:00+00:00"
* input[ePrescription].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#1 "Health Care Provider Prescription"
* input[ePrescription].valueReference.reference = "281a985c-f25b-4aae-91a6-41ad744080b0"
* input[patientReceipt].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#2 "Patient Confirmation"
* input[patientReceipt].valueReference.reference = "f8c2298f-7c00-4a68-af29-8a2862d55d43"

Instance: TaskIn-ProgressState-Dispensed-Multiple-MedicationDispenses
InstanceOf: GEM_ERP_PR_Task
Title:   "Task claimed by pharmacy and then dispensed via the $dispense operation"
Usage: #example
* id = "f5c21409-b84b-4125-8649-5630a00906b1"
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
* for.identifier.system = $identifier-kvid-10
* for.identifier.value = "X123456789"
* lastModified = "2022-03-18T15:28:00+00:00"
* input[ePrescription].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#1 "Health Care Provider Prescription"
* input[ePrescription].valueReference.reference = "281a985c-f25b-4aae-91a6-41ad744080b0"
* input[patientReceipt].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#2 "Patient Confirmation"
* input[patientReceipt].valueReference.reference = "f8c2298f-7c00-4a68-af29-8a2862d55d43"

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
* for.identifier.system = $identifier-kvid-10
* for.identifier.value = "X123456789"
* lastModified = "2022-03-18T15:29:00+00:00"
* input[ePrescription].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#1 "Health Care Provider Prescription"
* input[ePrescription].valueReference.reference = "281a985c-f25b-4aae-91a6-41ad744080b0"
* input[patientReceipt].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#2 "Patient Confirmation"
* input[patientReceipt].valueReference.reference = "f8c2298f-7c00-4a68-af29-8a2862d55d43"
* output[receipt].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#3 "Receipt"
* output[receipt].valueReference.reference = "dffbfd6a-5712-4798-bdc8-07201eb77ab8"
