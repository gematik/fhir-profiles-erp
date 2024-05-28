Profile: GEM_ERP_PR_PrescriptionId
Parent: Identifier
Id: GEM-ERP-PR-PrescriptionId
Title: "Identifier Profile for Prescription IDs"
Description: "The prescriptionID is an generated and not changeable sequence of numbers seperated by dots. The first three numbers define the type of the prescription. The next twelve numbers are the generated unique and consecutive sequence of the prescription. The last two digits are the check numbers according to ISO 7064."
* insert StructureDefinition(GEM_ERP_PR_PrescriptionId)
* . ^definition = "An identifier - identifies some entity uniquely and unambiguously. Typically this is used for business identifiers."
* use = #official (exactly)
* system 1.. MS
* system = $prescription-id-ns
* value 1.. MS
  * ^short = "The identifier for an ePrescription."
  * ^comment = "Datamodel according to gemSpec_DM_eRp"
