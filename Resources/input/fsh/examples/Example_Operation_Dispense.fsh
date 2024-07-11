Instance: ExampleDispenseInputParameters
InstanceOf: GEM_ERP_PR_DispenseOperation_Input
Usage: #example
Title: "Example Dispense Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense
  * part[medication]
    * name = "medication"
    * resource = SumatripanMedication

Instance: ExampleDispenseInputParametersMultipleMedicationDispenses
InstanceOf: GEM_ERP_PR_DispenseOperation_Input
Usage: #example
Title: "Example Dispense Parameters"
* parameter[rxDispensation][+]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense
  * part[medication]
    * name = "medication"
    * resource = SumatripanMedication
* parameter[rxDispensation][+]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-2
  * part[medication]
    * name = "medication"
    * resource = Medication-Without-Strength-Code

Instance: ExampleDispenseInputParametersKombipackung
InstanceOf: GEM_ERP_PR_DispenseOperation_Input
Usage: #example
Title: "Example Dispense Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-Kombipackung
  * part[medication]
    * name = "medication"
    * resource = Medication-Kombipackung

Instance: ExampleDispenseOutputParametersSuccess
InstanceOf: GEM_ERP_PR_DispenseOperation_Output
Usage: #example
Title: "Example Dispense Parameters Response on Success"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense
  * part[medication]
    * name = "medication"
    * resource = SumatripanMedication

Instance: ExampleDispenseOutputParametersError
InstanceOf: GEM_ERP_PR_DispenseOperation_Output
Usage: #example
Title: "Example Dispense Parameters Response on Error"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[operationOutcome]
    * name = "operationOutcome"
    * resource = ExampleOperationDispenseError

Instance: ExampleOperationDispenseError
InstanceOf: OperationOutcome
Title: "Example Dispense operation error response"
Usage: #inline
* issue[+]
  * severity = #error
  * code = #invalid
  * details.text = "FHIR-Validation error"
  * diagnostics = """
    MedicationDispense.performer[0].actor.identifier.system: error: value must match fixed value: 
    "https://gematik.de/fhir/sid/telematik-id" (but is "https://fhir.de/fhir/sid/telematik-id") 
    (from profile: http://fhir.de/StructureDefinition/identifier-telematik-id|1.5.0);
    """