Instance: GEM_ERP_SP_AcceptDate
InstanceOf: SearchParameter
Usage: #definition
* insert OperationVersioning
* id = "gem-erp-sp-acceptdate"
* name = "GEM_ERP_SP_AcceptDate"
* description = "Returns Tasks with specified Accept date."
* base[+] = #Task
* code = #accept-date
* type = #date
* expression = "extension.where(url = 'https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AcceptDate').value"