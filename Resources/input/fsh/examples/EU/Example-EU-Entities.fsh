Instance: Example-EU-Practitioner
InstanceOf: GEM_ERP_PR_Practitioner_EU
Usage: #example
Title: "Example-EU-Practitioner"
Description: "Example of an EU Practitioner"
* identifier[ehdsi].value = "1234567890"
* name.family = "Sanches"
* name.given = "Pedro"

Instance: Example-EU-Organization
InstanceOf: GEM_ERP_PR_Organization_EU
Usage: #example
Title: "Example-EU-Organization"
Description: "Example of an EU Organization"
* identifier[ehdsi].value = "1234567890"
* identifier[facilityId].value = "136ad69f"
* name = "Pharmacia de Santa Maria"
* type.coding = $cs-organization-profession-oid#1.2.276.0.76.4.54 "Öffentliche Apotheke"
* address
  * line = "Rua da Alegria, 123"
  * city = "Lisbon"
  * country = "Portugal"

Instance: Example-EU-PractitionerRole
InstanceOf: GEM_ERP_PR_PractitionerRole_EU
Usage: #example
Title: "Example-EU-PractitionerRole"
Description: "Example of an EU PractitionerRole"
* practitioner = Reference(Example-EU-Practitioner)
* organization = Reference(Example-EU-Organization)
* code.coding = urn:oid:2.16.840.1.113883.2.9.6.2.7#2262 "Pharmacist"
* specialty.text = "Onkology"