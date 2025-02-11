RuleSet: Profile(name)
* insert StructureDefinition({name})

* meta 1..1 MS
* meta.profile 1..* MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #openAtEnd
  * ^slicing.description = "Slicing for meta profile"
  * ^slicing.ordered = false

* meta.profile contains workflowProfile 1..1 MS

* insert PackageMetaProfileExactly(StructureDefinition/{name})
