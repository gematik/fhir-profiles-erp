Instance: Grant-EU-Access-Permission
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Grant_EU_Access_Permission)
* description = "This operation receives the access code and the country that the patient wants to grant access to. The operation validates the country and creates registeres the Access Code."
* code = #grant-eu-access-permission
* system = true
* type = false
* instance = false
* affectsState = true

* inputProfile = Canonical(GEM_ERP_PR_PAR_EU_Access_Authorization_Request)
* outputProfile = Canonical(GEM_ERP_PR_PAR_EU_Access_Authorization_Response)

// in
* parameter[+]
  * name = #countryCode
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "The country for which the patient wants to grant access."
  * type = #Coding

* parameter[+]
  * name = #accessCode
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "The access code for that country."
  * type = #Identifier


// out
* parameter[+]
  * name = #countryCode
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "The country for which the patient wants to grant access."
  * type = #Coding

* parameter[+]
  * name = #accessCode
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "The access code for that country."
  * type = #Identifier

* parameter[+]
  * name = #validUntil
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "The instant until the access code is valid."
  * type = #instant

* parameter[+]
  * name = #createdAt
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "The instant when the record was created in the E-Rezept-Fachdienst."
  * type = #instant
