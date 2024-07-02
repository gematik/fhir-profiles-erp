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
