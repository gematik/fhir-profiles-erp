Profile: Gem_erxAcceptOperationOutParameters
Parent: Parameters
Id: GEM-ERP-PAR-OUT-OP-Accept
* ^url = "https://gematik.de/fhir/StructureDefinition/ErxAcceptOperationOutParameters"
* ^version = "1.1.1"
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
* parameter[erxTask].resource only Gem_erxTask
* parameter[erxTask].part ..0
* parameter[erxBinary].name = "erxBinary" (exactly)
* parameter[erxBinary].value[x] ..0
* parameter[erxBinary].resource 1..
* parameter[erxBinary].resource only Gem_erxComposition
* parameter[erxBinary].part ..0