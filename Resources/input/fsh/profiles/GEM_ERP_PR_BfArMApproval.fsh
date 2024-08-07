Profile: GEM_ERP_PR_BfArMApproval
Parent: Provenance
Id: GEM-ERP-PR-BfArMApproval
Title: "BfArM Approval of admissibility for doctor s prescription of narcotics"
Description: "On serverside validton of prescription (QES, FHIR-validity, etc.) the eprescription server requests authorization for narcotics within the doctor s quota. If approved, the server returns a signed Provenance for documentation purpose"
* insert Profile(GEM_ERP_PR_BfArMApproval)
* id 1..
* meta.lastUpdated MS
* target 1..1 SU
* target ^slicing.discriminator.type = #type
* target ^slicing.discriminator.path = "$this"
* target ^slicing.description = "This Provenance targets the ePrescription workflow item Task and the ePrescroption as a whole"
* target ^slicing.rules = #closed
* target contains
    TaskReference 1..1
* target[TaskReference] only Reference(GEM_ERP_PR_Task)
* target[TaskReference] ^short = "Reference to the ePrescription Task"
* recorded SU
* entity 1..1
* entity.role = #source
//* entity.what.identifier.system 1..
//* entity.what.identifier.system = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PrescriptionId" (exactly)
//* entity.what.identifier.value 1..
* entity.what.identifier only GEM_ERP_PR_PrescriptionId
* entity.what ^short = "ePrescription Identifier bindng all related documents together (prescription,dispensato data receipt, etc.)"
* agent 1..1
* agent.type. 1..
* agent.type.coding 1..1
* agent.type.coding.system 1..
//* agent.type.coding.system = "http://terminology.hl7.org/CodeSystem/contractsignertypecodes" (exactly)
* agent.type.coding.system = "http://terminology.hl7.org/CodeSystem/provenance-participant-type" (exactly)
* agent.type.coding.code 1..
//* agent.type.coding.code = #VERF (exactly)
* agent.type.coding.code = #verifier (exactly)
* agent.type.coding.display = "Verifier" (exactly)
* agent.who only Reference(Device)
* agent.onBehalfOf 1..1
* agent.onBehalfOf.identifier 1..
//* agent.onBehalfOf.identifier.system 1..
//* agent.onBehalfOf.identifier.system = #IdentifierTelematikId (exactly)
//* agent.onBehalfOf.identifier.value 1..
* agent.onBehalfOf.identifier only IdentifierTelematikId
* signature MS
* signature.type.system 1..
* signature.type.system = "urn:iso-astm:E1762-95:2013" (exactly)
* signature.type.code 1..
* signature.type.code = #1.2.840.10065.1.12.1.7 (exactly)
* signature.type.display = "Consent Signature"
* signature.who only Reference
* signature.who ^short = "Who signed - the Bundesdruckrei narcotics authorization service on behalf of BfArM"
* signature.when SU
* signature.onBehalfOf 1..
* signature.onBehalfOf only Reference
* signature.onBehalfOf ^short = "Signature was authorized on behalf of BfArM"
* signature.sigFormat 1..
* signature.sigFormat = #application/pkcs7-mime (exactly)
* signature.data 1..
//
// unusd fields
//
* meta.extension ..0
* meta.security ..0
* meta.source ..0
* meta.tag ..0
* meta.versionId ..0
* occurred[x] ..0
* policy ..0
* location ..0
* reason ..0
* activity ..0
* agent.role ..0
