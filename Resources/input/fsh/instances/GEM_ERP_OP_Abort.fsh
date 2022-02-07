Instance: Abort Operation
InstanceOf: OperationDefinition
Usage: #definition
* url = "http://gematik.de/fhir/OperationDefinition/AbortOperationDefinition"
* version = "1.1.1"
* name = "Abort Operation"
* status = #draft
* kind = #operation
* date = "2020-07-01"
* description = "This Operation aborts the workflow of an e-prescription and deletes all the data related to that Task."
* code = #abort
* resource = #Task
* system = false
* type = false
* instance = true
* parameter[0].name = #ac
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "[To be used by patient and providers(doctors/dentists) only] The secret parameter that lets users access the Task exclusively as the URL an Paramter ?ac."
* parameter[=].type = #string
* parameter[+].name = #secret
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "[To be used by pharmacy only] The secret parameter that lets a pharmacy access the Task exclusively as the URL an Paramter ?secret."
* parameter[=].type = #string