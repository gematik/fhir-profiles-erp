### Feld-Mappings

| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRFOROrganization.address` | `OrganizationDirectory.address` | ✅ Kopiert | Kopiert nach 'Organization.address'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFOROrganization.address` | `OrganizationDirectory.address` | ✅ Kopiert | Kopiert nach 'Organization.address:Strassenanschrift'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFOROrganization.identifier` | `OrganizationDirectory.identifier` | ℹ️ Dokumentiert | Manual action required \| Telematik-ID wird aus idNummer → aus dem ACCESS_TOKEN der Anfrage bezogen \| Field: Organization.identifier:TelematikID |
| `KBVPRFOROrganization.identifier [Bedingung: (use = 'official' und system = 'https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR') != true und (system = 'http://fhir.de/sid/arge-ik/iknr') != true und (use = 'official' und system = 'http://fhir.de/sid/kzbv/kzvabrechnungsnummer') != true]` | `OrganizationDirectory.identifier` | ✅ Kopiert · ⚙️ Bedingt | Automatische Kopie<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFOROrganization.identifier [Bedingung: system = 'http://fhir.de/sid/arge-ik/iknr']` | `OrganizationDirectory.identifier` | ✅ Kopiert · ⚙️ Bedingt | Kopiert nach 'Organization.identifier:IKNR'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFOROrganization.identifier [Bedingung: use = 'official' und system = 'http://fhir.de/sid/kzbv/kzvabrechnungsnummer']` | `OrganizationDirectory.identifier` | ✅ Kopiert · ⚙️ Bedingt | Kopiert nach 'Organization.identifier:KZVA'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFOROrganization.identifier [Bedingung: use = 'official' und system = 'https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR']` | `OrganizationDirectory.identifier` | ✅ Kopiert · ⚙️ Bedingt | Kopiert nach 'Organization.identifier:BSNR'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFOROrganization.meta` | `OrganizationDirectory.meta` | 🆕 Erstellt | Automatische Kopie<br>→ erstellt neues Meta |
| `KBVPRFOROrganization.meta` | `OrganizationDirectory.meta.profile` | 📝 Setzt Wert | Fester Wert 'https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory'<br>→ setzt URL 'https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory' |
| `KBVPRFOROrganization.name` | `OrganizationDirectory.name` | ℹ️ Dokumentiert | Manual action required \| organizationName → aus dem ACCESS_TOKEN der Anfrage beziehen \| Field: Organization.name |
| `KBVPRFOROrganization.telecom` | `OrganizationDirectory.telecom` | ✅ Kopiert | Automatische Kopie<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFOROrganization.type` | `OrganizationDirectory.type` | ℹ️ Dokumentiert | Manual action required \| professionOID → aus dem ACCESS_TOKEN der Anfrage \| Field: Organization.type:profession |

