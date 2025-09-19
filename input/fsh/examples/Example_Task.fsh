
Instance: TaskInCreatedState
InstanceOf: GEM_ERP_PR_Task
Title: "Task erstellt durch Fachdienst via $create Operation"
Description: "Beispiel für einen Task, der vom Fachdienst über die $create Operation erstellt wurde"
Usage: #example
* id = "b12eb5f7-91ce-4887-93c7-800454601377"
* meta.tag.display = "Task in DRAFT state just created by Fachdienst via $create operation"
* extension[flowType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* extension[flowType].valueCoding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType#160 "Flowtype für Apothekenpflichtige Arzneimittel"
* extension[acceptDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AcceptDate"
* insert Date(extension[acceptDate].valueDate)
* extension[expiryDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate"
* insert Date(extension[expiryDate].valueDate)
* identifier[PrescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[PrescriptionID].value = "160.000.033.491.280.78"
* identifier[AccessCode].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode"
* identifier[AccessCode].value = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #draft
* intent = #order
* insert DateTime(authoredOn)
* performerType[+].coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_OrganizationType#urn:oid:1.2.276.0.76.4.54 "Öffentliche Apotheke"

Instance: TaskInReadyState
InstanceOf: GEM_ERP_PR_Task
Title: "Task aktiviert durch (Z)PVS/KIS via $activate Operation"
Description: "Beispiel für einen Task, der durch (Z)PVS/KIS über die $activate Operation aktiviert wurde und ein einlösbares E-Rezept trägt"
Usage: #example
* id = "607255ed-ce41-47fc-aad3-cfce1c39963f"
* meta.tag.display = "Task in READY state activated by (Z)PVS/KIS via $activate operation"
* extension[flowType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* extension[flowType].valueCoding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType#160 "Flowtype für Apothekenpflichtige Arzneimittel"
* extension[acceptDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AcceptDate"
* insert Date(extension[acceptDate].valueDate)
* extension[expiryDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate"
* insert Date(extension[expiryDate].valueDate)
* identifier[PrescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[PrescriptionID].value = "160.000.033.491.280.78"
* identifier[AccessCode].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode"
* identifier[AccessCode].value = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #ready
* intent = #order
* insert DateTime(authoredOn)
* performerType[+].coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_OrganizationType#urn:oid:1.2.276.0.76.4.54 "Öffentliche Apotheke"
* for.identifier.system = $identifier-kvid-10
* for.identifier.value = "X123456789"
* insert DateTimeStampPlus1Hr(lastModified)
* input[ePrescription].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#1 "Health Care Provider Prescription"
* input[ePrescription].valueReference.reference = "281a985c-f25b-4aae-91a6-41ad744080b0"
* input[patientReceipt].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#2 "Patient Confirmation"
* input[patientReceipt].valueReference.reference = "f8c2298f-7c00-4a68-af29-8a2862d55d43"

Instance: TaskIn-ProgressState
InstanceOf: GEM_ERP_PR_Task
Title: "Task angenommen durch Apotheke via $accept Operation"
Description: "Beispiel für einen Task, der von einer Apotheke über die $accept Operation angenommen wurde"
Usage: #example
* id = "d70932d1-9e1c-483c-b2d4-b7dced09b35e"
* meta.tag.display = "Task in IN-PROGRESS state claimed by pharmacy via $accept operation"
* extension[flowType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* extension[flowType].valueCoding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType#160 "Flowtype für Apothekenpflichtige Arzneimittel"
* extension[acceptDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AcceptDate"
* insert Date(extension[acceptDate].valueDate)
* extension[expiryDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate"
* insert Date(extension[expiryDate].valueDate)
* identifier[PrescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[PrescriptionID].value = "160.000.033.491.280.78"
* identifier[AccessCode].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode"
* identifier[AccessCode].value = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #in-progress
* intent = #order
* insert DateTime(authoredOn)
* performerType[+].coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_OrganizationType#urn:oid:1.2.276.0.76.4.54 "Öffentliche Apotheke"
* for.identifier.system = $identifier-kvid-10
* for.identifier.value = "X123456789"
* insert DateTimeStampPlus1Hr(lastModified)
* input[ePrescription].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#1 "Health Care Provider Prescription"
* input[ePrescription].valueReference = Reference(PrescriptionBinary)

Instance: TaskIn-ProgressState-Dispensed
InstanceOf: GEM_ERP_PR_Task
Title: "Task angenommen und abgegeben via $dispense Operation"
Description: "Beispiel für einen Task, der von einer Apotheke angenommen und dann über die $dispense Operation abgegeben wurde"
Usage: #example
* id = "9b48f82c-9c11-4a57-aa72-a805f9537a82"
* meta.tag.display = "Task in IN-PROGRESS state claimed by pharmacy via $accept operation"
* extension[flowType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* extension[flowType].valueCoding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType#160 "Flowtype für Apothekenpflichtige Arzneimittel"
* extension[acceptDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AcceptDate"
* insert Date(extension[acceptDate].valueDate)
* extension[expiryDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate"
* insert Date(extension[expiryDate].valueDate)
* extension[lastMedicationDispense].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_LastMedicationDispense"
* insert DateTimeStampPlus1Hr(extension[lastMedicationDispense].valueInstant)
* identifier[PrescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[PrescriptionID].value = "160.000.033.491.280.78"
* identifier[AccessCode].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode"
* identifier[AccessCode].value = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #in-progress
* intent = #order
* insert DateTime(authoredOn)
* performerType[+].coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_OrganizationType#urn:oid:1.2.276.0.76.4.54 "Öffentliche Apotheke"
* for.identifier.system = $identifier-kvid-10
* for.identifier.value = "X123456789"
* insert DateTimeStampPlus1Hr(lastModified)
* input[ePrescription].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#1 "Health Care Provider Prescription"
* input[ePrescription].valueReference.reference = "281a985c-f25b-4aae-91a6-41ad744080b0"
* input[patientReceipt].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#2 "Patient Confirmation"
* input[patientReceipt].valueReference.reference = "f8c2298f-7c00-4a68-af29-8a2862d55d43"

Instance: TaskIn-ProgressState-Dispensed-Multiple-MedicationDispenses
InstanceOf: GEM_ERP_PR_Task
Title: "Task mit mehreren MedicationDispenses"
Description: "Beispiel für einen Task, der von einer Apotheke angenommen und dann über die $dispense Operation mit mehreren MedicationDispenses abgegeben wurde"
Usage: #example
* id = "f5c21409-b84b-4125-8649-5630a00906b1"
* meta.tag.display = "Task in IN-PROGRESS state claimed by pharmacy via $accept operation"
* extension[flowType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* extension[flowType].valueCoding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType#160 "Flowtype für Apothekenpflichtige Arzneimittel"
* extension[acceptDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AcceptDate"
* insert Date(extension[acceptDate].valueDate)
* extension[expiryDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate"
* insert Date(extension[expiryDate].valueDate)
* extension[lastMedicationDispense].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_LastMedicationDispense"
* insert DateTimeStampPlus1Hr(extension[lastMedicationDispense].valueInstant)
* identifier[PrescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[PrescriptionID].value = "160.000.033.491.280.78"
* identifier[AccessCode].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode"
* identifier[AccessCode].value = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #in-progress
* intent = #order
* insert DateTime(authoredOn)
* performerType[+].coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_OrganizationType#urn:oid:1.2.276.0.76.4.54 "Öffentliche Apotheke"
* for.identifier.system = $identifier-kvid-10
* for.identifier.value = "X123456789"
* insert DateTimeStampPlus1Hr(lastModified)
* input[ePrescription].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#1 "Health Care Provider Prescription"
* input[ePrescription].valueReference.reference = "281a985c-f25b-4aae-91a6-41ad744080b0"
* input[patientReceipt].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#2 "Patient Confirmation"
* input[patientReceipt].valueReference.reference = "f8c2298f-7c00-4a68-af29-8a2862d55d43"

Instance: TaskInClosedState
InstanceOf: GEM_ERP_PR_Task
Title: "Task abgeschlossen durch Apotheke via $close Operation"
Description: "Beispiel für einen Task, der von einer Apotheke über die $close Operation abgeschlossen wurde"
Usage: #example
* id = "09330307-16ce-4cdc-810a-ca24ef80dde3"
* meta.tag.display = "Task in COMPLETED state dispensed by pharmacy via $closed operation"
* extension[flowType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* extension[flowType].valueCoding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType#160 "Flowtype für Apothekenpflichtige Arzneimittel"
* extension[acceptDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AcceptDate"
* insert Date(extension[acceptDate].valueDate)
* extension[expiryDate].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate"
* insert Date(extension[expiryDate].valueDate)
* identifier[PrescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[PrescriptionID].value = "160.000.033.491.280.78"
* identifier[AccessCode].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode"
* identifier[AccessCode].value = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #completed
* intent = #order
* insert DateTime(authoredOn)
* performerType[+].coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_OrganizationType#urn:oid:1.2.276.0.76.4.54 "Öffentliche Apotheke"
* for.identifier.system = $identifier-kvid-10
* for.identifier.value = "X123456789"
* insert DateTimeStampPlus1Hr(lastModified)
* input[ePrescription].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#1 "Health Care Provider Prescription"
* input[ePrescription].valueReference.reference = "281a985c-f25b-4aae-91a6-41ad744080b0"
* input[patientReceipt].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#2 "Patient Confirmation"
* input[patientReceipt].valueReference.reference = "f8c2298f-7c00-4a68-af29-8a2862d55d43"
* output[receipt].type.coding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#3 "Receipt"
* output[receipt].valueReference.reference = "dffbfd6a-5712-4798-bdc8-07201eb77ab8"
