| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRFOROrganization.address` | `OrganizationDirectory.address` | 🆕 Erstellt | Copied to 'Organization.address'<br>→ erstellt neues Address |
| `KBVPRFOROrganization.identifier [Bedingung: use = 'official' and system = 'https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR']` | `OrganizationDirectory.identifier` | ✅ Kopiert · ⚙️ Bedingt | Copied to 'Organization.identifier:BSNR'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFOROrganization.identifier [Bedingung: system = 'http://fhir.de/sid/arge-ik/iknr']` | `OrganizationDirectory.identifier` | ✅ Kopiert · ⚙️ Bedingt | Copied to 'Organization.identifier:IKNR'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFOROrganization.identifier [Bedingung: use = 'official' and system = 'http://fhir.de/sid/kzbv/kzvabrechnungsnummer']` | `OrganizationDirectory.identifier` | ✅ Kopiert · ⚙️ Bedingt | Copied to 'Organization.identifier:KZVA'<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRFOROrganization` | `OrganizationDirectory.meta.profile` | 📝 Setzt Wert | Fixed value 'https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory'<br>→ setzt URL 'https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory' |
| `KBVPRFOROrganization.meta.tag` | `OrganizationDirectory.meta.tag` | 🆕 Erstellt | Automatic copy<br>→ erstellt neues Coding |
| `KBVPRFOROrganization.meta.tag` | `OrganizationDirectory.meta.tag.code` | 📝 Setzt Wert | Fixed value 'ldap'<br>→ setzt Wert 'ldap' |
| `KBVPRFOROrganization.meta.tag` | `OrganizationDirectory.meta.tag.system` | 📝 Setzt Wert | Fixed value 'https://gematik.de/fhir/directory/CodeSystem/Origin'<br>→ setzt URL 'https://gematik.de/fhir/directory/CodeSystem/Origin' |
