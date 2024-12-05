Instance: ExampleEUCloseInputParameters
InstanceOf: GEM_ERP_PR_PAR_EU_CloseOperation_Input
Usage: #example
Title: "Example EU-Close Parameters"

* parameter[requestData]
  * name = "requestData"
  * part[kvnr]
    * name = "kvnr"
    * valueIdentifier.value = "X123456789"
  * part[accessCode]
    * name = "accessCode"
    * valueIdentifier.value = "ABC123"
  * part[countryCode]
    * name = "countryCode"
    * valueCoding.code = #BE

* parameter[practitionerData]
  * name = "practitionerData"
  * resource = Example-EU-Practitioner
* parameter[organizationData]
  * name = "organizationData"
  * resource = Example-EU-Organization
* parameter[practitionerRoleData]
  * name = "practitionerRoleData"
  * resource = Example-EU-PractitionerRole

* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-EU
  * part[medication]
    * name = "medication"
    * resource = SumatripanMedication
