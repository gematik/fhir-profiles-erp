// TODO: Merge with Versioning

Alias: $version = 1.6.1

RuleSet: MetaDate(element)
* {element} = "2025-12-15"


RuleSet: MetaStatus(element)
* {element} = #active


RuleSet: MetaVersion(element)
* {element} = $version


RuleSet: Gematik(element)
* {element} = "gematik GmbH"


RuleSet: MetaCopyright(element)
* {element} = "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0."


RuleSet: MetaContact
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.gematik.de"


RuleSet: Meta
* insert MetaVersion(^version)
* insert MetaStatus(^status)
* insert MetaDate(^date)
* insert Gematik(^publisher)
* insert MetaCopyright(^copyright)
* ^experimental = false


RuleSet: Meta-VS
* insert Meta
* insert MetaContact
* ^experimental = false
* ^immutable = false


RuleSet: Meta-CS
* insert Meta
* insert MetaContact
* ^caseSensitive = true
* ^content = #complete


RuleSet: Meta-Instance
* insert MetaVersion(version)
* insert MetaStatus(status)
* insert Gematik(publisher)
* insert MetaDate(date)


RuleSet: Meta-With-Versioning
* insert Meta
* meta MS
  * versionId MS
  * lastUpdated MS