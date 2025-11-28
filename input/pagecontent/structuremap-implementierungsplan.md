# Implementierungsplan: Mapping KBV-Bundle -> EPA Provide-Prescription

## Hintergrund
Der E-Rezept-Fachdienst muss KBV_PR_ERP_Bundle (Quelle: https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle, weblink https://simplifier.net/packages/kbv.ita.erp/1.3.2/files/2880350) in die Parameter-Struktur https://gematik.de/fhir/epa-medication/StructureDefinition/epa-op-provide-prescription-erp-input-parameters transformieren. Die Transformation soll in Form von StructureMaps dokumentiert, getestet und spaeter im IG veroeffentlicht werden.

## Bestaende Ressourcen
- StructureMaps: `input/content/structuremaps` (z. B. Medikament, MedicationRequest, Directory-Ressourcen)
- Eingabebeispiele: `input/content/kbv-bundles/*.json`
- Testskripte (zu adaptieren): `scripts/testscripts/*.py`
- Markdown-Tabellen fuer StructureMaps: `input/includes/StructureMap-*.md`

## Zielbild
1. Vollstaendige Dokumentation der Transformationslogik innerhalb des IG (deutschsprachig, inkl. Tabellen und Mappingbeschreibungen).
2. Manuelle Aggregations-StructureMap, die komplette KBV-Bundles in Provide-Prescription-Parameter ueberfuehrt und vorhandene Teilmaps wiederverwendet.
3. Automatisierte Tests, die jede KBV-Beispieldatei gegen die Provide-Prescription-Ausgabe pruefen (inkl. Referenzdaten pro Testfall).

## Arbeitspakete

### 1. Aggregations-StructureMap erstellen
- **Ziel:** Neue StructureMap `StructureMap-KBVPrErpBundle-to-ProvidePrescriptionParameters` (Datei unter `input/content/structuremaps`).
- **Vorgehen:**
  - Festlegen, welche Ressourcen (Medication, MedicationRequest, Practitioner usw.) via vorhandener Maps transformiert werden.
  - Innerhalb der Map Sequenzen definieren, die die bestehenden Maps per `dependent` oder `group` Aufrufen einbinden.
  - Sicherstellen, dass Bundle-Metadaten (patient, prescriptionId usw.) korrekt auf Parameter-Eintraege gemappt werden.
- **Abnahme:** JSON-StructureMap validiert gegen FHIR-Validator; erzeugte Markdown-Tabelle spiegelt die Kerntabellen wider.

### 2. Einzeltest fuer Referenzbundle
- **Ziel:** Nachweis, dass die Aggregations-Map fuer `Bundle-1f339db0-9e55-4946-9dfa-f1b30953be9b--47477033.json` funktioniert.
- **Vorgehen:**
  - Skript `scripts/testscripts/transform-bundle.py` (oder analog) anpassen, damit es KBV-Bundle + Aggregations-Map einliest und Provide-Prescription-Parameter ausgibt.
  - Ergebnis gegen manuell erstellte Erwartungsdatei vergleichen (z. B. `input/content/kbv-bundles/expected/Bundle-...-provide-parameters.json`).
  - Fehlerhafte Felder per `compare-mapping.py` visualisieren.
- **Abnahme:** Testlauf liefert valides Parameters-Resource und keine Vergleiche schlagen fehl.

### 3. Regressionstest fuer alle Bundles
- **Ziel:** Automatisierter Testrahmen fuer alle 5 Beispiel-Bundles.
- **Vorgehen:**
  - Shell-/Python-Testtreiber in `scripts/testscripts` erstellen (z. B. `run-all-tests.sh`).
  - Fuer jeden Bundle-Namen: Transformation ausfuehren, Ergebnis mit hinterlegtem Soll vergleichen, diff reporten.
  - Tests in CI integrieren (z. B. neues npm script oder GitHub Action Schritt).
- **Abnahme:** Ein Befehl prueft alle Bundles; Build schlaegt fehl, sobald eine Abweichung auftaucht.

### 4. Dokumentation erweitern
- **Ziel:** Deutsche Beschreibungsseite im IG inkl. Tabellen und Testfall-Referenzen.
- **Vorgehen:**
  - Neue Markdown-Seiten unter `input/pagecontent` (z. B. "Transformation" + "Testfaelle").
  - Inhalt: Kontext, Prozessbeschreibung, Links zu KBV- und Provide-Definitionen, Einbindung der generierten Tabellen (Beispiel: {% raw %}`{% include StructureMap-... %}`{% endraw %}).
  - Testfallabschnitt: Kurzbeschreibung je Bundle, Link zum erwarteten Output sowie Hinweis auf Testscripts.
- **Abnahme:** Seite erscheint im IG-Menue, Build laeuft ohne Fehler, Inhalte sind auf Deutsch konsistent.

### 5. Governance & Nachverfolgbarkeit
- **Ziel:** Sicherstellen, dass neue StructureMaps und Tests leicht aktualisiert werden koennen.
- **Vorgehen:**
  - README-Abschnitt "Mapping & Tests" hinzufuegen (Befehle, Ordnerstruktur, wie Markdown generiert wird).
  - Optional: Taskrunner (npm script oder Make) fuer `fml_table.sh` + Tests.

## Naechste Schritte
1. Strukturmap-Anforderungen sammeln (welche Ressource -> welcher Parameter) und ggf. Rueckfragen klaeren.
2. Aggregations-StructureMap modellieren und lokal testen.
3. Erwartete Provide-Prescription-Beispiele definieren, Testskripte anpassen, Regression aufsetzen.
4. Dokumentationsseiten aufbauen und im Menü verlinken.
