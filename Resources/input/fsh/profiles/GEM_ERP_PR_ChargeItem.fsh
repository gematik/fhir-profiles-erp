Profile: GEM_ERP_PR_ChargeItem
Parent: ChargeItem
Id: GEM-ERP-PR-ChargeItem
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_ChargeItem"
* ^version = "1.2"
* ^status = #draft
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #closed
* extension ^min = 0
* extension contains GEM_ERP_EX_MarkingFlag named markingFlag 0..* MS
* extension[markingFlag] ^min = 0
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.description = "The task ressource contains three identifier. The first one is the identifier for the ask representing one e-prescription. The other identifier are representing the patient as owner of the prescription. One is the \"Krankenversichertennummer\" wich identify each patient by his health insurance company and the other is \"Institutionskennzeichen\"."
* identifier ^slicing.rules = #closed
* identifier contains
    PrescriptionID 1..1 and
    AccessCode 0..1 and
* identifier[PrescriptionID] only GEM_ERP_PR_PrescriptionId
* identifier[PrescriptionID] ^short = "Prescription Identifier"
* identifier[PrescriptionID] ^definition = "The prescription identifier is the main identifier for all the ePrecscription related ressources and the whole prescription workflow. This identifier is genereted by the \"E-Rezept Fachdienst\" and must not be changed manually."
* identifier[AccessCode] ^short = "AccessCode Identifier"
* identifier[AccessCode] ^definition = "Generated by the \"E-Rezept Fachdienst\". This identifier grants access to others than the patient."
* identifier[AccessCode].system 1..
* identifier[AccessCode].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode" (exactly)
* identifier[AccessCode].value 1..
* status MS
* code MS
* code.coding.system = "http://terminology.hl7.org/CodeSystem/data-absent-reason" (exactly)
* code.coding.code = #not-applicable (exactly)
* subject MS
* subject.identifier 1..
* subject.identifier only $identifier-kvid-10
* enterer 1.. MS
* enterer.identifier 1..
* enterer.identifier only GEM_ERP_PR_TelematikId
* enteredDate 1.. MS
* supportingInformation MS
* supportingInformation ^slicing.discriminator.type = #value
* supportingInformation ^slicing.discriminator.path = "type"
* supportingInformation ^slicing.rules = #closed
* supportingInformation contains
    prescriptionItem 0..* and
    dispenseItem 0..* and
    receipt 0..*
* supportingInformation[prescriptionItem] ^definition = "In analogie zu Task.inputwird die Patientenkopie der Verordnung als Bundle gespeichert und trägt in Bundle.signature die Verordnungs-Signatur im JWS-detached Format."
* supportingInformation[prescriptionItem].type = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle" (exactly)
* supportingInformation[dispenseItem].type = "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-PKV-PR-ERP-AbgabedatenBundle" (exactly)
* supportingInformation[receipt] ^definition = "In analogie zu Task.output wird die Quittung als Bundle gespeichert und trägt in Bundle.signature die Quittungs-Signatur im CAdES-enveloping Format [RFC 5652]."
* supportingInformation[receipt].type = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle" (exactly)
