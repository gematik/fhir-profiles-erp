| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |
|------------------------|---------------------|--------|-------------------------------|
| `KBVPRERPPrescription.authoredOn` | `EPAMedicationRequest.authoredOn` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.basedOn` | `EPAMedicationRequest.basedOn` | 🆕 Erstellt | Automatic copy<br>→ erstellt neues Reference |
| `KBVPRERPPrescription.basedOn.id` | `EPAMedicationRequest.basedOn.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.basedOn.identifier` | `EPAMedicationRequest.basedOn.identifier` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.dispenseRequest` | `EPAMedicationRequest.dispenseRequest` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.dispenseRequest.expectedSupplyDuration` | `EPAMedicationRequest.dispenseRequest.expectedSupplyDuration` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.dispenseRequest.id` | `EPAMedicationRequest.dispenseRequest.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.dispenseRequest.quantity` | `EPAMedicationRequest.dispenseRequest.quantity` | 🆕 Erstellt | Automatic copy<br>→ erstellt neues Quantity |
| `KBVPRERPPrescription.dispenseRequest.quantity.id` | `EPAMedicationRequest.dispenseRequest.quantity.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.dispenseRequest.quantity.unit` | `EPAMedicationRequest.dispenseRequest.quantity.unit` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.dispenseRequest.quantity.value` | `EPAMedicationRequest.dispenseRequest.quantity.value` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.dosageInstruction` | `EPAMedicationRequest.dosageInstruction` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.insurance` | `EPAMedicationRequest.insurance` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.intent` | `EPAMedicationRequest.intent` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.medication` | `EPAMedicationRequest.medication` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription` | `EPAMedicationRequest.meta.profile` | 📝 Setzt Wert | Fixed value 'https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-request'<br>→ setzt URL 'https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-request' |
| `KBVPRERPPrescription.note` | `EPAMedicationRequest.note` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.note.id` | `EPAMedicationRequest.note.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.note.text` | `EPAMedicationRequest.note.text` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.requester` | `EPAMedicationRequest.requester` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.status` | `EPAMedicationRequest.status` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.subject` | `EPAMedicationRequest.subject` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.subject.id` | `EPAMedicationRequest.subject.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.subject.reference` | `EPAMedicationRequest.subject.reference` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.substitution` | `EPAMedicationRequest.substitution` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.substitution.allowed` | `EPAMedicationRequest.substitution.allowed` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
| `KBVPRERPPrescription.substitution.id` | `EPAMedicationRequest.substitution.id` | ✅ Kopiert | Automatic copy<br>→ übernimmt Wert aus Quellvariable |
