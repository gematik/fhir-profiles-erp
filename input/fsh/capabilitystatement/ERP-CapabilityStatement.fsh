Instance: ERPFachdienstCapabilities
InstanceOf: CapabilityStatement
Usage: #definition
* insert OperationVersioning

* id = "e-rezept-fachdienst"
* name = "E-Rezept-Fachdienst"
* title = "E-Rezept-Fachdienst CapabilityStatement"
* description = "E-Rezept-Fachdienst CapabilityStatement"
* publisher = "gematik GmbH"
* contact
  * telecom
    * system = #url
    * value = "https://www.gematik.de"
* kind = #capability

* fhirVersion = #4.0.1
* format[+] = #application/fhir+json
* format[+] = #application/fhir+xml
* rest.mode = #server
//TODO * extension[baseUrl].valueString = "http://epa4all/epa/medication/api/v1/fhir"

// MedicationDispense
* insert CapSupportResource(MedicationDispense, #SHALL)
* insert CapProfile(GEM_ERP_PR_MedicationDispense, #SHALL)
* insert CapProfile(GEM_ERP_PR_MedicationDispense_DiGA, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert CapResourceInteraction(#read, #SHALL)

* insert CapSupportResourceSearchParam(whenhandedover, http://hl7.org/fhir/SearchParameter/MedicationDispense-whenhandedover, #date, #SHALL, "MedicationDispense.whenHandedOver")
* insert CapSupportResourceSearchParam(whenprepared, http://hl7.org/fhir/SearchParameter/MedicationDispense-whenprepared, #date, #SHALL, "MedicationDispense.whenPrepared")
* insert CapSupportResourceSearchParam(performer, http://hl7.org/fhir/SearchParameter/MedicationDispense-performer, #reference, #SHALL, "MedicationDispense.performer.actor")
* rest.resource[=].searchInclude[+] = "MedicationDispense:medication"

// Task
* insert CapSupportResource(Task, #SHALL)
* insert CapProfile(GEM_ERP_PR_Task, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert CapResourceInteraction(#read, #SHALL)
* insert CapSupportResourceSearchParam(authored-on, http://hl7.org/fhir/SearchParameter/Task-authored-on, #date, #SHALL, "Task.authoredOn")
* insert CapSupportResourceSearchParam(status, http://hl7.org/fhir/SearchParameter/Task-status, #token, #SHALL, "Task.status")
* insert CapSupportCustomSearchParam(expiry-date, GEM_ERP_SP_ExpiryDate, #date, #SHALL, "Task.extension")
* insert CapSupportCustomSearchParam(accept-date, GEM_ERP_SP_AcceptDate, #date, #SHALL, "Task.extension")
* insert CapSupportResourceSearchParam(modified, http://hl7.org/fhir/SearchParameter/Task-modified, #date, #SHALL, "Task.lastModified")

// AuditEvent
* insert CapSupportResource(AuditEvent, #SHALL)
* insert CapProfile(GEM_ERP_PR_AuditEvent, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)

* insert CapSupportResourceSearchParam(date, http://hl7.org/fhir/SearchParameter/AuditEvent-date, #date, #SHALL, "AuditEvent.recorded")
* insert CapSupportResourceSearchParam(entity, http://hl7.org/fhir/SearchParameter/AuditEvent-entity, #reference, #SHALL, "AuditEvent.entity.what.identifier.value")

// Communication
* insert CapSupportResource(Communication, #SHALL)
* insert CapProfile(GEM_ERP_PR_Communication_DispReq, #SHALL)
* insert CapProfile(GEM_ERP_PR_Communication_DiGA, #SHALL)
* insert CapProfile(GEM_ERP_PR_Communication_Reply, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert CapResourceInteraction(#read, #SHALL)

* insert CapSupportResourceSearchParam(sent, http://hl7.org/fhir/SearchParameter/Communication-sent, #date, #SHALL, "Communication.sent")
* insert CapSupportResourceSearchParam(received, http://hl7.org/fhir/SearchParameter/Communication-received, #date, #SHALL, "Communication.received")
* insert CapSupportResourceSearchParam(recipient, http://hl7.org/fhir/SearchParameter/Communication-recipient, #reference, #SHALL, "Communication.recipient.identifier.value")
* insert CapSupportResourceSearchParam(sender, http://hl7.org/fhir/SearchParameter/Communication-sender, #reference, #SHALL, "Communication.sender.identifier.value")

// ChargeItem
* insert CapSupportResource(ChargeItem, #SHALL)
* rest.resource[=].profile = "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_ChargeItem"
* rest.resource[=].profile.extension[0].url = $capabilitystatement-expectation
* rest.resource[=].profile.extension[0].valueCode = #SHALL

* insert CapResourceInteraction(#search-type, #SHALL)
* insert CapResourceInteraction(#read, #SHALL)

* insert CapSupportResourceSearchParam(entered-date, http://hl7.org/fhir/SearchParameter/ChargeItem-date, #date, #SHALL, "ChargeItem.enteredDate")
* insert CapSupportResourceSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, #SHALL, "ChargeItem.meta.lastUpdated")

//Operations
* insert CapSupportSystemOperation(Abort, AbortOperation, #SHALL)

* insert CapSupportSystemOperation(Accept, AcceptOperation, #SHALL)

* insert CapSupportSystemOperation(Activate, ActivateOperation, #SHALL)

* insert CapSupportSystemOperation(Create, CreateOperation, #SHALL)

* insert CapSupportSystemOperation(Close, CloseOperation, #SHALL)

* insert CapSupportSystemOperation(Dispense, DispenseOperation, #SHALL)

* insert CapSupportSystemOperation(Reject, RejectOperation, #SHALL)