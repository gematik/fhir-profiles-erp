Instance: Communication_Reply_DiGA
InstanceOf: GEM_ERP_PR_Communication_DiGA
Title: "Communication message sent by health care provider to patient"
Usage: #example
* id = "140f716f-f649-44fe-9a4e-157eb3c8adf3"
* insert PackageMetaProfile(StructureDefinition/GEM_ERP_PR_Communication_DiGA)
* meta.tag[+].display = "Health Care Provider to Patient"
* meta.tag[+].display = "Communication message sent by health care provider to patient"
* basedOn.reference = "Task/162.000.000.000.000.01"
* status = #unknown
* sender.identifier.system = $identifier-telematik-id
* sender.identifier.value = "8-SMC-B-Testkarte-783498105628375"
* recipient.identifier.system = $identifier-kvid-10
* recipient.identifier.value = "X234567890"
* insert DateTimeStamp(sent)
* payload.contentString = "Nachrichteninhalt für den Versicherten"
