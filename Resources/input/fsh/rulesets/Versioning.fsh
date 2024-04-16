// General rule for to handle versions for all structure definitions
RuleSet: Versioning
* ^status = #draft
* ^version = "1.3"
* ^date = "2024-04-16"

RuleSet: OperationVersioning
* status = #draft
* version = "1.3"
* date = "2024-04-16"

// Rules to set meta.profile in profiles and instances
RuleSet: PackageMetaProfileExactly(profile)
* insert MetaProfileExactly(https://gematik.de/fhir/erp/{profile}, 1.3)

RuleSet: MetaProfileExactly(profile, version)
* meta.profile = "{profile}|{version}" (exactly)

RuleSet: PackageMetaProfile(profile)
* insert MetaProfile(https://gematik.de/fhir/erp/{profile}, 1.3)

RuleSet: MetaProfile(profile, version)
* meta.profile[+] = "{profile}|{version}"


// Rules to set targetProfiles for operations parameters
RuleSet: PackageTargetProfile(profile)
* insert TargetProfile(https://gematik.de/fhir/erp/{profile}, 1.3)

RuleSet: TargetProfile(profile, version)
* targetProfile[+] = "{profile}|{version}"


// External Profiles
RuleSet: TargetProfileMedicationDispense
* insert TargetProfile(http://hl7.org/fhir/StructureDefinition/MedicationDispense, 1.3)

RuleSet: ProfileKbvMedicationPzn
* insert MetaProfile(https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN, 1.1.0)
