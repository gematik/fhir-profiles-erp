Profile: GEM_ERP_PR_BfArMApproval
Parent: Provenance
Id: GEM-ERP-PR-BfArMApproval
Title: "BfArM Approval of admissibility for doctor s prescription of narcotics"
Description: "On serverside validton of prescription (QES, FHIR-validity, etc.) the eprescription server requests authorization for narcotics within the doctor s quota. If approved, the server returns a signed Provenance for documentation purpose"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_BfArMApproval"
* ^version = "1.2"
* ^status = #draft
* id 1..
* meta 1..
* meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_BfArMApproval|1.2" (exactly)
* target 1..1 SU ?!
* target ^slicing.discriminator.type = #type
* target ^slicing.discriminator.path = "$this"
* target ^slicing.description = "This Provenance targets the ePrescription workflow item Task and the ePrescroption as a whole"
* target ^slicing.rules = #closed
* target contains
    TaskReference 1..1	
* target[TaskReference] only Reference(GEM_ERP_PR_Task)
* target[TaskReference] ^short = "Reference to the ePrescription Task"
* recorded ?!
* entity 1..1
* entity.role = #source
* entity.what.identifier.system 1..
* entity.what.identifier.system = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PrescriptionId" (exactly)
* entity.what.identifier.value 1..
* entity.what ^short = "ePrescription Identifier bindng all related documents together (prescription,dispensato data receipt, etc.)"
* agent 1..1 SU
* agent.type. 1..
* agent.type.coding 1..1
* agent.type.coding.system 1..
* agent.type.coding.system = "http://terminology.hl7.org/CodeSystem/contractsignertypecodes" (exactly)
* agent.type.coding.code 1..
* agent.type.coding.code = #VERF (exactly)
* agent.type.coding.display = "Verifier" (exactly)
* agent.who only Reference(Device)
* agent.onBehalfOf 1..1 ?! SU
* agent.onBehalfOf.identifier 1..
* agent.onBehalfOf.identifier.system 1..
* agent.onBehalfOf.identifier.system = #https://gematik.de/fhir/NamingSystem/TelematikID (exactly)
* agent.onBehalfOf.identifier.value 1..
* signature MS
* signature.type.system 1..
* signature.type.system = "urn:iso-astm:E1762-95:2013" (exactly)
* signature.type.code 1..
* signature.type.code = #1.2.840.10065.1.12.1.7 (exactly)
* signature.type.display = "Consent Signature"
* signature.who only Reference
* signature.who ^short = "Who signed - the Bundesdruckrei narcotics authorization service on behalf of BfArM"
* signature.when ?! SU
* signature.onBehalfOf 1..
* signature.onBehalfOf only Reference
* signature.onBehalfOf ^short = "Signature was authorized on behalf of BfArM"
* signature.sigFormat 1..
* signature.sigFormat = #application/pkcs7-mime (exactly)
* signature.data 1.. SU ?!
//
// unusd fields 
//
* occurred[x] ..0
* policy ..0
* location ..0
* reason ..0
* activity ..0
* agent.role ..0

Instance: PractitionersNarcoticsApproval
InstanceOf: GEM_ERP_PR_BfArMApproval
Usage: #example
* id = "64d5081e-8d65-11ec-b909-0242ac120002"
* meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_BfArMApproval|1.2"
* target[+].reference = "Task/160.100.000.000.024.67"
* recorded = "2022-02-14T08:39:24+01:00"
* entity.what.identifier.system = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PrescriptionId" (exactly)
* entity.what.identifier.value = "160.100.000.000.024.67"
* agent.who.reference = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Device/1"
* agent.onBehalfOf.identifier.system = "https://gematik.de/fhir/NamingSystem/TelematikID"
* agent.onBehalfOf.identifier.value = "1-HBA-Testkarte-883110000123465"
* signature.type.system = "urn:iso-astm:E1762-95:2013"
* signature.type.code = #1.2.840.10065.1.12.1.7
* signature.type.display = "Consent Signature"
* signature.when = "2022-02-14T08:39:25+01:00"
* signature.who.reference = "https://www.bundesdruckerei.de/"
* signature.onBehalfOf.reference = "https://www.bfarm.de/"
* signature.sigFormat = #application/pkcs7-mime
* signature.data = "MIII FQYJ KoZI hvcN AQcC oIII BjCC CAIC AQEx DzAN Bglg hkgB ZQME AgEF ADAL"