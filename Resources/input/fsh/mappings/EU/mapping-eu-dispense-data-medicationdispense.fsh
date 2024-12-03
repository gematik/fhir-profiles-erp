Mapping: GEM_ERP_MAP_EU_Dispense_Data_MedicationDispense
Source: GEM_ERP_LOG_EU_DispenseData
Target: "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense_EU"
Id: GEM-ERP-MAP-MedicationDispense-Data-MedicationDispense
Title: "Mapping for EU DispenseData to EU-MedicationDispense"
Description: "This mapping maps the logical information of the EU DispenseData to the EU-MedicationDispense"
* DispenseData -> "GEM_ERP_PR_MedicationDispense_EU"
  * AdministrativeInformation -> "GEM_ERP_PR_MedicationDispense_EU"
    * DispensationIdentifier -> "MedicationDispense.id"
    * PrescriptionIdentifier -> "MedicationDispense.identifier[prescriptionID]"
    * PrescriptionItemIdentifier -> "n/a"
    * DateOfIssueOfDispensation -> "MedicationDispense.whenHandedOver"
    * Substitution -> "MedicationDispense.substitution.wasSubstituted"
    * NumberOfPackages -> "MedicationDispense.quantity"

Mapping: GEM_ERP_MAP_EU_Dispense_Data_Medication
Source: GEM_ERP_LOG_EU_DispenseData
Target: "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Medication"
Id: GEM-ERP-MAP-MedicationDispense-Data-Medication
Title: "Mapping for EU MedicationData to GEM_ERP_PR_Medication"
Description: "This mapping maps the logical information of the EU MedicationData to GEM_ERP_PR_Medication"
* DispenseData -> "GEM_ERP_PR_MedicationDispense_EU"
  * MedicinalInformation -> "GEM_ERP_PR_MedicationDispense_EU.medicationReference"
    * MedicinalProductIdentifier -> "Medication.coding:[atc-de|ask|snomed]"
    * MedicinalProductBrandName -> "Medicatio.code.text"
    * MedicinalProductClassification -> "Medication.???"
    * ActiveIngredients -> "Medication.ingredient.item[x]:itemCodeableConcept"
    * ActiveIngredientRoles -> "Medication.ingredient.isActive"
    * ActiveIngredientStrengths -> "Medication.ingredient.strength"
    * PharmaceuticalDoseForm -> "Medication.form.text, Medication.form.coding:kbvDarreichungsform"
    * MedicinalProductPackageDescription -> "Medication.extension:packaging"
    * MedicinalProductPackageIdentifier -> "Medication.ingredient.itemReference(EPAMedicationPharmaceuticalProduct.code.coding:product-key)"
    * PackageType -> "Medication.extension:packaging.value[x]:valueString"
    * PackageSize -> "Medication.amount.numerator.extension:packagingSize"
    * MarketingAuthorizationHolder -> "Medication.manufacturer.identifier"