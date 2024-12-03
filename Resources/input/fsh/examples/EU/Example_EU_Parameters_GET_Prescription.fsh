Instance: ExampleEUGETPrescription
InstanceOf: GEM_ERP_PR_PAR_EU_GET_Prescription_Input
Usage: #example
Title: "Example EU-GET Prescription Parameters"

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