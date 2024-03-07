Profile: GEM_ERP_PR_Bundle_Pharmacy_Proof
Parent: Bundle
Id: GEM-ERP-PR-Bundle-Pharmacy-Proof
Title: "Document Bundle for BfArM Approval of admissibility for doctor s prescription of narcotics"
Description: "A document containing resources for BfArM Approval of admissibility for doctor s prescription of narcotics"
* insert Profile(GEM_ERP_PR_Bundle_Pharmacy_Proof)

//Constraints
* obeys gem-pharmacy-proof-1

* id 1..1
* identifier 1..1 MS
* identifier only GEM_ERP_PR_PrescriptionId
* identifier ^short = "identifier of ePrescription"
* type = #document (exactly)
* type MS
* timestamp 1..1

* entry SU
* entry ^slicing.discriminator.type = #value //TODO: 
* entry ^slicing.discriminator.path = "link.url"
* entry ^slicing.rules = #closed
* entry contains
    DocumentInformation 1..1 and
    ePrescription 1..1 MS and
    receipt 1..1 MS and
    dispense_information 0..1 MS and
    dispense_information_pkv 0..1 MS

//Composition des Dokuments
* entry[DocumentInformation].resource only GEM_ERP_PR_Composition_Pharmacy_Proof
* entry[DocumentInformation].resource 1..1
* entry[DocumentInformation].fullUrl 1..1
* entry[DocumentInformation].link 1..1
* entry[DocumentInformation].link.relation = "canonical" (exactly)
* entry[DocumentInformation].link.url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Composition_Pharmacy_Proof" (exactly)

// Verordnung als QES Binary
* entry[ePrescription].resource only GEM_ERP_PR_Binary
* entry[ePrescription].resource 1..1
* entry[ePrescription].fullUrl 1..1
* entry[ePrescription].link 1..1
* entry[ePrescription].link.relation = "canonical" (exactly)
* entry[ePrescription].link.url = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle" (exactly)

//Quittung als nonQES Binary
* entry[receipt].resource only GEM_ERP_PR_Binary
* entry[receipt].resource 1..1
* entry[receipt].fullUrl 1..1
* entry[receipt].link 1..1
* entry[receipt].link.relation = "canonical" (exactly)
* entry[receipt].link.url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle" (exactly)

// Abgabedaten als nonQES oder QES Binary
* entry[dispense_information].resource only GEM_ERP_PR_Binary
* entry[dispense_information].resource 0..1
* entry[dispense_information].fullUrl 1..1
* entry[dispense_information].link 1..1
* entry[dispense_information].link.relation = "canonical" (exactly)
* entry[dispense_information].link.url = "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-PR-ERP-AbgabedatenBundle" (exactly)

// Abgabedaten als nonQES oder QES Binary
* entry[dispense_information_pkv].resource only GEM_ERP_PR_Binary
* entry[dispense_information_pkv].resource 0..1
* entry[dispense_information_pkv].fullUrl 1..1
* entry[dispense_information_pkv].link 1..1
* entry[dispense_information_pkv].link.relation = "canonical" (exactly)
* entry[dispense_information_pkv].link.url = "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-PKV-PR-ERP-AbgabedatenBundle" (exactly)

// Signatur vom FD
* signature only GEM_ERP_PR_Signature
* signature MS
* signature.type 1..1

Invariant: gem-pharmacy-proof-1
Description: "Es muss genau ein Abgabedatensatz angegeben werden"
Expression: "entry.where(link.url='http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-PR-ERP-AbgabedatenBundle').exists() xor entry.where(link.url='http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-PKV-PR-ERP-AbgabedatenBundle').exists()"
Severity: #error


Instance: EBtMPharmacyProofBundle
InstanceOf: GEM_ERP_PR_Bundle_Pharmacy_Proof
Title:   "Document Bundle for BfArM Approval of admissibility for doctor s prescription of narcotics"
Usage: #example
* id = "45716f92-3c94-4a5b-8226-e23bf51af7ed"
* meta.tag.display = "Document Bundle for BfArM Approval of admissibility for doctor s prescription of narcotics"

* identifier[+].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[=].value = "160.000.033.491.280.78"
* type = #document
* timestamp = "2023-08-18T15:28:00+00:00"

* entry[DocumentInformation].fullUrl = "urn:uuid:c68de631-7faf-4c66-92df-8176a3ba9a20"
* entry[DocumentInformation].resource = PharmacyProofComposition
* entry[ePrescription].fullUrl = "urn:uuid:281a985c-f25b-4aae-91a6-41ad744080b0"
* entry[ePrescription].resource = Example-Binary
* entry[ePrescription].link.relation = "canonical"
* entry[ePrescription].link.url = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle"
* entry[receipt].fullUrl = "urn:uuid:dffbfd6a-5712-4798-bdc8-07201eb77ab8"
* entry[receipt].resource = Example-Binary
* entry[receipt].link.relation = "canonical"
* entry[receipt].link.url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle"
* entry[dispense_information].fullUrl = "urn:uuid:83e1e4da-79e8-49e8-8569-1e96f65dfac0"
* entry[dispense_information].resource = Example-Binary
* entry[dispense_information].link.relation = "canonical" //TODO: is it item?
* entry[dispense_information].link.url = "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-PR-ERP-AbgabedatenBundle"
* entry[dispense_information_pkv].fullUrl = "urn:uuid:b0f9466b-d775-40da-a546-7bb0a6155ee6"
* entry[dispense_information_pkv].resource = Example-Binary
* entry[dispense_information_pkv].link.relation = "canonical"
* entry[dispense_information_pkv].link.url = "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-PKV-PR-ERP-AbgabedatenBundle"

* signature.type[AuthorsSignature].system = "urn:iso-astm:E1762-95:2013"
* signature.type[AuthorsSignature].code = #1.2.840.10065.1.12.1.1
* signature.when = "2023-08-18T15:28:00+00:00"
* signature.who.reference = "https://erp.zentral.erp.splitdns.ti-dienste.de/Device/1"
* signature.sigFormat = #application/pkcs7-mime
* signature.data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="

Instance: Example-Binary
InstanceOf: GEM_ERP_PR_Binary
Usage: #inline
Title: "Example-Binary"
Description: "Binary Datei als Beispiel"
* contentType = #application/pkcs7-mime
* data = "SSBhbSBsb29raW5nIGZvciBhIEJlaXNwaWVs"