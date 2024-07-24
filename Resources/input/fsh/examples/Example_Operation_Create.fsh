Instance: OperationCreateParametersInputExample
InstanceOf: GEM_ERP_PR_PAR_CreateOperation_Input
Title: "$create Operation Parameters sample"
Usage: #example
* parameter[workflowType].name = "workflowType"
* parameter[workflowType].valueCoding = GEM_ERP_CS_FlowType#160

Instance: ExampleOperationCreateError
InstanceOf: OperationOutcome
Title: "Example Create operation error response"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.text = "FHIR-Validation error"
  * diagnostics = """
    Parameters.parameter[0].valueCoding: error: Code 140 is not part of CodeSystem 
    https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType (from profile: 
    http://hl7.org/fhir/StructureDefinition/Parameters|4.0.1); 
    Parameters.parameter[0].valueCoding: error: Code 140 is not part of CodeSystem 
    https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType (from profile: 
    http://hl7.org/fhir/StructureDefinition/Coding|4.0.1);
    """