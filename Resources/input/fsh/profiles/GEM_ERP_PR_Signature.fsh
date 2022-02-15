Profile: Gem_erxSignature
Parent: Signature
Id: GEM-ERP-PR-Signature
Title: "Profile for Signature of Bundles in ePrescription Context"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/ErxSignature"
* ^version = "1.2"
* ^status = #draft
* ^date = "2020-06-02"
* type ..1 MS
* type ^slicing.discriminator.type = #value
* type ^slicing.discriminator.path = "code"
* type ^slicing.rules = #open
* type ^binding.strength = #required
* type contains
    AuthorsSignature 0..1 and
    VerificationSignature 0..1
* type[AuthorsSignature].system = "urn:iso-astm:E1762-95:2013" (exactly)
* type[AuthorsSignature].code = #1.2.840.10065.1.12.1.1 (exactly)
* type[VerificationSignature].system = "urn:iso-astm:E1762-95:2013" (exactly)
* type[VerificationSignature].code = #1.2.840.10065.1.12.1.5 (exactly)
* when MS
* who only Reference(Gem_erxDevice)
* who MS
* who.reference 1.. MS
* sigFormat 1.. MS
* data 1.. MS