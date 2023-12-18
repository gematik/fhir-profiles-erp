Extension: GEM_ERP_EX_SupplyOptionsType
Id: GEM-ERP-EX-SupplyOptionsType
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_SupplyOptionsType"
* ^version = "1.2"
* ^status = #active
* ^context.type = #element
* ^context.expression = "Communication.payload"
* . ^short = "Options for preferred or offered supply channels"
* . ^comment = "Both patient and pharmacy can state their supply options or offers for the dispensation of medication"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #closed
* extension contains
    delivery 1..1 and
    onPremise 1..1 and
    shipment 1..1
* extension[onPremise] ^short = "dispensation is offered/preferred on premise"
* extension[onPremise] ^definition = "Patient or pharmacy may state their preferred or offered supply option to pick up medications on Premise"
* extension[onPremise].value[x] only boolean
* extension[onPremise].value[x] N
* extension[onPremise].value[x] ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-normative-version].valueCode = #4.0.0
* extension[onPremise].value[x] ^short = "true = pick up on premise accepted/offered"
* extension[delivery] ^short = "dispensation is offered/preferred by messenger"
* extension[delivery] ^definition = "Patient or pharmacy may state their preferred or offered supply option to deliver medication by messenger"
* extension[delivery].value[x] only boolean
* extension[delivery].value[x] N
* extension[delivery].value[x] ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-normative-version].valueCode = #4.0.0
* extension[delivery].value[x] ^short = "true = delivery by messenger accepted/offered"
* extension[shipment] ^short = "dispensation is offered/preferred by shipment"
* extension[shipment] ^definition = "Patient or pharmacy may state their preferred or offered supply option to ship medication via parcel shipping"
* extension[shipment].value[x] only boolean
* extension[shipment].value[x] N
* extension[shipment].value[x] ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-normative-version].valueCode = #4.0.0
* extension[shipment].value[x] ^short = "true = parcel shipping accepted/offered"