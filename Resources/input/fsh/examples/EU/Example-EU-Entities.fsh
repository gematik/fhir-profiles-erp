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