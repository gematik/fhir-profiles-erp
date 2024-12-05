Instance: GET-Prescription-EU
InstanceOf: OperationDefinition
Usage: #definition
* insert OperationVersioning
* description = "The Operation gets Presciption Information from the ERP System for usage in the e-prescription workflow for EU countries"
* code = #get-eu-prescriptions
* url = "https://gematik.de/fhir/erp/OperationDefinition/GET-Prescription-EU-OperationDefinition"
* name = "GET-Prescription-EU"
* kind = #operation
* affectsState = false
* system = true
* type = false
* instance = false

* inputProfile = Canonical(GEM_ERP_PR_PAR_EU_GET_Prescription_EU_Input)

// in
* parameter[+]
  * name = #requestData
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Additional request information"
  * part[+]
    * name = #requesttype
    * use = #in
    * min = 1
    * max = "1"
    * type = #Coding
  * part[+]
    * name = #prescription-ids
    * use = #in
    * min = 0
    * max = "1"
    * part[+]
      * name = #prescription-id
      * use = #in
      * min = 1
      * max = "*"
      * type = #Identifier
  * part[+]
    * name = #kvnr
    * use = #in
    * min = 1
    * max = "1"
    * type = #Identifier
  * part[+]
    * name = #accessCode
    * use = #in
    * min = 1
    * max = "1"
    * type = #Identifier
  * part[+]
    * name = #countryCode
    * use = #in
    * min = 1
    * max = "1"
    * type = #Coding
  * part[+]
    * name = #practitionerName
    * use = #in
    * min = 1
    * max = "1"
    * type = #string
  * part[+]
    * name = #practitionerRole
    * use = #in
    * min = 1
    * max = "1"
    * type = #Coding
  * part[+]
    * name = #pointOfCare
    * use = #in
    * min = 1
    * max = "1"
    * type = #string
  * part[+]
    * name = #healthcare-facility-type
    * use = #in
    * min = 1
    * max = "1"
    * type = #Coding
