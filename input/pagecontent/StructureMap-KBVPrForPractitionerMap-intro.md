### Feld-Mappings

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRFORPractitioner.identifier`<br>`[Bedingung: (use = 'official' und system = 'https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR') != true]` | `PractitionerDirectory.identifier` | ✅ Kopiert · ⚙️ Bedingt | Automatische Kopie<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFORPractitioner.identifier`<br>`[Bedingung: use = 'official' und system = 'https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR']` | `PractitionerDirectory.identifier` | ✅ Kopiert · ⚙️ Bedingt | Kopiert nach 'Practitioner.identifier:LANR'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFORPractitioner.identifier`<br>`[Bedingung: system = 'https://gematik.de/fhir/sid/telematik-id']` | `PractitionerDirectory.identifier` | ✅ Kopiert · ⚙️ Bedingt | Kopiert nach 'Practitioner.identifier:TelematikID'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFORPractitioner.meta` | `PractitionerDirectory.meta` | 🆕 Erstellt | Automatische Kopie<br>→ erstellt neues Meta |
| `KBVPRFORPractitioner.meta` | `PractitionerDirectory.meta.profile` | 📝 Setzt Wert | Fester Wert 'https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory'<br>→ setzt URL 'https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory' |
| `KBVPRFORPractitioner.name` | `PractitionerDirectory.name` | ✅ Kopiert | Automatische Kopie<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFORPractitioner.name.name.text` | `Practitioner.name.text` | 🛠️ Manuell | Zum Erzeugen von name.text siehe Transformationsregel F_011 |

