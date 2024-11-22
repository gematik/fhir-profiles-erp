RuleSet: Profile(name)
* insert StructureDefinition({name})
* meta 1..1
* meta.profile 1..1
* insert PackageMetaProfileExactly(StructureDefinition/{name})

RuleSet: ProfileMetaSliced(name, sliceName)
* insert StructureDefinition({name})
* meta 1..1
  * profile 1..*
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "value"
    * ^slicing.rules = #open
    * ^slicing.description = "Slicing for profiles"
    * ^slicing.ordered = false

  * profile contains {sliceName} 1..1
  * insert PackageMetaProfileSliceExactly(StructureDefinition/{name}, profile[{sliceName}])