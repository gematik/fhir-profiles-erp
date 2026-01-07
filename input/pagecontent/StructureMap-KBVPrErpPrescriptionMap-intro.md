### Feld-Mappings

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.authoredOn` | `EPAMedicationRequest.authoredOn` | ✅ Kopiert | Automatische Kopie<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.basedOn` | `EPAMedicationRequest.basedOn` | ✅ Kopiert | Kopiert nach 'MedicationRequest.basedOn'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.dispenseRequest` | `EPAMedicationRequest.dispenseRequest` | ✅ Kopiert | Kopiert nach 'MedicationRequest.dispenseRequest'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.dosageInstruction` | `EPAMedicationRequest.dosageInstruction` | ✅ Kopiert | Kopiert nach 'MedicationRequest.dosageInstruction'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.intent` | `EPAMedicationRequest.intent` | ✅ Kopiert | Automatische Kopie<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.medication` | `EPAMedicationRequest.medication` | ✅ Kopiert | Kopiert nach 'MedicationRequest.medication[x]'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.meta` | `EPAMedicationRequest.meta` | 🆕 Erstellt | Automatische Kopie<br>→ erstellt neues Meta |
| `KBVPRERPPrescription.meta` | `EPAMedicationRequest.meta.profile` | 📝 Setzt Wert | Fester Wert 'https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-request'<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-request' |
| `KBVPRERPPrescription.note` | `EPAMedicationRequest.note` | ✅ Kopiert | Kopiert nach 'MedicationRequest.note'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.requester` | `EPAMedicationRequest.requester` | ✅ Kopiert | Kopiert nach 'MedicationRequest.requester'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.status` | `EPAMedicationRequest.status` | ✅ Kopiert | Automatische Kopie<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.subject` | `EPAMedicationRequest.subject` | ℹ️ Dokumentiert | Manual action required \| Transformationsregel F_007: Wird aus KBV_PR_FOR_Patient.identifier:versichertenId übernommen. \| Field: MedicationRequest.subject |
| `KBVPRERPPrescription.substitution` | `EPAMedicationRequest.substitution` | ✅ Kopiert | Kopiert nach 'MedicationRequest.substitution'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.subject.identifier` | — | ℹ️ Dokumentiert | Manual action required \| Befüllen von .subject nach Transformationsregel F_010 \| Field: MedicationRequest.subject.identifier |

### Extensions

#### Extension: AushaendigungInformationsmaterialien

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'AushaendigungInformationsmaterialien']` | `EPAMedicationRequest.extension.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:T-Rezept.extension:AushaendigungInformationsmaterialien'<br>→ erstellt neues Extension |
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'AushaendigungInformationsmaterialien']` | `EPAMedicationRequest.extension.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:T-Rezept.extension:AushaendigungInformationsmaterialien'<br>→ setzt Wert 'hand-out-information-material' |
| `KBVPRERPPrescription.extension.extension.value  [Bedingung: url = 'AushaendigungInformationsmaterialien']` | `EPAMedicationRequest.extension.extension.value` | ✅ Kopiert | Kopiert von 'MedicationRequest.extension:T-Rezept.extension:AushaendigungInformationsmaterialien.value[x]'<br>→ übernimmt Wert aus Quellvariable |

#### Extension: BtM-Sonderkennzeichen

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'BtM-Sonderkennzeichen']` | `EPAMedicationRequest.extension.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:Betaeubungsmittel.extension:BtM-Sonderkennzeichen'<br>→ erstellt neues Extension |
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'BtM-Sonderkennzeichen']` | `EPAMedicationRequest.extension.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:Betaeubungsmittel.extension:BtM-Sonderkennzeichen'<br>→ setzt Wert 'narcotics-markings' |
| `KBVPRERPPrescription.extension.extension.value  [Bedingung: url = 'BtM-Sonderkennzeichen']` | `EPAMedicationRequest.extension.extension.value` | ✅ Kopiert | Kopiert von 'MedicationRequest.extension:Betaeubungsmittel.extension:BtM-Sonderkennzeichen.value[x]'<br>→ übernimmt Wert aus Quellvariable |

#### Extension: EinhaltungSicherheitsmassnahmen

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'EinhaltungSicherheitsmassnahmen']` | `EPAMedicationRequest.extension.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:T-Rezept.extension:EinhaltungSicherheitsmassnahmen'<br>→ erstellt neues Extension |
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'EinhaltungSicherheitsmassnahmen']` | `EPAMedicationRequest.extension.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:T-Rezept.extension:EinhaltungSicherheitsmassnahmen'<br>→ setzt Wert 'security-compliance' |
| `KBVPRERPPrescription.extension.extension.value  [Bedingung: url = 'EinhaltungSicherheitsmassnahmen']` | `EPAMedicationRequest.extension.extension.value` | ✅ Kopiert | Kopiert von 'MedicationRequest.extension:T-Rezept.extension:EinhaltungSicherheitsmassnahmen.value[x]'<br>→ übernimmt Wert aus Quellvariable |

#### Extension: ErgaenzendeAngabenSubstitutionsmittel

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'ErgaenzendeAngabenSubstitutionsmittel']` | `EPAMedicationRequest.extension.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:Betaeubungsmittel.extension:ErgaenzendeAngabenSubstitutionsmittel'<br>→ erstellt neues Extension |
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'ErgaenzendeAngabenSubstitutionsmittel']` | `EPAMedicationRequest.extension.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:Betaeubungsmittel.extension:ErgaenzendeAngabenSubstitutionsmittel'<br>→ setzt Wert 'additional-information-substitutes' |
| `KBVPRERPPrescription.extension.extension.value  [Bedingung: url = 'ErgaenzendeAngabenSubstitutionsmittel']` | `EPAMedicationRequest.extension.extension.value` | ✅ Kopiert | Kopiert von 'MedicationRequest.extension:Betaeubungsmittel.extension:ErgaenzendeAngabenSubstitutionsmittel.value[x]'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.extension.extension.value  [Bedingung: url = 'ErgaenzendeAngabenSubstitutionsmittel']` | `EPAMedicationRequest.extension.extension.value` | ✅ Kopiert | Kopiert von 'MedicationRequest.extension:Betaeubungsmittel.extension:ErgaenzendeAngabenSubstitutionsmittel.value[x]:valueString'<br>→ übernimmt Wert aus Quellvariable |

#### Extension: ErklaerungSachkenntnis

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'ErklaerungSachkenntnis']` | `EPAMedicationRequest.extension.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:T-Rezept.extension:ErklaerungSachkenntnis'<br>→ erstellt neues Extension |
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'ErklaerungSachkenntnis']` | `EPAMedicationRequest.extension.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:T-Rezept.extension:ErklaerungSachkenntnis'<br>→ setzt Wert 'declaration-of-expertise' |
| `KBVPRERPPrescription.extension.extension.value  [Bedingung: url = 'ErklaerungSachkenntnis']` | `EPAMedicationRequest.extension.extension.value` | ✅ Kopiert | Kopiert von 'MedicationRequest.extension:T-Rezept.extension:ErklaerungSachkenntnis.value[x]'<br>→ übernimmt Wert aus Quellvariable |

#### Extension: GebaerfaehigeFrau

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'GebaerfaehigeFrau']` | `EPAMedicationRequest.extension.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:T-Rezept.extension:GebaerfaehigeFrau'<br>→ erstellt neues Extension |
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'GebaerfaehigeFrau']` | `EPAMedicationRequest.extension.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:T-Rezept.extension:GebaerfaehigeFrau'<br>→ setzt Wert 'childbearing-potential' |
| `KBVPRERPPrescription.extension.extension.value  [Bedingung: url = 'GebaerfaehigeFrau']` | `EPAMedicationRequest.extension.extension.value` | ✅ Kopiert | Kopiert von 'MedicationRequest.extension:T-Rezept.extension:GebaerfaehigeFrau.value[x]'<br>→ übernimmt Wert aus Quellvariable |

#### Extension: GeneratedDosageInstructionsMeta
Bedingung: url = `http://ig.fhir.de/igs/medication/StructureDefinition/GeneratedDosageInstructionsMeta`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension [Bedingung: url = 'http://ig.fhir.de/igs/medication/StructureDefinition/GeneratedDosageInstructionsMeta']` | `EPAMedicationRequest.extension` | ✅ Kopiert · ⚙️ Bedingt | Automatische Kopie<br>Kopiert komplette Extension inklusive Werte<br>→ übernimmt Wert aus Quellvariable |

#### Extension: ID

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'ID']` | `EPAMedicationRequest.extension.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:Mehrfachverordnung.extension:ID'<br>→ erstellt neues Extension |
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'ID']` | `EPAMedicationRequest.extension.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:Mehrfachverordnung.extension:ID'<br>→ setzt Wert 'id' |
| `KBVPRERPPrescription.extension.extension.value  [Bedingung: url = 'ID']` | `EPAMedicationRequest.extension.extension.value` | 🆕 Erstellt | Kopiert von 'MedicationRequest.extension:Mehrfachverordnung.extension:ID.value[x]'<br>→ erstellt neues Identifier |

#### Extension: KBV_EX_ERP_Multiple_Prescription
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Multiple_Prescription`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Multiple_Prescription']` | `EPAMedicationRequest.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:Mehrfachverordnung'<br>→ erstellt neues Extension |
| `KBVPRERPPrescription.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Multiple_Prescription']` | `EPAMedicationRequest.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:Mehrfachverordnung'<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/multiple-prescription-extension' |

#### Extension: KBV_EX_ERP_Narcotic
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Narcotic`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Narcotic']` | `EPAMedicationRequest.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:Betaeubungsmittel'<br>→ erstellt neues Extension |
| `KBVPRERPPrescription.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Narcotic']` | `EPAMedicationRequest.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:Betaeubungsmittel'<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/narcotics-extension' |

#### Extension: KBV_EX_ERP_Patient_ID
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Patient_ID`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Patient_ID']` | `EPAMedicationRequest.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:PatientenID'<br>→ erstellt neues Extension |
| `KBVPRERPPrescription.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Patient_ID']` | `EPAMedicationRequest.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:PatientenID'<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/patient-id-extension' |
| `KBVPRERPPrescription.extension.value  [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Patient_ID']` | `EPAMedicationRequest.extension.value` | 🆕 Erstellt | Kopiert von 'MedicationRequest.extension:PatientenID.value[x]'<br>→ erstellt neues Identifier |

#### Extension: KBV_EX_ERP_Prescriber_ID
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Prescriber_ID`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Prescriber_ID']` | `EPAMedicationRequest.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:VerschreiberID'<br>→ erstellt neues Extension |
| `KBVPRERPPrescription.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Prescriber_ID']` | `EPAMedicationRequest.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:VerschreiberID'<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/prescriber-id-extension' |
| `KBVPRERPPrescription.extension.value  [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Prescriber_ID']` | `EPAMedicationRequest.extension.value` | 🆕 Erstellt | Kopiert von 'MedicationRequest.extension:VerschreiberID.value[x]'<br>→ erstellt neues Identifier |

#### Extension: KBV_EX_ERP_Teratogenic
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Teratogenic`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Teratogenic']` | `EPAMedicationRequest.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:T-Rezept'<br>→ erstellt neues Extension |
| `KBVPRERPPrescription.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Teratogenic']` | `EPAMedicationRequest.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:T-Rezept'<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/teratogenic-extension' |

#### Extension: KBV_EX_FOR_SER
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_SER`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_SER']` | `EPAMedicationRequest.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:SER'<br>→ erstellt neues Extension |
| `KBVPRERPPrescription.extension [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_SER']` | `EPAMedicationRequest.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:SER'<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/indicator-ser-extension' |
| `KBVPRERPPrescription.extension.value  [Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_SER']` | `EPAMedicationRequest.extension.value` | ✅ Kopiert | Kopiert von 'MedicationRequest.extension:SER.value[x]'<br>→ übernimmt Wert aus Quellvariable |

#### Extension: Kennzeichen

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'Kennzeichen']` | `EPAMedicationRequest.extension.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen'<br>→ erstellt neues Extension |
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'Kennzeichen']` | `EPAMedicationRequest.extension.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen'<br>→ setzt Wert 'indicator' |
| `KBVPRERPPrescription.extension.extension.value  [Bedingung: url = 'Kennzeichen']` | `EPAMedicationRequest.extension.extension.value` | ✅ Kopiert | Kopiert von 'MedicationRequest.extension:Mehrfachverordnung.extension:Kennzeichen.value[x]'<br>→ übernimmt Wert aus Quellvariable |

#### Extension: Nummerierung

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'Nummerierung']` | `EPAMedicationRequest.extension.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:Mehrfachverordnung.extension:Nummerierung'<br>→ erstellt neues Extension |
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'Nummerierung']` | `EPAMedicationRequest.extension.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:Mehrfachverordnung.extension:Nummerierung'<br>→ setzt Wert 'counter' |
| `KBVPRERPPrescription.extension.extension.value  [Bedingung: url = 'Nummerierung']` | `EPAMedicationRequest.extension.extension.value` | 🆕 Erstellt | Kopiert von 'MedicationRequest.extension:Mehrfachverordnung.extension:Nummerierung.value[x]'<br>→ erstellt neues Ratio |

#### Extension: Off-Label

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'Off-Label']` | `EPAMedicationRequest.extension.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:T-Rezept.extension:Off-Label'<br>→ erstellt neues Extension |
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'Off-Label']` | `EPAMedicationRequest.extension.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:T-Rezept.extension:Off-Label'<br>→ setzt Wert 'off-label' |
| `KBVPRERPPrescription.extension.extension.value  [Bedingung: url = 'Off-Label']` | `EPAMedicationRequest.extension.extension.value` | ✅ Kopiert | Kopiert von 'MedicationRequest.extension:T-Rezept.extension:Off-Label.value[x]'<br>→ übernimmt Wert aus Quellvariable |

#### Extension: Zeitraum

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'Zeitraum']` | `EPAMedicationRequest.extension.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum'<br>→ erstellt neues Extension |
| `KBVPRERPPrescription.extension.extension [Bedingung: url = 'Zeitraum']` | `EPAMedicationRequest.extension.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert von 'MedicationRequest.extension:Mehrfachverordnung.extension:Zeitraum'<br>→ setzt Wert 'period' |

#### Extension: extension-MedicationRequest.renderedDosageInstruction
Bedingung: url = `http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.renderedDosageInstruction`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension [Bedingung: url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.renderedDosageInstruction']` | `EPAMedicationRequest.extension` | 🆕 Erstellt · ⚙️ Bedingt | Kopiert nach 'MedicationRequest.extension:renderedDosageInstruction'<br>→ erstellt neues Extension |
| `KBVPRERPPrescription.extension.extension  [Bedingung: url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.renderedDosageInstruction']` | `EPAMedicationRequest.extension.extension` | ✅ Kopiert | Kopiert nach 'MedicationRequest.extension:renderedDosageInstruction.extension'<br>Kopiert komplette Extension inklusive Werte<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.extension [Bedingung: url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.renderedDosageInstruction']` | `EPAMedicationRequest.extension.url` | 📝 Setzt Wert · ⚙️ Bedingt | Kopiert nach 'MedicationRequest.extension:renderedDosageInstruction'<br>→ setzt URL 'http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.renderedDosageInstruction' |
| `KBVPRERPPrescription.extension.value  [Bedingung: url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.renderedDosageInstruction']` | `EPAMedicationRequest.extension.value` | ✅ Kopiert | Kopiert nach 'MedicationRequest.extension:renderedDosageInstruction.value[x]'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.extension.id  [Bedingung: url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.renderedDosageInstruction']` | `EPAMedicationRequest.extension.id` | ✅ Kopiert | Kopiert nach 'MedicationRequest.extension:renderedDosageInstruction.id'<br>→ übernimmt Wert aus Quellvariable |

