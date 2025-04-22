Instance: ExampleMedicationDispense-T
InstanceOf: MedicationDispense
Title: "Example MedicationDispense"
Description: "A MedicationDispense for Ibuprofen"
* status = #completed
* medicationReference = Reference(ExampleMedication2-Ibuprofen-T)
* quantity.value = 10
* quantity.unit = "Tablette"
* dosageInstruction[+].text = "1-1-1-1 nach Bedarf"
* whenHandedOver = "2026-04-02"

Instance: ExampleMedication2-Ibuprofen-T
InstanceOf: Medication
Title: "Example Medication - Ibuprofen"
Description: "Ibuprofen 400 mg Filmtabletten"
* code.coding[+]
  * system = "http://www.whocc.no/atc"
  * code = #M01AE01
  * display = "Ibuprofen"
* code.text = "Ibuprofen 400 mg Tablette"
* form.coding[+]
  * system = $KBV_CS_SFHIR_KBV_DARREICHUNGSFORM
  * code = #TAB
  * display = "Filmtablette"
