Profile: Gem_erxPrescriptionID
Parent: Identifier
Id: 19196b30-8a69-11ec-a8a3-0242ac120002
Title: "Identifier Profile for Prescription IDs"
Description: "The prescriptionID is an generated and not changeable sequence of numbers seperated by dots. The first three numbers define the type of the prescription. The next twelve numbers are the generated unique and consecutive sequence of the prescription. The last two digits are the check numbers according to ISO 7064."
* ^url = "https://gematik.de/fhir/StructureDefinition/ErxPrescriptionID"
* ^version = "1.1.1"
* ^status = #draft
* ^date = "2020-04-16T14:44:44.4851338+00:00"
* . ^definition = "An identifier - identifies some entity uniquely and unambiguously. Typically this is used for business identifiers."
* use = #official (exactly)
* system 1.. MS
* system = "https://gematik.de/fhir/NamingSystem/PrescriptionID" (exactly)
* value 1.. MS