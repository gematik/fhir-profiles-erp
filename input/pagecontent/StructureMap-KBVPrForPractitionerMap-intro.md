| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRFORPractitioner.identifier [Bedingung: (use = 'official' and system = 'https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR') != true and (system = 'https://gematik.de/fhir/sid/telematik-id') != true]` | `PractitionerDirectory.identifier` | ✅ Kopiert · ⚙️ Bedingt | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFORPractitioner.identifier [Bedingung: use = 'official' and system = 'https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR']` | `PractitionerDirectory.identifier` | ✅ Kopiert · ⚙️ Bedingt | Copied to 'Practitioner.identifier:LANR'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFORPractitioner.identifier [Bedingung: system = 'https://gematik.de/fhir/sid/telematik-id']` | `PractitionerDirectory.identifier` | ✅ Kopiert · ⚙️ Bedingt | Copied to 'Practitioner.identifier:TelematikID'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFORPractitioner.meta` | `PractitionerDirectory.meta` | 🆕 Erstellt | Automatic copy<br>→ erstellt neues Meta |
| `KBVPRFORPractitioner.meta` | `PractitionerDirectory.meta.profile` | 📝 Setzt Wert | Fixed value 'https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory'<br>→ setzt URL 'https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory' |
| `KBVPRFORPractitioner.name` | `PractitionerDirectory.name` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFORPractitioner.qualification` | `PractitionerDirectory.qualification` | 🆕 Erstellt | Automatic copy<br>→ erstellt neues BackboneElement |
