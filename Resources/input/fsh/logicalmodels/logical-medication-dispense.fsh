Logical: GEM_ERP_LOG_MedicationDispense
Parent: Element
Id: logMedDispense
Title: "Logical Medication Dispense"
Description: "Fachliches Modell zur Beschreibung der Informationen, die bei $close und $dispense in der MedicationDispense-Ressource übermittelt werden."
* insert Versioning
* prescriptionId 1..1 string "ID des Rezepts"
* status 1..1 code "Status fixedValue: #completed"
* medication 1..1 BackboneElement "Medikation"
  * profilInformation 1..* Meta "Profilinformationen aus meta.profile"
  * medicationArzneimittel 0..1 BackboneElement "Medikation als contained Element"
    * extension 0..* Extension "Erweiterungen"
      * impfung 1..1 boolean "Angabe ob Impfstoff nach KBV_EX_ERP_Medication_Vaccine"
      * arzneimittelkategorie 1..1 code "Arzneimittelkategorie aus KBV_EX_ERP_Medication_Category"
      * kategorie 0..1 string "Angabe zur Kategorie"
        * ^comment = "Muss angegeben werden, wenn vorhanden"
      * normgroesse 0..1 code "Angabe der Normgröße nach KBV_VS_SFHIR_KBV_NORMGROESSE"
        * ^comment = "Muss angegeben werden, wenn vorhanden"
      * herstellungsanweisung 0..1 string "Herstellungsanweisung"
        * ^comment = "Muss angegeben werden, wenn vorhanden"
      * verpackung 0..1 string "Angabe zur Verpackung"
        * ^comment = "Muss angegeben werden, wenn vorhanden"

    * code 1..1 CodeableConcept "Information und Identifizierung zum Arzneimittel"
      * pzn 0..1 Coding "PZN"
        * code 1..1 code "PZN-Code"
        * display 0..1 string "PZN-Name"
          * ^comment = "Muss angegeben werden, wenn vorhanden"
      * atcDe 0..1 Coding "atc-de"
        * code 1..1 code "atc-de-Code"
        * display 0..1 string "atc-de-Name"
          * ^comment = "Muss angegeben werden, wenn vorhanden"
      * ask 0..1 Coding "ask"
        * code 1..1 code "ask-Code"
        * display 0..1 string "ask-Name"
          * ^comment = "Muss angegeben werden, wenn vorhanden"
      * wg14 0..1 Coding "wg14"
        * code 1..1 code "wg14-Code"
        * display 0..1 string "wg14-Name"
          * ^comment = "Muss angegeben werden, wenn vorhanden"
      * snomed 0..1 Coding "snomed"
        * code 1..1 code "snomed-Code"
        * display 0..1 string "snomed-Name"
          * ^comment = "Muss angegeben werden, wenn vorhanden"
      * text 0..1 string "Name des Arzneimittels"

    * form 0..1 CodeableConcept "Darreichungsform"
      * edqm 0..1 Coding "edqm"
        * code 1..1 code "edqm-Code"
        * display 0..1 string "edqm-Name"
          * ^comment = "Muss angegeben werden, wenn vorhanden"
      * snomed 0..1 Coding "snomed"
        * code 1..1 code "snomed-Code"
        * display 0..1 string "snomed-Name"
          * ^comment = "Muss angegeben werden, wenn vorhanden"
      * kbvDarreichungsform 0..1 Coding "kbvDarreichungsform"
        * code 1..1 code "kbvDarreichungsform-Code"
        * display 0..1 string "kbvDarreichungsform-Name"
          * ^comment = "Muss angegeben werden, wenn vorhanden"
      * text 0..1 string "Name der Darreichungsform"

    * menge 0..1 Quantity "Verordnete Menge des Arzneimittels"
      * ^comment = "Muss angegeben werden, wenn vorhanden"

    * inhaltsstoffe 0..* BackboneElement "Inhaltsstoffe"
      * extension 0..* Extension "Erweiterungen"
        * darreichungsform 0..1 Coding "Darreichungsform"
      * inhaltsstoff 0..1 BackboneElement "Inhaltsstoff"
        * inhaltsstoffCoding 0..1 CodeableConcept "Kodierung des Inhaltsstoffs"
          * pzn 0..1 Coding "PZN"
            * code 1..1 code "PZN-Code"
            * display 0..1 string "PZN-Name"
              * ^comment = "Muss angegeben werden, wenn vorhanden"
          * atcDe 0..1 Coding "atc-de"
            * code 1..1 code "atc-de-Code"
            * display 0..1 string "atc-de-Name"
              * ^comment = "Muss angegeben werden, wenn vorhanden"
          * ask 0..1 Coding "ask"
            * code 1..1 code "ask-Code"
            * display 0..1 string "ask-Name"
              * ^comment = "Muss angegeben werden, wenn vorhanden"
          * wg14 0..1 Coding "wg14"
            * code 1..1 code "wg14-Code"
            * display 0..1 string "wg14-Name"
              * ^comment = "Muss angegeben werden, wenn vorhanden"
          * snomed 0..1 Coding "snomed"
            * code 1..1 code "snomed-Code"
            * display 0..1 string "snomed-Name"
              * ^comment = "Muss angegeben werden, wenn vorhanden"
        * inhaltsstoffReference 0..1 Reference "Referenz zum Inhaltsstoff"
      * wirkstaerke 0..1 Ratio "Wirkstärke des Inhaltsstoffes"

      * menge 0..1 Quantity "Menge des Inhaltsstoffes"
      * einheit 0..1 string "Einheit der Menge des Inhaltsstoffes"

    * chargenInformation 0..1 BackboneElement "Chargeninformation"
      * ^comment = "Da die ePA Medication nur bei der Abgabe verwendet wird ist die Angabe der Chargeninformation verpflichtend."
      * chargennummer 0..1 string "Chargennummer"
      * ablaufdatum 0..1 dateTime "Ablaufdatum der Charge"
    * darreichungsform 0..1 Coding "Darreichungsform"
  * medicationDiGA 0..1 Reference "Angabe der Medikation bei DiGA Verordnung"
    * display 1..1 string "Name der verordneten DiGA"

* patientKVNR 1..1 string "KVNR des Patienten"
* angabeAbgebendeInstutition 1..1 identifier "Telematik-ID der abgebenden Institution"
* menge 0..1 Quantity "Abgegebene Menge des Arzneimittels."
  * ^comment = "Muss angegeben werden, wenn vorhanden"
* abgabeDatum 1..1 dateTime "Abgabedatum im Format YYYY-MM-DD"
* dosieranweisung 0..1 string "Dosieranweisung,"
  * ^comment = "Muss angegeben werden, wenn vorhanden"
* verweisZumTask 0..1 Reference "Verweis auf den Task, der die Abgabe enthält. Wird vom E-Rezept-Fachdienst gesetzt."
* substituierung 0..1 BackboneElement "Substituierung"
  * wurdeSubstituiert 1..1 boolean "Angabe, ob substituiert wurde"
* abgabeHinweise 0..* Annotation "Hinweise zur Abgabe, wenn vorhanden"

