| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationCompounding.amount` | `EPAMedication.amount` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.amount.denominator` | `EPAMedication.amount.denominator` | 🆕 Erstellt | Automatic copy<br>→ erstellt neues Quantity |
| `KBVPRERPMedicationCompounding.amount.denominator.id` | `EPAMedication.amount.denominator.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.amount.denominator.value` | `EPAMedication.amount.denominator.value` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.amount.id` | `EPAMedication.amount.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.amount.numerator` | `EPAMedication.amount.numerator` | 🆕 Erstellt | Automatic copy<br>→ erstellt neues Quantity |
| `KBVPRERPMedicationCompounding.amount.numerator.id` | `EPAMedication.amount.numerator.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.amount.numerator.unit` | `EPAMedication.amount.numerator.unit` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.batch` | `EPAMedication.batch` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.batch.expirationDate` | `EPAMedication.batch.expirationDate` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.batch.id` | `EPAMedication.batch.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.batch.lotNumber` | `EPAMedication.batch.lotNumber` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.code` | `EPAMedication.code` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.code.coding` | `EPAMedication.code.coding` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.code.id` | `EPAMedication.code.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.code.text` | `EPAMedication.code.text` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.form` | `EPAMedication.form` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.form.id` | `EPAMedication.form.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.form.text` | `EPAMedication.form.text` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.id` | `EPAMedication.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.ingredient` | `EPAMedication.ingredient` | 🆕 Erstellt | Automatic copy<br>→ erstellt neues BackboneElement |
| `KBVPRERPMedicationCompounding.ingredient.id` | `EPAMedication.ingredient.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.ingredient.item` | `EPAMedication.ingredient.item` | 🆕 Erstellt | Automatic copy<br>→ erstellt neues CodeableConcept |
| `KBVPRERPMedicationCompounding.ingredient.item.coding` | `EPAMedication.ingredient.item.coding` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.ingredient.item.coding [Bedingung: system = 'http://fhir.de/CodeSystem/ifa/pzn']` | `EPAMedication.ingredient.item.coding` | 🆕 Erstellt · ⚙️ Bedingt | Automatic copy<br>→ erstellt neues Coding |
| `KBVPRERPMedicationCompounding.ingredient.item.coding.code` | `EPAMedication.ingredient.item.coding.code` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.ingredient.item.coding.id` | `EPAMedication.ingredient.item.coding.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.ingredient.item.coding` | `EPAMedication.ingredient.item.coding.system` | 📝 Setzt Wert | Fixed value 'http://fhir.de/CodeSystem/ifa/pzn' \| Auto-detected fixed value from target profile<br>→ setzt URL 'http://fhir.de/CodeSystem/ifa/pzn' |
| `KBVPRERPMedicationCompounding.ingredient.item.id` | `EPAMedication.ingredient.item.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.ingredient.item.text` | `EPAMedication.ingredient.item.text` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.ingredient.strength` | `EPAMedication.ingredient.strength` | 🆕 Erstellt | Automatic copy<br>→ erstellt neues Ratio |
| `KBVPRERPMedicationCompounding.ingredient.strength.denominator` | `EPAMedication.ingredient.strength.denominator` | 🆕 Erstellt | Automatic copy<br>→ erstellt neues Quantity |
| `KBVPRERPMedicationCompounding.ingredient.strength.denominator.id` | `EPAMedication.ingredient.strength.denominator.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.ingredient.strength.denominator.value` | `EPAMedication.ingredient.strength.denominator.value` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.ingredient.strength.id` | `EPAMedication.ingredient.strength.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.ingredient.strength.numerator` | `EPAMedication.ingredient.strength.numerator` | 🆕 Erstellt | Automatic copy<br>→ erstellt neues Quantity |
| `KBVPRERPMedicationCompounding.ingredient.strength.numerator.id` | `EPAMedication.ingredient.strength.numerator.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.ingredient.strength.numerator.unit` | `EPAMedication.ingredient.strength.numerator.unit` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationCompounding.ingredient.strength.numerator.value` | `EPAMedication.ingredient.strength.numerator.value` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
