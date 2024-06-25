Instance: ExampleCloseInputParameters
InstanceOf: GEM_ERP_PR_CloseOperation_Input
Usage: #example
Title: "Example Close Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense
  * part[medication]
    * name = "medication"
    * resource = SumatripanMedication

Instance: ExampleCloseInputParametersWithoutMedication
InstanceOf: GEM_ERP_PR_CloseOperation_Input
Usage: #example
Title: "Example Close Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense

Instance: ExampleCloseInputParametersMultipleMedicationDispenses
InstanceOf: GEM_ERP_PR_CloseOperation_Input
Usage: #example
Title: "Example Close Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense
  * part[medication]
    * name = "medication"
    * resource = SumatripanMedication
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-2
  * part[medication]
    * name = "medication"
    * resource = Medication-Without-Strength-Code

Instance: ExampleCloseInputParametersKombipackung
InstanceOf: GEM_ERP_PR_CloseOperation_Input
Usage: #example
Title: "Example Close Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-Kombipackung
  * part[medication]
    * name = "medication"
    * resource = Medication-Kombipackung

Instance: ExampleCloseInputParametersRezeptur
InstanceOf: GEM_ERP_PR_CloseOperation_Input
Usage: #example
Title: "Example Close Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-Rezeptur
  * part[medication]
    * name = "medication"
    * resource = Medication-Rezeptur

Instance: ExampleCloseInputParametersDiGA
InstanceOf: GEM_ERP_PR_CloseOperation_Input
Usage: #example
Title: "Example Close Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-DiGA-Name-And-VE-ID