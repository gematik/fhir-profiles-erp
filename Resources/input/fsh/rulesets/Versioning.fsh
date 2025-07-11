// General rule for to handle versions for all structure definitions
RuleSet: Versioning
* ^status = #active
* ^version = "1.5.2"
* ^date = "2025-06-23"

RuleSet: OperationVersioning
* status = #active
* version = "1.5.2"
* date = "2025-06-23"

// Dates for Examples (Date of actual release)
RuleSet: Date(field)
* {field} = "2025-10-01"

RuleSet: DateTime(field)
* {field} = "2025-10-01T15:29:00+00:00"

RuleSet: DateTimeStamp(field)
* {field} = "2025-10-01T15:29:00.434+00:00"

RuleSet: DateTimeStampPlus1Hr(field)
* {field} = "2025-10-01T16:44:00.434+00:00"

// Rules to set meta.profile in profiles and instances
RuleSet: PackageMetaProfileExactly(profile)
* meta.profile[workflowProfile] = "https://gematik.de/fhir/erp/{profile}|1.5" (exactly)
