Profile: ErxChargeItem
Parent: ChargeItem
Id: ErxChargeItem
* ^url = "https://gematik.de/fhir/StructureDefinition/ErxChargeItem"
* ^version = "1.1.1"
* ^status = #draft
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0
* extension contains MarkingFlag named markingFlag 0..* MS
* extension[markingFlag] ^min = 0
* identifier only Gem_erxPrescriptionID
* identifier MS
* status MS
* code MS
* code.coding.system = "http://terminology.hl7.org/CodeSystem/data-absent-reason" (exactly)
* code.coding.code = #not-applicable (exactly)
* subject MS
* subject.identifier 1..
* subject.identifier only $identifier-kvid-10
* enterer 1.. MS
* enterer.identifier 1..
* enterer.identifier only Gem_baseTelematikID
* enteredDate 1.. MS
* supportingInformation MS
* supportingInformation ^slicing.discriminator.type = #value
* supportingInformation ^slicing.discriminator.path = "type"
* supportingInformation ^slicing.rules = #open
* supportingInformation contains
    prescriptionItem 0..* and
    dispenseItem 0..* and
    receipt 0..*
* supportingInformation[prescriptionItem] ^definition = "In analogie zu Task.inputwird die Patientenkopie der Verordnung als Bundle gespeichert und trägt in Bundle.signature die Verordnungs-Signatur im JWS-detached Format."
* supportingInformation[prescriptionItem].type = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle" (exactly)
* supportingInformation[dispenseItem].type = "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-PKV-PR-ERP-AbgabedatenBundle" (exactly)
* supportingInformation[receipt] ^definition = "In analogie zu Task.output wird die Quittung als Bundle gespeichert und trägt in Bundle.signature die Quittungs-Signatur im CAdES-enveloping Format [RFC 5652]."
* supportingInformation[receipt].type = "https://gematik.de/fhir/StructureDefinition/ErxReceipt" (exactly)