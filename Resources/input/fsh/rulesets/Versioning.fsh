// General rule for to handle versions for all structure definitions
RuleSet: Versioning
* ^status = #draft
* ^version = "1.5"
* ^date = "2025-01-01"

RuleSet: OperationVersioning
* status = #draft
* version = "1.5"
* date = "2025-01-01"

// Dates for Examples (Date of actual release)
RuleSet: Date(field)
* {field} = "2025-10-01"

RuleSet: DateTime(field)
* {field} = "2025-10-01T15:29:00+00:00"

RuleSet: DateTimeStamp(field)
* {field} = "2025-10-01T15:29:00.434+00:00"

// Rules to set meta.profile in profiles and instances
RuleSet: PackageMetaProfileExactly(profile)
* insert MetaProfileExactly(https://gematik.de/fhir/erp/{profile}, 1.5)

RuleSet: MetaProfileExactly(profile, version)
* meta.profile[workflowProfile] = "{profile}|{version}" (exactly)

// Rules to set meta.profile in slices
RuleSet: PackageMetaProfileSliceExactly(profile, slice)
* insert MetaProfileSliceExactly(https://gematik.de/fhir/erp/{profile}, 1.5, {slice})

RuleSet: MetaProfileSliceExactly(profile, version, slice)
* meta.profile[{slice}] = "{profile}|{version}" (exactly)


// Rules to set meta.profile in profiles and instances
RuleSet: PackageMetaProfile(profile)
* insert MetaProfile(https://gematik.de/fhir/erp/{profile}, 1.5)

RuleSet: MetaProfile(profile, version)
* meta.profile[workflowProfile] = "{profile}|{version}"


// Rules to set targetProfiles for operations parameters
RuleSet: PackageTargetProfile(profile)
* insert TargetProfile(https://gematik.de/fhir/erp/{profile}, 1.5)

RuleSet: TargetProfile(profile, version)
* targetProfile[+] = "{profile}|{version}"

