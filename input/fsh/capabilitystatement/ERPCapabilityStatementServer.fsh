Instance: ERPFachdienstServer
InstanceOf: TICapabilityStatement
Usage: #definition
* insert Meta-Instance

* id = "erp-fachdienst-server"
* name = "ERPFachdienstServer"
* title = "ERP CapabilityStatement für den E-Rezept-Fachdienst"
* description = "ERP CapabilityStatement für den E-Rezept-Fachdienst"
* contact
  * telecom
    * system = #url
    * value = "https://www.gematik.de"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+json
* format[+] = #application/fhir+xml
* rest.mode = #server
* extension[baseUrl].valueString = "http://todo"
* insert Error423Locked

* insert MedicationDispenseInteraction(#SHALL)

* insert CapSupportResource(Task, #SHALL)
* insert CapSupportResourceOperation(create, CreateOperation, #SHALL)
* insert CapSupportResourceOperation(activate, ActivateOperation, #SHALL)
* insert CapSupportResourceOperation(abort, AbortOperation, #SHALL)

