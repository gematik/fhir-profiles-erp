
WARN: AI GENERATED CONTENT - NEEDS REVIEW

Diese Seite gibt einen fachlichen End-to-End-Überblick darüber, wie ein E-Rezept von der Verordnung in der Praxis bis zur Belieferung in der Apotheke durch den E-Rezept-Fachdienst verarbeitet wird.

Das E-Rezept ist dabei Teil eines übergreifenden Medikationsprozesses: Therapieentscheidung, Verordnung, Abgabe und (je nach Kontext) begleitende Beratung sowie Dokumentation. Fachlich relevant ist vor allem, dass die Verarbeitungsschritte über standardisierte, interoperable Datenobjekte und klar definierte Zustandsübergänge gesteuert werden.

**Seiteninhalt:**

- Einordnung und Ziele
- Beteiligte Rollen und Systeme
- Zentrale Artefakte (FHIR)
- Prozessschritte (fachlich)
- Häufige Varianten und Abgrenzungen
- Statusmodell
- Merkhilfe: Zugriffsinformationen

### Einordnung und Ziele

Das E-Rezept in Deutschland digitalisiert den Verordnungs- und Abgabeprozess für Arzneimittel. Ziel ist eine durchgängige, sichere und nachvollziehbare Verarbeitung von Verordnungsdaten zwischen verordnenden Leistungserbringern, Versicherten und Apotheken. Technisch wird der Workflow über den E-Rezept-Fachdienst orchestriert; fachlich ergibt sich daraus ein wiederkehrender Ablauf:

- Eine Verordnung wird erstellt, qualifiziert signiert und „bereitgestellt“.
- Ein Versicherter kann das Rezept in einer Apotheke einlösen (direkt oder über Token/Vertretung).
- Die Abgabe wird dokumentiert; der Workflow wird abgeschlossen.

Neben dem Standardablauf existieren Varianten (z.B. Löschung/Abbruch, Teilabgaben, organisatorische Vorarbeiten), die sich in den Zuständen und erforderlichen Zugriffsinformationen widerspiegeln.

### Beteiligte Rollen und Systeme

- Verordnender Leistungserbringer (Arzt/Zahnarzt) mit Primärsystem (PVS/KIS)
- Abgebender Leistungserbringer (Apotheke) mit Apothekenverwaltungssystem (AVS)
- Versicherter (Patient) als Empfänger und Übermittler des E-Rezept-Tokens
- E-Rezept-Fachdienst (eRp-FD) als Workflow- und Datendrehscheibe
- Identity Provider (IdP) und Konnektor für Authentisierung/Signaturprüfung
- HBA für die Qualifizierte Elektronische Signatur (QES)

### Zentrale Artefakte (FHIR)

- `Task`: steuert den Workflowzustand des E-Rezepts (inkl. Rezept-ID, Status und Zugriffscodes)
- Verordnungsdatensatz (KBV-konformes FHIR-Bundle), qualifiziert signiert
- `Binary`: Transport des signierten Verordnungsdatensatzes
- `MedicationDispense`: Abgabe-/Dispensierinformationen (Apotheke)
- Quittungs-Bundle: serverseitig signierte Quittung nach Abschluss

### Prozessschritte (fachlich)

Der folgende Ablauf beschreibt den typischen fachlichen „Happy Path“ vom Erstellen bis zum Abschluss. Er ist bewusst zusammenfassend gehalten; Details zu einzelnen fachlichen Anwendungsfällen finden sich auf der Seite [Anwendungsfälle](./menu-fachlichkeit-anwendungsfaelle.html).

#### Verordnung erstellen und vorbereiten (PVS/KIS)

Der Verordnungsdatensatz wird im Primärsystem erstellt (FHIR-Bundle gemäß KBV-Profilen). Vorbereitung kann organisatorisch delegiert werden (z.B. MFA), die QES selbst jedoch nicht.

Wichtiger Konsistenzpunkt: Das Datum im Verordnungsdatensatz (`authoredOn`) muss dem Datum der QES entsprechen; bei Abweichung wird das Einstellen abgelehnt.

#### Task anlegen: Rezept-ID erzeugen (E-Rezept-Fachdienst)

Das Primärsystem authentisiert sich gegenüber der TI (Institutionsidentität via SMC-B, IdP, Konnektor) und legt einen neuen Task an.

Ergebnis:

- Rezept-ID (PrescriptionID) wird vergeben
- AccessCode wird generiert (wird für weitere Zugriffe benötigt)
- Workflow-/Rezepttyp wird über `flowType` festgelegt (z.B. 160 „Muster 16“, 200 „PKV“)
- Task-Status ist initial `draft`

#### Qualifiziert signieren (QES)

Die Rezept-ID wird in den Verordnungsdatensatz eingebettet; anschließend wird der Verordnungsdatensatz durch den Arzt/Zahnarzt mittels HBA qualifiziert signiert.

#### Aktivieren: Verordnungsdatensatz am Task hinterlegen (E-Rezept-Fachdienst)

Das Primärsystem aktiviert den Task und übermittelt den QES-signierten Verordnungsdatensatz.

Der E-Rezept-Fachdienst validiert QES und Schemakonformität und erzeugt serverseitig eine Signatur zum Integritätsschutz.

Ergebnis:

- Task-Status wechselt von `draft` nach `ready`
- Das E-Rezept ist bereitgestellt und kann eingelöst werden

#### Token an den Versicherten

Für die Einlösung benötigt die Apotheke die Task-Referenz (Task-ID/Rezept-ID) und den AccessCode. Diese werden dem Versicherten bereitgestellt (z.B. 2D-Barcode oder Kommunikationsnachricht) und bei Bedarf an die Apotheke übermittelt.

#### Abrufen in der Apotheke: `$accept` (E-Rezept-Fachdienst)

Die Apotheke ruft das E-Rezept mit Task-ID und AccessCode ab.

Ergebnis:

- Rückgabe von Task und signiertem Verordnungsdatensatz
- Der E-Rezept-Fachdienst generiert zusätzlich ein `Secret` im Task.identifier
- Task-Status wird dabei auf `in-progress` gesetzt

Das AVS prüft die Signatur des Verordnungsdatensatzes mit Hilfe des Konnektors.

Hinweis zu Rezepttypen 200/209: Beim Abruf kann zusätzlich ein `Consent` zurückgegeben werden, wenn der Versicherte eine entsprechende Einwilligung im Versicherten-Frontend erteilt hat.

#### Optional: Dispensierinformationen bereitstellen: `$dispense`

Wenn die Apotheke den Workflow erst später abschließen kann (z.B. aufgrund organisatorischer Vereinbarungen), können Dispensierinformationen vorab übermittelt werden.

Wichtige Eigenschaften:

- `$dispense` ist optional
- Task-Status wird dadurch nicht verändert
- Es wird keine Quittung erzeugt; bei Erfolg kommt typischerweise `204 No Content`

Der Task wird dabei um einen Zeitstempel (letzte Abgabeaktualisierung) ergänzt und steht dem Versicherten-Frontend zum Abruf bereit.

#### Abschluss in der Apotheke: `$close` (Workflow beenden)

Zum Abschluss übermittelt die Apotheke (unter Verwendung des `Secret`) die Dispensierinformationen (oder schließt ohne Body, wenn zuvor `$dispense` genutzt wurde) und beendet den Workflow.

Ergebnis:

- Task-Status wechselt von `in-progress` nach `completed`
- Der E-Rezept-Fachdienst liefert ein signiertes Quittungs-Bundle zurück

Besonderheit PKV (`flowType=200`): Die Quittung muss dem Versicherten typischerweise ausgedruckt übergeben werden, damit dieser die Abrechnung gegenüber seiner Kostenstelle selbst vornehmen kann.

### Statusmodell (vereinfachte Sicht)

- `draft`: Task angelegt, Verordnungsdatensatz noch nicht wirksam eingestellt
- `ready`: Verordnungsdatensatz ist QES-signiert eingestellt; Rezept ist einlösbar
- `in-progress`: Rezept wurde von einer Apotheke angenommen; `Secret` ist vergeben
- `completed`: Belieferung abgeschlossen; Quittung ist erzeugt

### Merkhilfe: „Welche Zugriffsinformation wofür?”

- AccessCode: vom Fachdienst beim Anlegen generiert; wird für Zugriff/Annahme genutzt (z.B. durch Apotheke beim `$accept`)
- Secret: entsteht beim `$accept`; wird für die folgenden apothekenspezifischen Schritte genutzt (`$dispense`, `$close`)

### Häufige Varianten und Abgrenzungen

Der oben beschriebene Ablauf ist ein Standardfall. In der Praxis treten u.a. folgende fachliche Varianten auf:

- **Abbruch/Löschung vor Einlösung:** Ein bereits angelegter Task kann – je nach Berechtigung und Kontext – vor der Einlösung abgebrochen bzw. entfernt werden. Das ist fachlich relevant, um fehlerhafte oder nicht mehr benötigte Verordnungen zu vermeiden.
- **Vertretung und Übermittlung:** Die Einlösung kann durch den Versicherten selbst oder durch Dritte erfolgen, sofern die erforderlichen Zugriffsinformationen (z.B. Token/AccessCode) übermittelt werden.
- **Teil- oder nachgelagerte Dokumentation:** Dispensierinformationen können je nach Prozessausprägung schrittweise übermittelt werden; der Abschluss erfolgt erst, wenn der Workflow beendet wird.
- **Rezepttypen/Flows:** Der Workflow-/Rezepttyp (z.B. GKV/PKV-Ausprägungen) beeinflusst Validierungen, Dateninhalte und in Teilen das Rückgabe-/Anzeigeverhalten.

Die Seite bleibt bewusst auf das E-Rezept fokussiert. Eine Einordnung in weiterführende Medikationsprozesse (z.B. Medikationsliste/Medikationsplan in der ePA) ist möglich, wird jedoch an anderer Stelle vertieft.

### Weiterführende Seiten

- Szenarien: [Szenarien](./menu-fachlichkeit-szenarien.html)
- Fachliche Anwendungsfälle: [Anwendungsfälle](./menu-fachlichkeit-anwendungsfaelle.html)