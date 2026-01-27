### Feld-Mappings

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRFOROrganization.identifier`<br>`[Bedingung: (use = 'official' und system = 'https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR') != true und (system = 'http://fhir.de/sid/arge-ik/iknr') != true und (use = 'official' und system = 'http://fhir.de/sid/kzbv/kzvabrechnungsnummer') != true]` | `OrganizationDirectory.identifier` | Kopiert | übernimmt Wert aus Quellvariable |
| `KBVPRFOROrganization.identifier`<br>`[Bedingung: use = 'official' und system = 'https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR']` | `OrganizationDirectory.identifier` | Kopiert | übernimmt Wert aus Quellvariable |
| `KBVPRFOROrganization.identifier`<br>`[Bedingung: system = 'http://fhir.de/sid/arge-ik/iknr']` | `OrganizationDirectory.identifier` | Kopiert | übernimmt Wert aus Quellvariable |
| `KBVPRFOROrganization.identifier`<br>`[Bedingung: use = 'official' und system = 'http://fhir.de/sid/kzbv/kzvabrechnungsnummer']` | `OrganizationDirectory.identifier` | Kopiert | übernimmt Wert aus Quellvariable |
| `KBVPRFOROrganization` | `OrganizationDirectory.identifier` | Manuell | Telematik-ID wird aus idNummer → aus dem ACCESS_TOKEN der Anfrage bezogen \| Quelle: Organization.identifier:TelematikID |
| `KBVPRFOROrganization.meta` | `OrganizationDirectory.meta.profile` | Fester Wert | setzt festen Wert: `https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory` |
| `KBVPRFOROrganization.name` | `OrganizationDirectory.name` | Manuell | organizationName → aus dem ACCESS_TOKEN der Anfrage beziehen \| Quelle: Organization.name |
| `KBVPRFOROrganization` | `OrganizationDirectory.type` | Manuell | professionOID → aus dem ACCESS_TOKEN der Anfrage \| Quelle: Organization.type:profession |

