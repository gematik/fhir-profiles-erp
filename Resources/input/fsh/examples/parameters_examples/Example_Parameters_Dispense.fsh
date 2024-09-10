Instance: ExampleDispenseInputParameters
InstanceOf: GEM_ERP_PR_PAR_DispenseOperation_Input
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
InstanceOf: GEM_ERP_PR_PAR_DispenseOperation_Input
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
InstanceOf: GEM_ERP_PR_PAR_DispenseOperation_Input
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
InstanceOf: GEM_ERP_PR_PAR_DispenseOperation_Output
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
InstanceOf: GEM_ERP_PR_PAR_DispenseOperation_Output
Usage: #example
Title: "Example Dispense Parameters Response on Error"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[operationOutcome]
    * name = "operationOutcome"
    * resource = ExampleOperationDispenseError

/*
Instance: INVALID-ExampleDispenseInputParametersWithoutMedication
InstanceOf: GEM_ERP_PR_PAR_DispenseOperation_Input
Usage: #example
Title: "Example Dispense Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-Without-Medication

Instance: INVALID-ExampleDispenseInputParametersNoParts
InstanceOf: GEM_ERP_PR_PAR_DispenseOperation_Input
Usage: #example
Title: "Example Dispense Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"

Instance: INVALID-ExampleDispenseInputParametersReferenceWrong
InstanceOf: GEM_ERP_PR_PAR_DispenseOperation_Input
Usage: #example
Title: "Example Dispense Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense
  * part[medication]
    * name = "medication"
    * resource = SimpleMedication

Instance: INVALID-ExampleDispenseInputParametersReferenceWrongMultiple
InstanceOf: GEM_ERP_PR_PAR_DispenseOperation_Input
Usage: #example
Title: "Example Dispense Parameters"
* parameter[rxDispensation][+]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense
  * part[medication]
    * name = "medication"
    * resource = Medication-Without-Strength-Code
* parameter[rxDispensation][+]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-2
  * part[medication]
    * name = "medication"
    * resource = SumatripanMedication
*/