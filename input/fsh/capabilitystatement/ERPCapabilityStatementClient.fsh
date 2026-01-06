Instance: ERPFachdienstClient
InstanceOf: TICapabilityStatement
Usage: #definition
* insert Meta-Instance

* id = "erp-fachdienst-client"
* name = "ERPFachdienstClient"
* title = "ERP Capability Statement für Clients des E-Rezept-Fachdienst"
* description = "Dieses Capability Statement legt die Anforderungen an Clients des E-Rezept-Fachdienst fest. Es definiert die unterstützten Interaktionen, erforderliche HTTP Header sowie erwartete Status Codes."
* contact
  * telecom
    * system = #url
    * value = "https://www.gematik.de"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+json
* format[+] = #application/fhir+xml
* rest.mode = #client

* extension[baseUrl].valueString = "http://todo"
* insert Error423Locked

* insert MedicationDispenseInteraction(#MAY)

* insert CapSupportResource(Task, #MAY)
* insert CapSupportResourceOperation(create, CreateOperation, #SHALL)
* insert CapSupportResourceOperation(activate, ActivateOperation, #SHALL)
* insert CapSupportResourceOperation(abort, AbortOperation, #SHALL)