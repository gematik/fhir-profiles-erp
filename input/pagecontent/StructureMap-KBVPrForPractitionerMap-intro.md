| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRFORPractitioner.identifier [Bedingung: use = 'official' and system = 'https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR']` | `PractitionerDirectory.identifier` | ✅ Kopiert · ⚙️ Bedingt | Copied to 'Practitioner.identifier:LANR'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFORPractitioner.identifier [Bedingung: system = 'https://gematik.de/fhir/sid/telematik-id']` | `PractitionerDirectory.identifier` | ✅ Kopiert · ⚙️ Bedingt | Copied to 'Practitioner.identifier:TelematikID'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFORPractitioner` | `PractitionerDirectory.meta.profile` | 📝 Setzt Wert | Fixed value 'https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory'<br>→ setzt URL 'https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory' |
| `KBVPRFORPractitioner.meta.tag` | `PractitionerDirectory.meta.tag` | 🆕 Erstellt | Automatic copy<br>→ erstellt neues Coding |
| `KBVPRFORPractitioner.meta.tag` | `PractitionerDirectory.meta.tag.code` | 📝 Setzt Wert | Fixed value 'ldap'<br>→ setzt Wert 'ldap' |
| `KBVPRFORPractitioner.meta.tag` | `PractitionerDirectory.meta.tag.system` | 📝 Setzt Wert | Fixed value 'https://gematik.de/fhir/directory/CodeSystem/Origin'<br>→ setzt URL 'https://gematik.de/fhir/directory/CodeSystem/Origin' |
| `KBVPRFORPractitioner.qualification.id` | `PractitionerDirectory.qualification.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFORPractitioner.qualification.identifier` | `PractitionerDirectory.qualification.identifier` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFORPractitioner.qualification.issuer` | `PractitionerDirectory.qualification.issuer` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFORPractitioner.qualification.period` | `PractitionerDirectory.qualification.period` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
