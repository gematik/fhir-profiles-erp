| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPMedicationIngredient.amount` | `EPAMedication.amount` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.amount.denominator` | `EPAMedication.amount.denominator` | 🆕 Erstellt | Automatic copy<br>→ erstellt neues Quantity |
| `KBVPRERPMedicationIngredient.amount.denominator.id` | `EPAMedication.amount.denominator.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.amount.denominator.value` | `EPAMedication.amount.denominator.value` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.amount.id` | `EPAMedication.amount.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.amount.numerator` | `EPAMedication.amount.numerator` | 🆕 Erstellt | Automatic copy<br>→ erstellt neues Quantity |
| `KBVPRERPMedicationIngredient.amount.numerator.id` | `EPAMedication.amount.numerator.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.amount.numerator.unit` | `EPAMedication.amount.numerator.unit` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.batch` | `EPAMedication.batch` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.batch.expirationDate` | `EPAMedication.batch.expirationDate` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.batch.id` | `EPAMedication.batch.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.batch.lotNumber` | `EPAMedication.batch.lotNumber` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.code` | `EPAMedication.code` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.code.coding` | `EPAMedication.code.coding` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.code.id` | `EPAMedication.code.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.form` | `EPAMedication.form` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.form.id` | `EPAMedication.form.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.form.text` | `EPAMedication.form.text` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.ingredient` | `EPAMedication.ingredient` | 🆕 Erstellt | Automatic copy<br>→ erstellt neues BackboneElement |
| `KBVPRERPMedicationIngredient.ingredient.id` | `EPAMedication.ingredient.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.ingredient.item` | `EPAMedication.ingredient.item` | 🆕 Erstellt | Automatic copy<br>→ erstellt neues CodeableConcept |
| `KBVPRERPMedicationIngredient.ingredient.item.coding` | `EPAMedication.ingredient.item.coding` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.ingredient.item.coding [Bedingung: system = 'http://fhir.de/CodeSystem/ask']` | `EPAMedication.ingredient.item.coding` | 🆕 Erstellt · ⚙️ Bedingt | Automatic copy<br>→ erstellt neues Coding |
| `KBVPRERPMedicationIngredient.ingredient.item.coding.code` | `EPAMedication.ingredient.item.coding.code` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.ingredient.item.coding.id` | `EPAMedication.ingredient.item.coding.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.ingredient.item.coding` | `EPAMedication.ingredient.item.coding.system` | 📝 Setzt Wert | Fixed value 'http://fhir.de/CodeSystem/ask' \| Auto-detected fixed value from target profile<br>→ setzt URL 'http://fhir.de/CodeSystem/ask' |
| `KBVPRERPMedicationIngredient.ingredient.item.id` | `EPAMedication.ingredient.item.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.ingredient.item.text` | `EPAMedication.ingredient.item.text` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.ingredient.strength` | `EPAMedication.ingredient.strength` | 🆕 Erstellt | Automatic copy<br>→ erstellt neues Ratio |
| `KBVPRERPMedicationIngredient.ingredient.strength.denominator` | `EPAMedication.ingredient.strength.denominator` | 🆕 Erstellt | Automatic copy<br>→ erstellt neues Quantity |
| `KBVPRERPMedicationIngredient.ingredient.strength.denominator.id` | `EPAMedication.ingredient.strength.denominator.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.ingredient.strength.denominator.unit` | `EPAMedication.ingredient.strength.denominator.unit` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.ingredient.strength.denominator.value` | `EPAMedication.ingredient.strength.denominator.value` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.ingredient.strength.id` | `EPAMedication.ingredient.strength.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.ingredient.strength.numerator` | `EPAMedication.ingredient.strength.numerator` | 🆕 Erstellt | Automatic copy<br>→ erstellt neues Quantity |
| `KBVPRERPMedicationIngredient.ingredient.strength.numerator.id` | `EPAMedication.ingredient.strength.numerator.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.ingredient.strength.numerator.unit` | `EPAMedication.ingredient.strength.numerator.unit` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPMedicationIngredient.ingredient.strength.numerator.value` | `EPAMedication.ingredient.strength.numerator.value` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
