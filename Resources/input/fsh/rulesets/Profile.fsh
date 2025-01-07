RuleSet: Profile(name)
* insert StructureDefinition({name})
* meta 1..1
* meta.profile 1..1
* insert PackageMetaProfileExactly(StructureDefinition/{name})