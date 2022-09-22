Instance: AbortOperation
InstanceOf: OperationDefinition
Usage: #definition
* url = "https://gematik.de/fhir/erp/OperationDefinition/AbortOperationDefinition"
* version = "1.2"
* name = "Abort"
* status = #draft
* kind = #operation
* date = "2022-04-01"
* description = "This Operation aborts the workflow of an e-prescription and deletes all the data related to that Task."
* affectsState = true
* code = #abort
* resource = #Task
* system = false
* type = false
* instance = true
// in
* parameter[0].name = #ac
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "[To be used by patient and providers(doctors/dentists) only] The secret parameter that lets users access the Task exclusively as the URL an Paramter ?ac."
* parameter[=].type = #string
// alternative in
* parameter[+].name = #secret
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "[To be used by pharmacy only] The secret parameter that lets a pharmacy access the Task exclusively as the URL an Paramter ?secret."
* parameter[=].type = #string