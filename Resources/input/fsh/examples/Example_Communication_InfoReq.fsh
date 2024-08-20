Instance: Communication_InformationRequest
InstanceOf: GEM_ERP_PR_Communication_InfoReq
Title: "Communication message sent by patient to pharmacy to ask for availybility of medicine WITHOUT providing the AccessCode"
Usage: #example
* id = "8ca3c379-ac86-470f-bc12-178c9008f5c9"
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_Communication_InfoReq)
* meta.tag.display = "Communication message sent by patient to pharmacy to ask for availybility of medicine WITHOUT providing the AccessCode"
* contained[+] = SumatripanMedication
* basedOn.reference = "Task/160.000.033.491.280.78"
* status = #unknown
* about = Reference(SumatripanMedication)
* recipient[+].identifier.system = $identifier-telematik-id
* recipient[=].identifier.value = "3-SMC-B-Testkarte-883110000123465"
* sender.identifier.system = $identifier-kvid-10
* sender.identifier.value = "X234567890"
* sent = "2020-04-29T13:43:30.128+02:00"
* payload.extension[InsuranceProvider].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_InsuranceProvider"
* payload.extension[InsuranceProvider].valueIdentifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payload.extension[InsuranceProvider].valueIdentifier.value = "109500969"
* payload.extension[SubstitutionAllowed].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_SubstitutionAllowedType"
* payload.extension[SubstitutionAllowed].valueBoolean = false
* payload.extension[PrescriptionType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* payload.extension[PrescriptionType].valueCoding.system = "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType"
* payload.extension[PrescriptionType].valueCoding.code = #160
* payload.extension[PackageQuantity].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PackageQuantity"
* payload.extension[PackageQuantity].valueQuantity.system = "http://unitsofmeasure.org"
* payload.extension[PackageQuantity].valueQuantity.value = 1
* payload.extension[PreferredSupplyOptions].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_SupplyOptionsType"
* payload.extension[PreferredSupplyOptions].extension[onPremise].url = "onPremise"
* payload.extension[PreferredSupplyOptions].extension[onPremise].valueBoolean = true
* payload.extension[PreferredSupplyOptions].extension[shipment].url = "shipment"
* payload.extension[PreferredSupplyOptions].extension[shipment].valueBoolean = false
* payload.extension[PreferredSupplyOptions].extension[delivery].url = "delivery"
* payload.extension[PreferredSupplyOptions].extension[delivery].valueBoolean = true
* payload.contentString = "U.N.V.E.U."
