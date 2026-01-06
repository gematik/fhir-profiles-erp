### Überblick: Medikationsprozess mit E‑Rezept (Bereitstellen → Beliefern)

WARN: AI GENERATED CONTENT - NEEDS REVIEW

Diese Seite gibt einen fachlichen End-to-End-Überblick darüber, wie ein E‑Rezept von der Verordnung in der Praxis bis zur Belieferung in der Apotheke durch den E‑Rezept-Fachdienst verarbeitet wird.

#### Beteiligte Rollen und Systeme

- Verordnender Leistungserbringer (Arzt/Zahnarzt) mit Primärsystem (PVS/KIS)
- Abgebender Leistungserbringer (Apotheke) mit Apothekenverwaltungssystem (AVS)
- Versicherter (Patient) als Empfänger und Übermittler des E‑Rezept‑Tokens
- E‑Rezept-Fachdienst (eRp-FD) als Workflow- und Datendrehscheibe
- Identity Provider (IdP) und Konnektor für Authentisierung/Signaturprüfung
- HBA für die Qualifizierte Elektronische Signatur (QES)

#### Zentrale Artefakte (FHIR)

- `Task`: steuert den Workflowzustand des E‑Rezepts (inkl. Rezept-ID, Status und Zugriffscodes)
- Verordnungsdatensatz (KBV-konformes FHIR-Bundle), qualifiziert signiert
- `Binary`: Transport des signierten Verordnungsdatensatzes
- `MedicationDispense`: Abgabe-/Dispensierinformationen (Apotheke)
- Quittungs-Bundle: serverseitig signierte Quittung nach Abschluss

#### Prozessschritte (fachlich)

##### 1) Verordnung erstellen und vorbereiten (PVS/KIS)

Der Verordnungsdatensatz wird im Primärsystem erstellt (FHIR-Bundle gemäß KBV-Profilen). Vorbereitung kann organisatorisch delegiert werden (z.B. MFA), die QES selbst jedoch nicht.

Wichtiger Konsistenzpunkt: Das Datum im Verordnungsdatensatz (`authoredOn`) muss dem Datum der QES entsprechen; bei Abweichung wird das Einstellen abgelehnt.

##### 2) Task anlegen: Rezept-ID erzeugen (E‑Rezept-Fachdienst)

Das Primärsystem authentisiert sich gegenüber der TI (Institutionsidentität via SMC‑B, IdP, Konnektor) und legt einen neuen Task an.

Ergebnis:

- Rezept-ID (PrescriptionID) wird vergeben
- AccessCode wird generiert (wird für weitere Zugriffe benötigt)
- Workflow-/Rezepttyp wird über `flowType` festgelegt (z.B. 160 „Muster 16“, 200 „PKV“)
- Task-Status ist initial `draft`

##### 3) Qualifiziert signieren (QES)

Die Rezept-ID wird in den Verordnungsdatensatz eingebettet; anschließend wird der Verordnungsdatensatz durch den Arzt/Zahnarzt mittels HBA qualifiziert signiert.

##### 4) Aktivieren: Verordnungsdatensatz am Task hinterlegen (E‑Rezept-Fachdienst)

Das Primärsystem aktiviert den Task und übermittelt den QES-signierten Verordnungsdatensatz.

Der E‑Rezept-Fachdienst validiert QES und Schemakonformität und erzeugt serverseitig eine Signatur zum Integritätsschutz.

Ergebnis:

- Task-Status wechselt von `draft` nach `ready`
- Das E‑Rezept ist bereitgestellt und kann eingelöst werden

##### 5) Token an den Versicherten

Für die Einlösung benötigt die Apotheke die Task-Referenz (Task-ID/Rezept-ID) und den AccessCode. Diese werden dem Versicherten bereitgestellt (z.B. 2D‑Barcode oder Kommunikationsnachricht) und bei Bedarf an die Apotheke übermittelt.

##### 6) Abrufen in der Apotheke: `$accept` (E‑Rezept-Fachdienst)

Die Apotheke ruft das E‑Rezept mit Task-ID und AccessCode ab.

Ergebnis:

- Rückgabe von Task und signiertem Verordnungsdatensatz
- Der E‑Rezept-Fachdienst generiert zusätzlich ein `Secret` im Task.identifier
- Task-Status wird dabei auf `in-progress` gesetzt

Das AVS prüft die Signatur des Verordnungsdatensatzes mit Hilfe des Konnektors.

Hinweis zu Rezepttypen 200/209: Beim Abruf kann zusätzlich ein `Consent` zurückgegeben werden, wenn der Versicherte eine entsprechende Einwilligung im Versicherten-Frontend erteilt hat.

##### 7) Optional: Dispensierinformationen bereitstellen: `$dispense`

Wenn die Apotheke den Workflow erst später abschließen kann (z.B. aufgrund organisatorischer Vereinbarungen), können Dispensierinformationen vorab übermittelt werden.

Wichtige Eigenschaften:

- `$dispense` ist optional
- Task-Status wird dadurch nicht verändert
- Es wird keine Quittung erzeugt; bei Erfolg kommt typischerweise `204 No Content`

Der Task wird dabei um einen Zeitstempel (letzte Abgabeaktualisierung) ergänzt und steht dem Versicherten-Frontend zum Abruf bereit.

##### 8) Abschluss in der Apotheke: `$close` (Workflow beenden)

Zum Abschluss übermittelt die Apotheke (unter Verwendung des `Secret`) die Dispensierinformationen (oder schließt ohne Body, wenn zuvor `$dispense` genutzt wurde) und beendet den Workflow.

Ergebnis:

- Task-Status wechselt von `in-progress` nach `completed`
- Der E‑Rezept-Fachdienst liefert ein signiertes Quittungs-Bundle zurück

Besonderheit PKV (`flowType=200`): Die Quittung muss dem Versicherten typischerweise ausgedruckt übergeben werden, damit dieser die Abrechnung gegenüber seiner Kostenstelle selbst vornehmen kann.

#### Statusmodell (vereinfachte Sicht)

- `draft`: Task angelegt, Verordnungsdatensatz noch nicht wirksam eingestellt
- `ready`: Verordnungsdatensatz ist QES-signiert eingestellt; Rezept ist einlösbar
- `in-progress`: Rezept wurde von einer Apotheke angenommen; `Secret` ist vergeben
- `completed`: Belieferung abgeschlossen; Quittung ist erzeugt

#### Merkhilfe: „Welche Zugriffsinformation wofür?”

- AccessCode: vom Fachdienst beim Anlegen generiert; wird für Zugriff/Annahme genutzt (z.B. durch Apotheke beim `$accept`)
- Secret: entsteht beim `$accept`; wird für die folgenden apothekenspezifischen Schritte genutzt (`$dispense`, `$close`)