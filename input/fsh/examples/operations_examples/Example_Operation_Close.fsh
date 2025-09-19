Instance: ExampleOperationCloseError
InstanceOf: OperationOutcome
Title: "Beispiel für Close-Operation Fehlerantwort"
Description: "Beispiel für eine Fehlerantwort bei der Close-Operation mit FHIR-Validierungsfehlern"
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
