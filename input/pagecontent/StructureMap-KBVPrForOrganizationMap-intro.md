### Feld-Mappings

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRFOROrganization` | `OrganizationDirectory.identifier` | Manuell | Telematik-ID wird aus idNummer → aus dem ACCESS_TOKEN der Anfrage bezogen \| Quelle: Organization.identifier:TelematikID |
| `KBVPRFOROrganization.meta` | `OrganizationDirectory.meta.profile` | Fester Wert | setzt festen Wert: `https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory` |
| `KBVPRFOROrganization.name` | `OrganizationDirectory.name` | Manuell | organizationName → aus dem ACCESS_TOKEN der Anfrage beziehen \| Quelle: Organization.name |
| `KBVPRFOROrganization` | `OrganizationDirectory.type` | Manuell | professionOID → aus dem ACCESS_TOKEN der Anfrage \| Quelle: Organization.type:profession |

