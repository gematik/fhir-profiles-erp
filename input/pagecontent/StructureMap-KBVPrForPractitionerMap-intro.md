### Feld-Mappings

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRFORPractitioner.meta` | `PractitionerDirectory.meta.profile` | Fester Wert | setzt festen Wert: `https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory` |
| `KBVPRFORPractitioner.name` | `PractitionerDirectory.name` | Manuell | Zum Erzeugen von name.text siehe Transformationsregel F_011 \| Quelle: Practitioner.name.text |
| `KBVPRFORPractitioner.qualification` | `PractitionerDirectory.qualification` | Nicht Übertragen | Feld wird nicht gemappt \| Quelle: Practitioner.qualification:ASV-Fachgruppennummer |
| `KBVPRFORPractitioner.qualification` | `PractitionerDirectory.qualification` | Nicht Übertragen | Feld wird nicht gemappt \| Quelle: Practitioner.qualification:Berufsbezeichnung |
| `KBVPRFORPractitioner.qualification` | `PractitionerDirectory.qualification` | Nicht Übertragen | Feld wird nicht gemappt \| Quelle: Practitioner.qualification:Typ |

