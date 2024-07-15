Instance: ExampleOperationCloseInputParameters
InstanceOf: GEM_ERP_PR_PAR_CloseOperation_Input
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

Instance: ExampleOperationCloseInputParametersWithoutMedication
InstanceOf: GEM_ERP_PR_PAR_CloseOperation_Input
Usage: #example
Title: "Example Close Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense

Instance: ExampleOperationCloseInputParametersMultipleMedicationDispenses
InstanceOf: GEM_ERP_PR_PAR_CloseOperation_Input
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

Instance: ExampleOperationCloseInputParametersKombipackung
InstanceOf: GEM_ERP_PR_PAR_CloseOperation_Input
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

Instance: ExampleOperationCloseInputParametersRezeptur
InstanceOf: GEM_ERP_PR_PAR_CloseOperation_Input
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

Instance: ExampleOperationCloseInputParametersDiGA
InstanceOf: GEM_ERP_PR_PAR_CloseOperation_Input
Usage: #example
Title: "Example Close Parameters"
* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-DiGA-Name-And-PZN

Instance: ExampleOperationCloseError
InstanceOf: OperationOutcome
Title: "Example Close operation error response"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.text = "FHIR-Validation error"
  * diagnostics = """
    MedicationDispense.status: error: Value closed not allowed for ValueSet binding, allowed are 
    [http://terminology.hl7.org/CodeSystem/medicationdispense-status]cancelled, 
    [http://terminology.hl7.org/CodeSystem/medicationdispense-status]completed, 
    [http://terminology.hl7.org/CodeSystem/medicationdispense-status]declined, 
    [http://terminology.hl7.org/CodeSystem/medicationdispense-status]entered-in-error, 
    [http://terminology.hl7.org/CodeSystem/medicationdispense-status]in-progress, 
    [http://terminology.hl7.org/CodeSystem/medicationdispense-status]on-hold, 
    [http://terminology.hl7.org/CodeSystem/medicationdispense-status]preparation, 
    [http://terminology.hl7.org/CodeSystem/medicationdispense-status]stopped, 
    [http://terminology.hl7.org/CodeSystem/medicationdispense-status]unknown 
    (from profile: https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense|1.2); 
    MedicationDispense.status: error: Value closed not allowed for ValueSet binding, allowed are 
    [http://terminology.hl7.org/CodeSystem/medicationdispense-status]cancelled, 
    [http://terminology.hl7.org/CodeSystem/medicationdispense-status]completed, 
    [http://terminology.hl7.org/CodeSystem/medicationdispense-status]declined, 
    [http://terminology.hl7.org/CodeSystem/medicationdispense-status]entered-in-error, 
    [http://terminology.hl7.org/CodeSystem/medicationdispense-status]in-progress, 
    [http://terminology.hl7.org/CodeSystem/medicationdispense-status]on-hold, 
    [http://terminology.hl7.org/CodeSystem/medicationdispense-status]preparation, 
    [http://terminology.hl7.org/CodeSystem/medicationdispense-status]stopped, 
    [http://terminology.hl7.org/CodeSystem/medicationdispense-status]unknown 
    (from profile: http://hl7.org/fhir/StructureDefinition/MedicationDispense|4.0.1); 
    MedicationDispense.status: error: value must match fixed value: "completed" (but is "closed") 
    (from profile: https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense|1.2);
    """
