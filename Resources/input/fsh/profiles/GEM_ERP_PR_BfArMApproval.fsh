Profile: GEM_ERP_PR_BfArMApproval
Parent: Provenance
Id: GEM-ERP-PR-BfArMApproval
Title: "BfArM Approval of admissibility for doctor s prescription of narcotics"
Description: "On serverside validton of prescription (QES, FHIR-validity, etc.) the eprescription server requests authorization for narcotics within the doctor s quota. If approved, the server returns a signed Provenance for documentation purpose"
* insert Profile(GEM_ERP_PR_BfArMApproval)
* meta.lastUpdated MS
* id 1..

// Rezept-ID
* target 1..1 SU
* target.reference 0..0
* target.type = #Task
* target.identifier only GEM_ERP_PR_PrescriptionId

// Zeitstempel des Operationsaufrufs
* recorded SU

//Aktivität der Provenance
* activity 1..1
* activity.coding 1..1
* activity.coding.system = "http://terminology.hl7.org/CodeSystem/v3-DocumentCompletion" (exactly)
* activity.coding.code = #LA (exactly) //TODO: Klären ob dieser Wert rechtmäßig ist
* activity.coding.display = "legally authenticated"

// Agents
* agent ^slicing.discriminator.type = #value
* agent ^slicing.discriminator.path = "role.coding.code"
* agent ^slicing.rules = #closed
* agent ^slicing.ordered = false
* agent ^slicing.description = "Participating Agents in the Provenance"

* agent 3..3
* agent contains eprescription-server 1..1 and practitioner 1..1 and bfarm-server 1..1

* agent[eprescription-server].role.coding.system = "http://terminology.hl7.org/CodeSystem/extra-security-role-type" (exactly)
* agent[eprescription-server].role.coding.code = #dataprocessor (exactly)
* agent[eprescription-server].role.coding.display =  "Data Processor"
* agent[eprescription-server].who.display 1..1
* agent[eprescription-server].who.display = "E-Rezept-Fachdienst"


* agent[practitioner].role.coding.system = "http://terminology.hl7.org/CodeSystem/v3-ParticipationType" (exactly)
* agent[practitioner].role.coding.code = #AUT (exactly)
* agent[practitioner].role.coding.display = "author (originator)"
// TelematikID des zu autorisierenden LE
* agent[practitioner].who.identifier 1..1
* agent[practitioner].who.identifier only $identifier-telematik-id

* agent[bfarm-server].role.coding.system = "http://terminology.hl7.org/CodeSystem/contractsignertypecodes" (exactly)
* agent[bfarm-server].role.coding.code = #VERF (exactly)
* agent[bfarm-server].who.display 1..1
* agent[bfarm-server].who.display = "BfArM-Prüfdienst"

// Signatur
* signature MS
* signature.type.system 1..1
* signature.type.system = "urn:iso-astm:E1762-95:2013" (exactly)
* signature.type.code 1..1
* signature.type.code = #1.2.840.10065.1.12.1.7 (exactly)
* signature.type.display = "Consent Signature"

* signature.when SU

// Bundesdruckerei als Signierende Instanz
* signature.who.display 1..1 //TODO: Gibt es einen eindeutigen Identifier?
* signature.who.display = "Bundesdruckerei"
* signature.who ^short = "Who signed - the Bundesdruckrei narcotics authorization service on behalf of BfArM"

// Verweis zu BfArM
* signature.onBehalfOf 1..1
* signature.onBehalfOf ^short = "Signature was authorized on behalf of BfArM"
* signature.onBehalfOf.display 1..1
* signature.onBehalfOf.display = "Bundesinstitut für Arzneimittel und Medizinprodukte (BfArM)"

* signature.sigFormat 1..1
* signature.sigFormat = #application/pkcs7-mime (exactly)
* signature.data 1..1

// unused fields  
* meta.extension ..0
* meta.security ..0
* meta.source ..0
* meta.tag ..0
* meta.versionId ..0
* occurred[x] ..0
* policy ..0
* location ..0
* reason ..0

Instance: PractitionersNarcoticsApproval
InstanceOf: GEM_ERP_PR_BfArMApproval
Usage: #example
* id = "64d5081e-8d65-11ec-b909-0242ac120002"
* target.identifier.value = "165.100.000.000.024.67"
* recorded = "2025-02-14T08:39:24+01:00"

* activity.coding.code = #LA
* agent[practitioner].who.identifier.value = "1-HBA-Testkarte-883110000123465"

* signature.type.system = "urn:iso-astm:E1762-95:2013"
* signature.type.code = #1.2.840.10065.1.12.1.7
* signature.type.display = "Consent Signature"
* signature.when = "2025-02-14T08:39:25+01:00"
* signature.who.reference = "https://www.bundesdruckerei.de/"
* signature.onBehalfOf.reference = "https://www.bfarm.de/"
* signature.sigFormat = #application/pkcs7-mime
* signature.data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="