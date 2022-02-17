Profile: GEM_ERP_PAR_OUT_OP_Accept
Parent: Parameters
Id: GEM-ERP-PAR-OUT-OP-Accept
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PAR_OUT_OP_Accept"
* ^version = "1.2"
* ^status = #draft
* parameter ..2
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed
* parameter contains
    erxTask 1..1 and
    erxBinary 1..1
* parameter[erxTask].name = "erxTask" (exactly)
* parameter[erxTask].value[x] ..0
* parameter[erxTask].resource 1..
* parameter[erxTask].resource only GEM_ERP_PR_Task
* parameter[erxTask].part ..0
* parameter[erxBinary].name = "erxBinary" (exactly)
* parameter[erxBinary].value[x] ..0
* parameter[erxBinary].resource 1..
* parameter[erxBinary].resource only GEM_ERP_PR_Composition
* parameter[erxBinary].part ..0