Instance: ExampleEUCloseInputParameters
InstanceOf: GEM_ERP_PR_PAR_EU_CloseOperation_Input
Usage: #example
Title: "Example EU-Close Parameters"

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

* parameter[requestData]
  * name = "requestData"
  * part[requesttype]
    * name = "requesttype"
    * valueCoding = GEM_ERP_CS_RequestType_EU#demographics
  * part[kvnr]
    * name = "kvnr"
    * valueIdentifier.value = "X123456789"
  * part[zugriffscode]
    * name = "zugriffscode"
    * valueIdentifier.value = "123456"
  * part[countryCode]
    * name = "countryCode"
    * valueCoding.code = #BE
  * part[practitionerName]
    * name = "practitionerName"
    * valueString = "Sanches"
  * part[practitionerRole]
    * name = "practitionerRole"
    * valueString = "Doctor"
  * part[pointOfCare]
    * name = "pointOfCare"
    * valueString = "Super Pharmacia"
  * part[healthcare-facility-type]
    * name = "healthcare-facility-type"
    * valueCoding.code = #apotheke