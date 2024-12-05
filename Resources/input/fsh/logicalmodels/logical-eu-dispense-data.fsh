Logical: GEM_ERP_LOG_EU_DispenseData
Parent: Element
Id: logical-eu-dispense-data
Title: "Dispense Data from EU"
Description: "Logical Information that is Provided by the NCPeH for Dispensing Medication"
* insert StructureDefinition(GEM_ERP_LOG_EU_DispenseData)

* PatientData 1..1 BackboneElement "Patient Data"
  * RegionalNationalHealthIdentifier 0..1 string "If the patient has a regional or national Health Identification. This field is required by some national laws."
    * ^short = "Regional/National Health Identifier"
    * ^definition = "Angabe aus einem der dargestellten CDA Felder wird unter der angegebenen Element ID des FHIR Profils Dispensation of the Prescription (GEM_ERP_PR_MedicationDispense) eingetragen. Als einziges Merkmal zu den PatientInnen soll die KVID eingetragen werden, da hierüber jede gesetzlich versicherte Person eindeutig identifizierbar ist."
    * ^comment = "https://simplifier.net/erezept-workflow/gem_erp_pr_medicationdispense\nMedicationDispense.subject.identifier"

  * SocialInsuranceNumber 0..1 string "If a patient has both Regional/National Health ID and Social/Insurance Number, only the Regional/National Health ID is required by law."
    * ^short = "Social/Insurance Number"
    * ^definition = "Da über die Angabe der Regional/National Health Identifier (KVID) jede Person eindeutig identifizierbar ist, entfällt die Dokumentation weiterer Angaben zur Person."

  * GivenName 1..* string "The first name of the patient. This field can contain more than one element."
    * ^short = "Given Name"
    * ^definition = "The subject's identifying name(s) within the family group or by which the subject is uniquely socially identified [ISO TS 22220]."

  * FamilyNameSurname 1..* string "The surname/s of the patient. This field can contain more than one element."
    * ^short = "Family Name/Surname"
    * ^definition = "The part of a name a person usually has in common with some other members of his/her family, as distinguished from his/her given names [ISO TS 22220]."

  * Gender 0..1 code "The gender of the patient. Gender is the biological distinction between male and female."
    * ^short = "Gender"
    * ^definition = "The gender of the patient may be noted on the prescription since this can be important for gender-specific effects of drugs, contra-indications etc."

* HealthCareProfessionalData 1..1 BackboneElement "HealthCareProfessional Data"
  * PersonalInformation 1..1 BackboneElement "Personal Information"
    * HPIdentifier 0..1 string "The identification of the person as Health Professional."
      * ^short = "HP Identifier"
      * ^definition = "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils NEUES PROFIL - NAME ANPASSEN eingetragen."
      * ^comment = "Entsprechendes FHIR-Profil für Informationen zu HCP aus Country B (Dispenser) wird erstellt. Stark angelehnt an die Strukturen des Profils 'Practitioner in gematik Directory' --> im neu erstellten FHIR Profil Practitioner Coutry B noch die Properties und Eigenschaften gegenchecken!\nPractitioner.identifier:TelematikID,\nPractitioner.identifier:LANR,\nPractitioner.identifier:ZANR"

    * GivenName 1..* string "The name of the HP dispensing the medicine to the patient. This field can contain more than one element."
      * ^short = "Given Name"
      * ^definition = "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils NEUES PROFIL - NAME ANPASSEN eingetragen."
      * ^comment = "ehdsi-dataelement-300 Given Name\nPractitioner.name.given"

    * FamilyNameSurname 1..* string "The surname/s of the HP dispensing the medicine to the patient. This field can contain more than one element."
      * ^short = "Family Name/Surname"
    * ^definition = "Der Nachname der die Medikation abgebenden Person wird aus dem dargestellten CDA Feld unter der angegebenen Element Ids des Profils NEUES PROFIL - NAME ANPASSEN eingetragen. (Achtung: Da aus der EU nur ein Datenfeld kommt, entfallen Sonderfelder für Präfixe und Suffixe)"
    * ^comment = "ehdsi-dataelement-299 Family Name/Surname\nPractitioner.name.family"

  * ProfessionalInformation 1..1 BackboneElement "Professional Information"
    * Profession 1..1 Coding "The profession of the HP prescribing the medicine."
      * ^short = "Profession"
      * ^definition = "The profession of the HP prescribing the medicine. Example: Physician."
      * ^comment = "ehdsi-dataelement-229 Profession mit valueset: http://52.212.185.219/html/publication/epSOS/epsos-html-20240422T073854/voc-1.3.6.1.4.1.12559.11.10.1.3.1.42.1-2020-04-22T155100.html\nPractitioner.qualification:Typ.code.coding.code"

    * MedicalSpecialty 0..1 Coding "The field of practice/specialization of the HP prescribing the medicine."
      * ^short = "Medical Specialty"
    * ^definition = "The field of practice/specialization of the HP prescribing the medicine. Example: Dermatologist."

* OrganizationData 1..1 BackboneElement "Organization Data"
  * FacilityIdentifier 0..1 string "The identification of the facility (pharmacy) from where the HP is dispensing the medicine."
    * ^short = "Facility (Pharmacy) Identifier"
    * ^definition = "Der Identifier des abgebenden Unternehmens wird aus dem angegebenen CDA Feld in die angegebenen Element Id des Profils NEUES PROFIL - NAME ANPASSEN übermittelt. (Achtung wir werden vermutlich im neu erstellten EU Profil sowohl die Möglichkeit einen Facility als auch einen Organisation Identifier abzubilden - FHIR Grundprofil lässt dies zu - Kardinalität Identifier 0..*)"
    * ^comment = "Entsprechendes FHIR-Profil für Informationen zu Organisation aus Country B (Dispensing Organisation) wird erstellt. Stark angelehnt an die Strukturen des Profils Organization in gematik Directory\nMedicationDispense.performer.actor.identifier,\nOrganization.identifier:TelematikID,\nOrganization.identifier:BSNR,\nOrganization.identifier:KZVA,\nOrganization.identifier:IKNR"

  * ContactInfo 0..1 ContactPoint "Contact information for the facility (pharmacy) from where the HP is dispensing the medicine."
    * ^short = "Contact Info"
    
    * Telephone 0..1 string "The telephone number of the place from where the HP is dispensing the medicine."
      * ^short = "Telephone"
      * ^definition = "The phone number of the place where the HP prescribing the medicine made the prescription. Example: +34 954123123"
      * ^comment = "ehdsi-dataelement-219 Telephone\nOrganization.telecom:phone"

    * Email 0..1 string "The email address of the place from where the HP is dispensing the medicine."
      * ^short = "Email"
      * ^definition = "The contact e-mail of the facility or of the HP prescribing the medicine. Example: losbermejaleshealthcentre@xxx.es"
      * ^comment = "ehdsi-dataelement-218 Email\nOrganization.telecom:email"

  * StreetAddress 0..1 string "The street of the place from where the HP is dispensing the medicine."
    * ^short = "Street address"
    * ^definition = "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils NEUES PROFIL - NAME ANPASSEN eingetragen."
    * ^comment = "ehdsi-dataelement-293 Street address\nOrganization.address.line"

  * City 0..1 string "The city of the place from where the HP is dispensing the medicine."
    * ^short = "City"
    * ^definition = "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils NEUES PROFIL - NAME ANPASSEN eingetragen."
    * ^comment = "ehdsi-dataelement-292 City\nOrganization.address.city"

  * ZipOrPostalCode 0..1 string "The postal code of the place from where the HP is dispensing the medicine."
    * ^short = "Zip or Postal Code"
    * ^definition = "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils NEUES PROFIL - NAME ANPASSEN eingetragen."
    * ^comment = "ehdsi-dataelement-291 Zip or Postal Code\nOrganization.address.postalCode"

  * StateOrProvince 0..1 string "The province of the place from where the HP is dispensing the medicine."
    * ^short = "State or Province"
    * ^definition = "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils NEUES PROFIL - NAME ANPASSEN eingetragen."
    * ^comment = "ehdsi-dataelement-290 State or Province\nOrganization.address.state"

  * Country 0..1 string "The country where the pharmacy is located."
    * ^short = "Country"
    * ^definition = "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils NEUES PROFIL - NAME ANPASSEN eingetragen."
    * ^comment = "ehdsi-dataelement-289 Country\nOrganization.address.country"

  * OrganizationName 1..1 string "The name of the healthcare provider organization of the HP dispensing the medicine."
    * ^short = "Organization Name"
    * ^definition = "Der Name der Organisation, die die Medikation abgibt wird aus dem dargestellten CDA Feld unter der angegebenen Element Ids des Profils NEUES PROFIL - NAME ANPASSEN eingetragen. (Achtung: HL7 Grundprofil lässt nur einen Organisationsnamen zu deshalb diesen und nicht Facility name gewählt)"
    * ^comment = "ehdsi-dataelement-286 Organization Name\nOrganization.name"

  * OrganizationIdentifier 0..1 string "The identification of the healthcare provider organization of the HP dispensing the medicine."
    * ^short = "Organization Identifier"
    * ^definition = "(Achtung wir werden vermutlich im neu erstellten EU Profil sowohl die Möglichkeit einen Facility als auch einen Organisation Identifier abzubilden - FHIR Grundprofil lässt dies zu)"
    * ^comment = "ehdsi-dataelement-285 Organization Identifier\nMedicationDispense.performer.actor.identifier,\nOrganization.identifier:TelematikID,\nOrganization.identifier:BSNR,\nOrganization.identifier:KZVA,\nOrganization.identifier:IKNR"

* DispenseData 1..1 BackboneElement "Dispense Data"
  * AdministrativeInformation 1..1 BackboneElement "Information regarding the dispensation"
  
    * DispensationIdentifier 1..1 string "Identification of the dispensation."
      * ^short = "Dispensation Identifier"
      * ^definition = "Der Dispensation Identifier wird aus dem dargestellten CDA Feld unter der angegebenen Element Ids des Profils Dispensation of the Prescription (GEM_ERP_PR_MedicationDispense) eingetragen."
      * ^comment = "https://simplifier.net/erezept-workflow/gem_erp_pr_medicationdispense\nMedicationDispense.extension:rxPrescriptionProcessIdentifier"

    * PrescriptionIdentifier 0..1 string "Identification of the related prescription (from Country of affiliation) of the dispensed medicine."
      * ^short = "Prescription Identifier"
      * ^definition = "Der Prescription Identifier wird aus dem dargestellten CDA Feld unter der angegebenen Element Ids des Profils Dispensation of the Prescription (GEM_ERP_PR_MedicationDispense) eingetragen. Die im CDA Feld gelieferte Information entspricht dem ursprünglich in Deutschland erstelltem Wert, weshalb sie ohne Probleme konform mit der Formatvorgabe dieses Feldes ist."
      * ^comment = "https://simplifier.net/erezept-workflow/gem_erp_pr_medicationdispense\nMedicationDispense.identifier:prescriptionID"

    * PrescriptionItemIdentifier 0..1 string "Identification of the related prescription item (from Country of affiliation) of the dispensed medicine."
      * ^short = "Prescription Item Identifier"
      * ^definition = "Dieses Feld ist im deutschen Country A Szenario ePrescription/eDispensation nicht notwendig, da deutsche eRezepte immer nur ein Prescription Item pro Verschreibung/Dispensierung beinhalten. Somit kann für eine jede Verordnung, für die im EU-Ausland eine Dispensierung erfolgte, ausschließlich ein Prescription Item enthalten sein."

    * DateOfIssueOfDispensation 1..1 date "Date when the medicine was dispensed."
      * ^short = "Date of issue of the dispensation"
      * ^definition = "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils Dispensation of the Prescription (GEM_ERP_PR_MedicationDispense) eingetragen."
      * ^comment = "https://simplifier.net/erezept-workflow/gem_erp_pr_medicationdispense\nMedicationDispense.whenHandedOver"

    * Substitution 0..1 boolean "It indicates if a substitution was performed in Country of treatment, based on their national legislation."
      * ^short = "Substitution"
      * ^definition = "Wenn im dargestellten CDA Feld übermittelt wird, dass eine Substitution erfolgte, kann diese Information unter der angegebenen Element ID des FHIR Profils Dispensation of the Prescription (GEM_ERP_PR_MedicationDispense) eingetragen werden."
      * ^comment = "https://simplifier.net/erezept-workflow/gem_erp_pr_medicationdispense\nMedicationDispense.substitution.wasSubstituted"

    * NumberOfPackages 1..1 string "Number of boxes that have been dispensed."
      * ^short = "Number of packages"
      * ^definition = "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils Dispensation of the Prescription (GEM_ERP_PR_MedicationDispense) eingetragen."
      * ^comment = "https://simplifier.net/erezept-workflow/gem_erp_pr_medicationdispense\nMedicationDispense.quantity"

  * MedicinalInformation 1..1 BackboneElement "Information regarding the medication of the dispensation"
    * MedicinalProductIdentifier 0..1 string "Identifier of a medicinal product refers to the product inside the package, not the packaged item as such."
      * ^short = "Medicinal Product Identifier"
      * ^definition = "Der Medicinal Product Identifier wird aus dem dargestellten CDA Feld unter der angegebenen Element Ids des Profils Dispensation of the Prescription (GEM_ERP_PR_MedicationDispense) eingetragen. Da im FHIR Profil ein Data-String eingetragen werden darf, kann die übermittelte ISO-IDMP Nummer hier ohne Probleme eingetragen werden. Es ist angestrebt zusätzlich eine textuale Beschreibung abzubilden."
      * ^comment = "https://simplifier.net/erezept-workflow/gem_erp_pr_medication\nMedication.code.text\nHier undbedingt nochmal BfArM interne Rücksprache notwendig! Stichwort Medicinal Product Identifier/Brand Name/ Classification --> ersteres und letzteeres Optional, mittleres Mandatory --> alle drei könnten/sollten in gleiche Element ID in FHIR --> unbedingt wichtig den Brand Name einzufüllen, da diese FHIR Id immer verwendet wird zur Anzeige der Medikation --> eventuell die beiden anderen in String ergänzen falls vorhanden?"

    * MedicinalProductBrandName 1..1 string "The name, which may be either an invented name not liable to confusion with the common name, or a common or scientific name accompanied by a trademark or the name of the marketing authorization holder."
      * ^short = "Medicinal Product Brand Name"
      * ^definition = "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERP_PR_Medication) eingetragen. Die Abbildung dieser Information an dieser Stelle ist immens wichtig, da sie zur Medikationsbeschreibung verwendet werden."
      * ^comment = "https://simplifier.net/erezept-workflow/gem_erp_pr_medication\nMedication.code.text\nHier undbedingt nochmal BfArM interne Rücksprache notwendig! Stichwort Medicinal Product Identifier/Brand Name/ Classification --> ersteres und letzteeres Optional, mittleres Mandatory --> alle drei könnten/sollten in gleiche Element ID in FHIR --> unbedingt wichtig den Brand Name einzufüllen, da diese FHIR Id immer verwendet wird zur Anzeige der Medikation --> eventuell die beiden anderen in String ergänzen falls vorhanden?"

    * MedicinalProductClassification 0..1 string "Standardized code corresponding to the classification of the product."
      * ^short = "Medicinal Product Classification"
      * ^definition = "Siehe roter Vermerk an der Seite."
      * ^comment = "https://simplifier.net/erezept-workflow/gem_erp_pr_medication\nMedication.code.text\nHier undbedingt nochmal BfArM interne Rücksprache notwendig! Stichwort Medicinal Product Identifier/Brand Name/ Classification --> ersteres und letzteeres Optional, mittleres Mandatory --> alle drei könnten/sollten in gleiche Element ID in FHIR --> unbedingt wichtig den Brand Name einzufüllen, da diese FHIR Id immer verwendet wird zur Anzeige der Medikation --> eventuell die beiden anderen in String ergänzen falls vorhanden?"

    * ActiveIngredients 1..1 string "Substance that alone or in combination with one or more other ingredients produces the intended activity of a medicinal product."
      * ^short = "Active Ingredient(s)"
      * ^definition = "In jedem Fall wird die Angabe aus dem dargestellten CDA Feld unter der angegebenen Element ID 'Medication.ingredient.item[x]:itemCodeableConcept.text' des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERP_PR_Medication) als Freitext eingetragen. Handelt es sich um einen WHO-ATC Code kann dieser in Medication.ingredient.item[x]:itemCodeableConcept.coding:atc-de eingetragen werden. Handelt es sich um eine Euro-SRS Nummer, so kann diese über das oben im Zusammenhang der Prescription bereits beschriebene Mapping in eine ASK-Nummer übersetzt werden."
      * ^comment = "https://simplifier.net/erezept-workflow/gem_erp_pr_medication\nMedication.ingredient.item[x]:itemCodeableConcept.text,\nMedication.ingredient.item[x]:itemCodeableConcept.coding:ask,\nMedication.ingredient.item[x]:itemCodeableConcept.coding:atc-de"

    * ActiveIngredientRoles 1..1 string "The role of the active ingredient in the strength calculation."
      * ^short = "Active Ingredient Role(s)"
      * ^definition = "In Deutschland werden grundsätzlich nur solche Inhaltsstoffe in den FHIR Profilen angegeben, die einem Wirkstoff entsprechen."
      * ^comment = "https://simplifier.net/erezept-workflow/gem_erp_pr_medication\nMedication.ingredient.isActive"

    * ActiveIngredientStrengths 0..1 string "The content of the active ingredient expressed quantifiable per dosage unit, per unit of volume or per unit of weight, according to the pharmaceutical dose form."
      * ^short = "Active Ingredient Strength(s)"
      * ^definition = "Angabe aus dem dargestellten CDA Feld kann einerseits unter der angegebenen Element ID des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERP_PR_Medication) eingetragen. Alternativ könnten die Element IDs Medication.ingredient.strength.numerator.code.value und Medication.ingredient.strength.denominator.code.value. in Kombination genutzt werden."
      * ^comment = "https://simplifier.net/erezept-workflow/gem_erp_pr_medication\nMedication.ingredient.strength.extension:amountText.value[x]:valueString,\nMedication.ingredient.strength.numerator.code.value,\nMedication.ingredient.strength.denominator.code.value"

    * PharmaceuticalDoseForm 1..1 string "The form in which a pharmaceutical product is presented (e.g. tablets, syrup)."
      * ^short = "Pharmaceutical Dose Form"
      * ^definition = "Angabe aus dem dargestellten CDA Feld wird auf jeden Fall als Valuestring und somit in Textform unter der angegebenen Element ID Medication.form.text des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERP_PR_Medication) eingetragen. Zusätzlich sollen aus dem CDA Feld erhaltene Informationen über ein EDQM - KBV Darreichungsform Mapping in Medication.form.coding:kbvDarreichungsform eingetragen werden."
      * ^comment = "https://simplifier.net/erezept-workflow/gem_erp_pr_medication\nMedication.form.text,\nMedication.form.coding:kbvDarreichungsform"

    * MedicinalProductPackageDescription 0..1 string "Textual description of the package."
      * ^short = "Medicinal Product Package description"
      * ^definition = "Angabe aus dem dargestellten CDA Feld kann unter der angegebenen Element ID des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERP_PR_Medication) eingetragen werden. Bei Kombipackungen kann über eine Extension im FHIR Profil Medication for the Dispensation of the Prescription (GEM_ERP_PR_Medication) auf das FHIR Profil EPA Pharmaceutical Product Medication und somit verschiedene Anganben im Element ID Medication.extension:packaging abgelegt werden."
      * ^comment = "https://simplifier.net/erezept-workflow/gem_erp_pr_medication\nMedication.extension:packaging,\nhttps://simplifier.net/packages/de.gematik.epa.medication/1.0.3/files/2539781\nFeld nach Beispiel in https://simplifier.net/erezept-workflow/medication-kombipackung erschlossen. Bitte noch einmal gegenprüfen, ob verständlich bzw. beabsichtigte Intention des Feldes erfüllt"

    * MedicinalProductPackageIdentifier 0..1 string "Identifier of a packaged medicinal product refers to a specific pack size of a specific product."
      * ^short = "Medicinal Product Package identifier"
      * ^definition = "Angabe aus dem dargestellten CDA Feld kann unter der angegebenen Element ID des FHIR Profils EPA Pharmaceutical Product Medication eingetragen werden."
      * ^comment = "https://simplifier.net/packages/de.gematik.epa.medication/1.0.3/files/2539781\nMedication.code.coding:product-key\nFeld nach Beispiel in https://simplifier.net/erezept-workflow/medication-kombipackung erschlossen. Bitte noch einmal gegenprüfen, ob verständlich bzw. beabsichtigte Intention des Feldes erfüllt"

    * PackageType 1..1 string "The type of package used for the medicinal product."
      * ^short = "Package type"
      * ^definition = "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERP_PR_Medication) eingetragen."
      * ^comment = "https://simplifier.net/erezept-workflow/gem_erp_pr_medication\nMedication.extension:packaging.value[x]:valueString"

    * PackageSize 1..1 string "Size of the package dispensed in the Country of treatment."
      * ^short = "Package size"
      * ^definition = "Angabe aus dem dargestellten CDA Feld wird unter der angegebenen Element ID des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERP_PR_Medication) eingetragen."
      * ^comment = "https://simplifier.net/erezept-workflow/gem_erp_pr_medication\nMedication.amount.numerator.extension:packagingSize"

    * MarketingAuthorizationHolder 0..1 string "The name of the company or other legal entity that has the authorization to market a medicine in one, several or all European Union Member States."
      * ^short = "Marketing Authorization Holder of the dispensed medicinal product"
      * ^definition = "Wenn im dargestellten CDA Feld eine Information hinterlegt ist, wird diese unter der angegebenen Element ID des FHIR Profils Medication for the Dispensation of the Prescription (GEM_ERP_PR_Medication) eingetragen."
      * ^comment = "https://simplifier.net/erezept-workflow/gem_erp_pr_medication\nMedication.manufacturer.identifier"
