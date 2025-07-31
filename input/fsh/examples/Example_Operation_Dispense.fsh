Instance: ExampleOperationDispenseError
InstanceOf: OperationOutcome
Title: "Beispiel für Dispense-Operation Fehlerantwort"
Description: "Beispiel für eine Fehlerantwort bei der Dispense-Operation mit FHIR-Validierungsfehlern"
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