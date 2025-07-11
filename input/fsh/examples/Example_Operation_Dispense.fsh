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