Extension: PackageQuanity
Id: 4a695344-8a69-11ec-a8a3-0242ac120002
* ^url = "https://gematik.de/fhir/StructureDefinition/PackageQuanity"
* ^version = "1.1.1"
* ^status = #draft
* ^context.type = #element
* ^context.expression = "Communication.payload"
* value[x] only Quantity
* value[x].system = "http://unitsofmeasure.org" (exactly)
* value[x].code = #{Package} (exactly)