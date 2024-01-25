Profile: GEM_ERP_PR_Signature
Parent: Signature
Id: GEM-ERP-PR-Signature
Title: "Profile for Signature of Bundles in ePrescription Context"
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Signature"
* ^version = "1.3.0"
* ^status = #active
* ^date = "2020-06-02"
* type ..1 MS
* type ^slicing.discriminator.type = #value
* type ^slicing.discriminator.path = "code"
* type ^slicing.rules = #closed
* type ^binding.strength = #required
* type contains
    AuthorsSignature 0..1 and
    VerificationSignature 0..1
* type[AuthorsSignature].system = "urn:iso-astm:E1762-95:2013" (exactly)
* type[AuthorsSignature].code = #1.2.840.10065.1.12.1.1 (exactly)
* type[VerificationSignature].system = "urn:iso-astm:E1762-95:2013" (exactly)
* type[VerificationSignature].code = #1.2.840.10065.1.12.1.5 (exactly)
* when MS
* who only Reference(GEM_ERP_PR_Device)
* who MS
* who.reference 1.. MS
* sigFormat 1.. MS
* data 1.. MS