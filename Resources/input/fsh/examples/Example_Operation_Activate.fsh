Instance: ExampleOperationActivateParametersInput
InstanceOf: Parameters
Title: "Example Activate operation input parameters"
Usage: #example
* parameter[+].name = "ePrescription"
* parameter[=].resource = PrescriptionBinary

Instance: ExampleOperationActivateError
InstanceOf: OperationOutcome
Title: "Example Activate operation error response"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.text = "unknown or unexpected profile"
  * diagnostics = "Unable to determine profile type from name: https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle"