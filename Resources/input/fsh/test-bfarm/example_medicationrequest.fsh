Instance: ExampleMedicationRequest-T
InstanceOf: MedicationRequest
Title: "Example MedicationRequest"
Description: "A MedicationRequest for Paracetamol"
* status = #active
* intent = #order
* authoredOn = "2026-04-01"
* medicationReference = Reference(ExampleMedication1-Paracetamol-T)
* dosageInstruction[+].text = "1-1-1-1"
* subject.extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
  * valueCode = #not-permitted
* dispenseRequest
  * quantity.value = 10
  * quantity.unit = "Tablette"
* extension[+].url = "http://example.org/fhir/StructureDefinition/confirmations"
  * extension[+].url = "safetyMeasures"
  * extension[=].valueBoolean = true
  * extension[+].url = "informationMaterial"
  * extension[=].valueBoolean = true
  * extension[+].url = "offLabelUse"
  * extension[=].valueBoolean = false
  * extension[+].url = "prescriptionForWoman"
  * extension[=].valueBoolean = false
  * extension[+].url = "expertiseConfirmation"
  * extension[=].valueBoolean = true

Instance: ExampleMedication1-Paracetamol-T
InstanceOf: Medication
Title: "Example Medication - Paracetamol"
Description: "Paracetamol 500 mg Tabletten"
* code.coding[+]
  * system = "http://www.whocc.no/atc"
  * code = #N02BE01
  * display = "Paracetamol"
* code.text = "Paracetamol 500 mg Tabletten"
* form.coding[+]
  * system = $KBV_CS_SFHIR_KBV_DARREICHUNGSFORM
  * code = #TAB
  * display = "Tablette"
