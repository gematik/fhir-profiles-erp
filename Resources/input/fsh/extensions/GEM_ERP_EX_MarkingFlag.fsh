Extension: MarkingFlag
Id: 4a695088-8a69-11ec-a8a3-0242ac120002
* ^url = "https://gematik.de/fhir/StructureDefinition/MarkingFlag"
* ^version = "1.1.1"
* ^status = #draft
* ^context.type = #element
* ^context.expression = "ChargeItem"
* . ..1
* . ^short = "Options for submitted ChargeItem"
* . ^definition = "Optional Extension for ChargeItem-Ressources in eRx workflow"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    insuranceProvider 1..1 and
    subsidy 1..1 and
    taxOffice 1..1
* extension[insuranceProvider] ^short = "submitted to health insurance provider"
* extension[insuranceProvider] ^definition = "Patient submitted their ChargeItem to his health insurance provider."
* extension[insuranceProvider].value[x] only boolean
* extension[insuranceProvider].value[x] N
* extension[insuranceProvider].value[x] ^extension[1].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-normative-version"
* extension[insuranceProvider].value[x] ^extension[=].valueCode = #4.0.0
* extension[insuranceProvider].value[x] ^short = "true = submitted to insurance provider"
* extension[subsidy] ^short = "submitted to aid organization ('Beihilfe')"
* extension[subsidy] ^definition = "Patient submitted their ChargeItem to the aid organization ('Beihilfe')."
* extension[subsidy].value[x] only boolean
* extension[subsidy].value[x] N
* extension[subsidy].value[x] ^extension[1].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-normative-version"
* extension[subsidy].value[x] ^extension[=].valueCode = #4.0.0
* extension[subsidy].value[x] ^short = "true = submitted to aid organization"
* extension[taxOffice] ^short = "submitted to tax office"
* extension[taxOffice] ^definition = "Patient submitted their ChargeItem to the tax office."
* extension[taxOffice].value[x] only boolean
* extension[taxOffice].value[x] N
* extension[taxOffice].value[x] ^extension[1].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-normative-version"
* extension[taxOffice].value[x] ^extension[=].valueCode = #4.0.0
* extension[taxOffice].value[x] ^short = "true = submitted to tax office"