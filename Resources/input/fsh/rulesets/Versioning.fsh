// General rule for to handle versions for all structure definitions
RuleSet: Versioning
* ^status = #draft
* ^version = "1.4"
* ^date = "2024-07-15"

RuleSet: OperationVersioning
* status = #draft
* version = "1.4"
* date = "2024-07-15"

// Rules to set meta.profile in profiles and instances
RuleSet: PackageMetaProfileExactly(profile)
* insert MetaProfileExactly(https://gematik.de/fhir/erp/{profile}, 1.4)

RuleSet: MetaProfileExactly(profile, version)
* meta.profile = "{profile}|{version}" (exactly)

RuleSet: PackageMetaProfile(profile)
* insert MetaProfile(https://gematik.de/fhir/erp/{profile}, 1.4)

RuleSet: MetaProfile(profile, version)
* meta.profile[+] = "{profile}|{version}"


// Rules to set targetProfiles for operations parameters
RuleSet: PackageTargetProfile(profile)
* insert TargetProfile(https://gematik.de/fhir/erp/{profile}, 1.4)

RuleSet: TargetProfile(profile, version)
* targetProfile[+] = "{profile}|{version}"

