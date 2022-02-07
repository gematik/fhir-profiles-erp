Instance: Inline-Instance-for-c040d8ff-ffb3-1234-asdf-dec3de4f4ff3-1
InstanceOf: Composition
Usage: #inline
* id = "2186f464-1f9c-11ec-9621-0242ac130002"
* meta.profile = "https://gematik.de/fhir/StructureDefinition/ErxComposition|1.1.0"
* extension.url = "https://gematik.de/fhir/StructureDefinition/BeneficiaryExtension"
* extension.valueIdentifier.system = "https://gematik.de/fhir/NamingSystem/TelematikID"
* extension.valueIdentifier.value = "3-abc-1234567890"
* status = #final
* type = $Documenttype#3 "Receipt"
* date = "2020-03-20T07:31:34.328+00:00"
* author = Reference(1)
* author.type = "Device"
* title = "Quittung"
* event.period.start = "2020-03-20T07:23:34.328+00:00"
* event.period.end = "2020-03-20T07:31:34.328+00:00"
* section.entry = Reference(Prescription123)
* section.entry.type = "Binary"