Instance: EUCloseOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(EUClose)
* description = "The operation $close finishes the e-prescription workflow and creates a receipt. The Output of this operation is a signed Bundle, to be used for further financial processing. The status of the Task then changes into #completed"
* code = #eu-close
* system = false
* type = false
* instance = true
* resource = #Task

* inputProfile = Canonical(GEM_ERP_PR_PAR_EU_CloseOperation_Input)

// in
* parameter[+]
  * name = #practitionerData
  * use = #in
  * type = #Practitioner
  * min = 1
  * max = "1"
  * documentation = "Information on the practitioner who dispensed"
* parameter[+]
  * name = #organizationData
  * use = #in
  * type = #Organization
  * min = 1
  * max = "1"
  * documentation = "Information on the organization where the dispensation happened"
* parameter[+]
  * name = #practitionerRoleData
  * type = #PractitionerRole
  * use = #in
  * min = 1
  * max = "1"

* parameter[+]
  * name = #rxDispensation
  * use = #in
  * min = 1
  * max = "*"
  * documentation = "Information on dispensed Medication(s)"
  * part[+]
    * name = #medicationDispense
    * type = #MedicationDispense
    * use = #in
    * min = 1
    * max = "1"
  * part[+]
    * name = #medication
    * type = #Medication
    * use = #in
    * min = 1
    * max = "1"