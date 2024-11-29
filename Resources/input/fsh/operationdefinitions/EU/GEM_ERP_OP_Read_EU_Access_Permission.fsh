Instance: Read-EU-Access-Permission
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Read_EU_Access_Permission)
* description = "This operation reads the currenty in the E-Rezept-Fachdienst registered Access Code for redeeming ePrescriptions in an EU country."
* code = #read-eu-access-permission
* system = true
* type = false
* instance = false
* affectsState = false

* outputProfile = Canonical(GEM_ERP_PR_PAR_EU_Access_Authorization_Response)

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
