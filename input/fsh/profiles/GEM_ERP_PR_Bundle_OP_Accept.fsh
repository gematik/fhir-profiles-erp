Profile: GEM_ERP_PR_Bundle_OP_Accept
Parent: Bundle
Id: GEM-ERP-PR-Bundle-OP-Accept
* insert StructureDefinition(GEM_ERP_PR_Bundle_OP_Accept)

* type = #collection (exactly)
* entry 2..2
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry ^slicing.description = "The Task and the QES-Prescription signed Bundle."

* entry contains erxTask 1..1 and erxBinary 1..1

* entry[erxTask].resource only GEM_ERP_PR_Task
* entry[erxBinary].resource only GEM_ERP_PR_Binary