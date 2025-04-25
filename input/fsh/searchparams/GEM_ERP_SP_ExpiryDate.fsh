Instance: GEM_ERP_SP_ExpiryDate
InstanceOf: SearchParameter
Usage: #definition
* insert OperationVersioning
* id = "gem-erp-sp-expirydate"
* name = "GEM_ERP_SP_ExpiryDate"
* description = "Returns Tasks with specified expiry date."
* base[+] = #Task
* code = #expiry-date
* type = #date
* expression = "extension.where(url = 'https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate').value"