Profile: GEM_ERP_PR_Device
Parent: Device
Id: GEM-ERP-PR-Device
Description: "static information on the ePrescription backend server"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Device"
* ^version = "1.3.0"
* ^status = #draft
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Device|1.3" (exactly)
* status 1..
* serialNumber MS
* deviceName 1..1
* version 1..1
* contact MS

Instance: ReceiptBundleDevice
InstanceOf: GEM_ERP_PR_Device
Title:   "Device for Receipt Bundle 'Quittung'"
Usage: #inline
* id = "1"
* meta.profile[+] = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Device|1.3"
* status = #active
* serialNumber = "1.4.0"
* deviceName.name = "E-Rezept-Fachdienst"
* deviceName.type = #user-friendly-name
* version.value = "1.4.0"
* contact.system = #email
* contact.value = "betrieb@gematik.de"