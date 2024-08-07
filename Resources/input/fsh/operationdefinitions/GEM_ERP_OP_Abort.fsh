Instance: AbortOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Abort)
* description = "This Operation aborts the workflow of an e-prescription and deletes all the data related to that Task."
* code = #abort
// in
* parameter[+]
  * name = #ac
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "[To be used by patient and providers(doctors/dentists) only] The secret parameter that lets users access the Task exclusively as the URL an Parameter ?ac."
  * type = #string

// alternative in
* parameter[+]
  * name = #secret
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "[To be used by pharmacy only] The secret parameter that lets a pharmacy access the Task exclusively as the URL an Parameter ?secret."
  * type = #string

//TODO Return OperationOutcome definieren und Parameters Profil erstellen