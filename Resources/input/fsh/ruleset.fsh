RuleSet: MetaIdentifier (profileName)
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/{profileName}"
* ^version = "1.3"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.gematik.de"
* ^copyright = "gematik GmbH"

RuleSet: Meta (profileName)
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/{profileName}"
* ^version = "1.3"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.gematik.de"
* ^copyright = "gematik GmbH"
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/{profileName}|1.3" (exactly)


RuleSet: MetaValueSet(profileName)
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erp/ValueSet/{profileName}"
* ^version = "1.3"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.gematik.de"
* ^copyright = "gematik GmbH"

RuleSet: MetaCodeSystem(profileName)
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erp/CodeSystem/{profileName}"
* ^version = "1.3"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.gematik.de"
* ^copyright = "gematik GmbH"
* ^caseSensitive = true
* ^content = #complete

RuleSet: MetaInstance(profileName)
* meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/{profileName}|1.3"