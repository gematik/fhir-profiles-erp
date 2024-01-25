Extension: GEM_ERP_EX_PackageQuantity
Id: GEM-ERP-EX-PackageQuantity
* ^url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PackageQuantity"
* ^version = "1.3.0"
* ^status = #active
* ^context.type = #element
* ^context.expression = "Communication.payload"
* value[x] only Quantity
* value[x].system = "http://unitsofmeasure.org" (exactly)
* value[x].code = #{Package} (exactly)