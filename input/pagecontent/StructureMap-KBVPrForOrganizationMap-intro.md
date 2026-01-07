### Feld-Mappings

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRFOROrganization.address` | `OrganizationDirectory.address` | Kopiert | Kopiert nach 'Organization.address'<br>übernimmt Wert aus Quellvariable |
| `KBVPRFOROrganization.address` | `OrganizationDirectory.address` | Kopiert | Kopiert nach 'Organization.address:Strassenanschrift'<br>übernimmt Wert aus Quellvariable |
| `KBVPRFOROrganization.identifier`<br>`[Bedingung: (use = 'official' und system = 'https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR') != true und (system = 'http://fhir.de/sid/arge-ik/iknr') != true und (use = 'official' und system = 'http://fhir.de/sid/kzbv/kzvabrechnungsnummer') != true]` | `OrganizationDirectory.identifier` | Kopiert | Automatische Kopie<br>übernimmt Wert aus Quellvariable |
| `KBVPRFOROrganization.identifier`<br>`[Bedingung: use = 'official' und system = 'https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR']` | `OrganizationDirectory.identifier` | Kopiert | Kopiert nach 'Organization.identifier:BSNR'<br>übernimmt Wert aus Quellvariable |
| `KBVPRFOROrganization.identifier`<br>`[Bedingung: system = 'http://fhir.de/sid/arge-ik/iknr']` | `OrganizationDirectory.identifier` | Kopiert | Kopiert nach 'Organization.identifier:IKNR'<br>übernimmt Wert aus Quellvariable |
| `KBVPRFOROrganization.identifier`<br>`[Bedingung: use = 'official' und system = 'http://fhir.de/sid/kzbv/kzvabrechnungsnummer']` | `OrganizationDirectory.identifier` | Kopiert | Kopiert nach 'Organization.identifier:KZVA'<br>übernimmt Wert aus Quellvariable |
| `KBVPRFOROrganization` | `Organization.identifier:TelematikID` | Manuell | Telematik-ID wird aus idNummer → aus dem ACCESS_TOKEN der Anfrage bezogen |
| `KBVPRFOROrganization.meta` | `OrganizationDirectory.meta` | Erstellt | Automatische Kopie<br>erstellt neues Meta |
| `KBVPRFOROrganization.meta` | `OrganizationDirectory.meta.profile` | Fester Wert | setzt festen Wert: `https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory` |
| `KBVPRFOROrganization` | `Organization.name` | Manuell | organizationName → aus dem ACCESS_TOKEN der Anfrage beziehen |
| `KBVPRFOROrganization.telecom` | `OrganizationDirectory.telecom` | Kopiert | Automatische Kopie<br>übernimmt Wert aus Quellvariable |
| `KBVPRFOROrganization` | `Organization.type:profession` | Manuell | professionOID → aus dem ACCESS_TOKEN der Anfrage |

