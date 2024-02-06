RuleSet: Profile(name)
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/{name}"
* insert Versioning
* meta 1..1
* meta.profile 1..1
* insert PackageMetaProfileExactly(StructureDefinition/{name})
