Instance: Inline-Instance-for-521331b4-1fa2-11ec-9621-0242ac130002-1
InstanceOf: Medication
Usage: #inline
* id = "0c2befb0-7381-4b5e-8bb4-37019902fead"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN|1.0.2"
* extension[0].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category"
* extension[=].valueCoding = $KBV_CS_ERP_Medication_Category#00
* extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine"
* extension[=].valueBoolean = false
* extension[+].url = "http://fhir.de/StructureDefinition/normgroesse"
* extension[=].valueCode = #N1
* code = $pzn#06313728
* code.text = "Sumatriptan-1a Pharma 100 mg Tabletten"
* form = $KBV_CS_SFHIR_KBV_DARREICHUNGSFORM#TAB
* amount.numerator.value = 20
* amount.numerator.unit = "St"
* amount.denominator.value = 1