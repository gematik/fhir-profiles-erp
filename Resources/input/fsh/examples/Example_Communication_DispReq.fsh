Instance: Communication_DispenseRequest
InstanceOf: GEM_ERP_PR_Communication_DispReq
Title: "Communication message sent by patient to pharmacy to request the dispensation of medicine by providing the AccessCode"
Usage: #example
* id = "a218a36e-f2fd-4603-ba67-c827acfef01b"
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_Communication_DispReq)
* meta.tag[+].display = "Dispense Request from Patient to Pharmacy"
* meta.tag[+].display = "Communication message sent by patient to pharmacy to request the dispensation of medicine by providing the AccessCode"
* extension[flowType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* extension[flowType].valueCoding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType#160 "Muster 16 (Apothekenpflichtige Arzneimittel)"
* basedOn.reference = "Task/160.000.033.491.280.78/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #unknown
* recipient[+].identifier.system = $identifier-telematik-id
* recipient[=].identifier.value = "3-SMC-B-Testkarte-883110000123465"
* sender.identifier.system = $identifier-kvid-10
* sender.identifier.value = "X234567890"
* insert DateTimeStamp(sent)
* payload.contentString = "{ \"version\": \"1\", \"supplyOptionsType\": \"delivery\", \"name\": \"Dr. Maximilian von Muster\", \"address\": [ \"wohnhaft bei Emilia Fischer\", \"Bundesallee 312\", \"123. OG\", \"12345 Berlin\" ], \"hint\": \"Bitte im Morsecode klingeln: -.-.\", \"phone\": \"004916094858168\" }"

Instance: Communication_DispenseRequest_DiGA
InstanceOf: GEM_ERP_PR_Communication_DispReq
Title: "Communication message sent by patient to insurance company to request the dispensation of a DiGA by providing the AccessCode"
Usage: #example
* id = "2be1c6ac-5d10-47f6-84ee-8318b2c22c76"
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_Communication_DispReq)
* meta.tag[+].display = "Dispense Request from Patient to Health Care Provider"
* meta.tag[+].display = "Communication message sent by patient to Health Care Provider to request the redeemCode for a DiGA"
* extension[flowType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* extension[flowType].valueCoding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType#162 "Muster 16 (Digitale Gesundheitsanwendungen)"
* basedOn.reference = "Task/162.000.033.491.280.78/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #unknown
* recipient[+].identifier.system = $identifier-telematik-id
* recipient[=].identifier.value = "8-SMC-B-Testkarte-883110000123465"
* sender.identifier.system = $identifier-kvid-10
* sender.identifier.value = "X234567890"
* insert DateTimeStamp(sent)

/*
Instance: INVALID-Communication-DispenseRequest-DiGA
InstanceOf: GEM_ERP_PR_Communication_DispReq
Title: "Communication message sent by patient to insurance company to request the dispensation of a DiGA by providing the AccessCode"
Usage: #example
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_Communication_DispReq)
* meta.tag.display = "Communication message sent by patient to pharmacy to request the dispensation of medicine by providing the AccessCode"
* extension[flowType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* extension[flowType].valueCoding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType#162 "Muster 16 (Digitale Gesundheitsanwendungen)"
* basedOn.reference = "Task/162.000.033.491.280.78/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #unknown
* recipient[+].identifier.system = $identifier-telematik-id
* recipient[=].identifier.value = "8-SMC-B-Testkarte-883110000123465"
* sender.identifier.system = $identifier-kvid-10
* sender.identifier.value = "X234567890"
* insert DateTimeStamp(sent)
* payload.contentString = "U.N.V.E.U"

Instance: INVALID-Communication-DispenseRequest
InstanceOf: GEM_ERP_PR_Communication_DispReq
Title: "Communication message sent by patient to pharmacy to request the dispensation of medicine by providing the AccessCode"
Usage: #example
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_Communication_DispReq)
* meta.tag.display = "Communication message sent by patient to pharmacy to request the dispensation of medicine by providing the AccessCode"
* extension[flowType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* extension[flowType].valueCoding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType#160 "Muster 16 (Apothekenpflichtige Arzneimittel)"
* basedOn.reference = "Task/160.000.033.491.280.78/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #unknown
* recipient[+].identifier.system = $identifier-telematik-id
* recipient[=].identifier.value = "3-SMC-B-Testkarte-883110000123465"
* sender.identifier.system = $identifier-kvid-10
* sender.identifier.value = "X234567890"
* insert DateTimeStamp(sent)
*/