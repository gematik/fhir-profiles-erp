RuleSet: PackageProfileExactly(profile)
* insert ProfileExactly(https://gematik.de/fhir/erp/{profile}, 1.3)

RuleSet: ProfileExactly(profile, version)
* meta.profile = "{profile}|{version}" (exactly)

RuleSet: PackageProfile(profile)
* insert Profile(https://gematik.de/fhir/erp/{profile}, 1.3)

RuleSet: Profile(profile, version)
* meta.profile[+] = "{profile}|{version}"

RuleSet: PackageProfileTarget(profile)
* insert ProfileTarget(https://gematik.de/fhir/erp/{profile}, 1.3)

RuleSet: ProfileTarget(profile, version)
* targetProfile[+] = "{profile}|{version}"
