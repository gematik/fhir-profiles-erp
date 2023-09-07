Profile: GEM_ERP_PR_MedicationDispense
Parent: MedicationDispense
Id: GEM-ERP-PR-MedicationDispense
Title: "Dispensation of the Prescription"
Description: "Handles information about the redeem of the prescription and the submited medication."
* insert Meta(GEM_ERP_PR_MedicationDispense)
* identifier 1..1
* identifier only GEM_ERP_PR_PrescriptionId
* identifier ^short = "ePrescription identifier"
* status = #completed (exactly)
* status ^short = "completed"
* medication[x] only Reference
* medication[x] MS
* medication[x] ^definition = "The MedicationDispense shows a contained medication based on the four KBV Medication-Profiles (KBV_PR_ERP_Medication_Compounding, KBV_PR_ERP_Medication_FreeText, KBV_PR_ERP_Medication_Ingredient, KBV_PR_ERP_Medication_PZN)."
* medication[x] ^type.aggregation = #contained
* subject 1..
* subject.identifier 1..
* subject.identifier only $identifier-kvid-10 or $identifier-pkv
* subject.identifier ^short = "The patients KVNR"
* performer 1..1
* performer.actor.identifier 1..
* performer.actor.identifier only IdentifierTelematikId
* whenPrepared ^mustSupport = false
* whenHandedOver 1..
* dosageInstruction MS

Instance: MedicationDispenseExample
InstanceOf: MedicationDispense
Usage: #example
* id = "83e1e4da-79e8-49e8-8569-1e96f65dfac0"
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier.value = "160.000.040.327.751.54"
* contained = bdcc7002-d2c2-46d5-ac71-4f6b96ae6c0c
* medicationReference = Reference(bdcc7002-d2c2-46d5-ac71-4f6b96ae6c0c)
* meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense|1.2"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X110498565"
* whenHandedOver = "2023-04-21"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer.actor.identifier.value = "3-SMC-B-Testkarte-883110000116873"
* status = #completed

Instance: bdcc7002-d2c2-46d5-ac71-4f6b96ae6c0c
InstanceOf: Medication
Usage: #inline
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN|1.1.0"
* extension[0].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type"
* extension[=].valueCodeableConcept.coding = http://snomed.info/sct#763158003 "Medicinal product (product)"
* extension[=].valueCodeableConcept.coding.version = "http://snomed.info/sct/900000000000207008/version/20220331"
* extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category"
* extension[=].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category#00
* extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine"
* extension[=].valueBoolean = false
* extension[+].url = "http://fhir.de/StructureDefinition/normgroesse"
* extension[=].valueCode = #NB
* amount.denominator.value = 1
* amount.numerator.unit = "Stk"
* amount.numerator.extension.url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize"
* amount.numerator.extension.valueString = "1"
* code.text = "Schmerzmittel"
* code = http://fhir.de/CodeSystem/ifa/pzn#12345678
* form = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM#TAB