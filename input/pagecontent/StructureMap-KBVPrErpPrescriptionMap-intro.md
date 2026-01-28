### Feld-Mappings

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.meta` | `EPAMedicationRequest.meta.profile` | Fester Wert | setzt festen Wert: `https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-request` |
| `KBVPRERPPrescription.subject` | `EPAMedicationRequest.subject` | Manuell | Transformationsregel F_007: Wird aus KBV_PR_FOR_Patient.identifier:versichertenId übernommen. \| Quelle: MedicationRequest.subject |
| `KBVPRERPPrescription` | `EPAMedicationRequest.subject.identifier` | Manuell | Befüllen von .subject nach Transformationsregel F_010 \| Quelle: MedicationRequest.subject.identifier |

### Extensions

#### Extension: KBV_EX_FOR_SER
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_SER`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_SER']` | `EPAMedicationRequest.extension.url` | Fester Wert | setzt festen Wert: `https://gematik.de/fhir/epa-medication/StructureDefinition/indicator-ser-extension` |

#### Extension: KBV_EX_ERP_Multiple_Prescription
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Multiple_Prescription`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Multiple_Prescription']` | `EPAMedicationRequest.extension.url` | Fester Wert | setzt festen Wert: `https://gematik.de/fhir/epa-medication/StructureDefinition/multiple-prescription-extension` |

#### Extension: Nummerierung

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension`<br>`[Bedingung: url = 'Nummerierung']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert: `counter` |

#### Extension: ID

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension`<br>`[Bedingung: url = 'ID']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert: `id` |

#### Extension: Kennzeichen

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension`<br>`[Bedingung: url = 'Kennzeichen']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert: `indicator` |

#### Extension: Zeitraum

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension`<br>`[Bedingung: url = 'Zeitraum']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert: `period` |

#### Extension: KBV_EX_ERP_Narcotic
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Narcotic`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Narcotic']` | `EPAMedicationRequest.extension.url` | Fester Wert | setzt festen Wert: `https://gematik.de/fhir/epa-medication/StructureDefinition/narcotics-extension` |

#### Extension: ErgaenzendeAngabenSubstitutionsmittel

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension`<br>`[Bedingung: url = 'ErgaenzendeAngabenSubstitutionsmittel']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert: `additional-information-substitutes` |

#### Extension: BtM-Sonderkennzeichen

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension`<br>`[Bedingung: url = 'BtM-Sonderkennzeichen']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert: `narcotics-markings` |

#### Extension: KBV_EX_ERP_Patient_ID
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Patient_ID`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Patient_ID']` | `EPAMedicationRequest.extension.url` | Fester Wert | setzt festen Wert: `https://gematik.de/fhir/epa-medication/StructureDefinition/patient-id-extension` |

#### Extension: KBV_EX_ERP_Prescriber_ID
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Prescriber_ID`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Prescriber_ID']` | `EPAMedicationRequest.extension.url` | Fester Wert | setzt festen Wert: `https://gematik.de/fhir/epa-medication/StructureDefinition/prescriber-id-extension` |

#### Extension: extension-MedicationRequest.renderedDosageInstruction
Bedingung: url = `http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.renderedDosageInstruction`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension`<br>`[Bedingung: url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.renderedDosageInstruction']` | `EPAMedicationRequest.extension.url` | Fester Wert | setzt festen Wert: `http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.renderedDosageInstruction` |

#### Extension: KBV_EX_ERP_Teratogenic
Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Teratogenic`

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension`<br>`[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Teratogenic']` | `EPAMedicationRequest.extension.url` | Fester Wert | setzt festen Wert: `https://gematik.de/fhir/epa-medication/StructureDefinition/teratogenic-extension` |

#### Extension: GebaerfaehigeFrau

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension`<br>`[Bedingung: url = 'GebaerfaehigeFrau']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert: `childbearing-potential` |

#### Extension: ErklaerungSachkenntnis

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension`<br>`[Bedingung: url = 'ErklaerungSachkenntnis']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert: `declaration-of-expertise` |

#### Extension: AushaendigungInformationsmaterialien

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension`<br>`[Bedingung: url = 'AushaendigungInformationsmaterialien']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert: `hand-out-information-material` |

#### Extension: Off-Label

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension`<br>`[Bedingung: url = 'Off-Label']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert: `off-label` |

#### Extension: EinhaltungSicherheitsmassnahmen

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.extension.extension`<br>`[Bedingung: url = 'EinhaltungSicherheitsmassnahmen']` | `EPAMedicationRequest.extension.extension.url` | Fester Wert | setzt festen Wert: `security-compliance` |

