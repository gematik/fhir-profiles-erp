Das E-T-Rezept stellt sicher, dass Arzneimittel nach §3a Abs. 1 Satz 1 AMVV (Lenalidomid, Pomalidomid, Thalidomid) digital, sicher und effizient verordnet werden können. Es löst das papiergebundene Verfahren ab, reduziert damit Verwaltungsaufwände bei Ärzten und Apotheken und verbessert gleichzeitig die inhaltliche Qualität der Verordnungen.

## Vorteile durch das E-T-Rezept

- Ärztinnen und Ärzte müssen sich nicht mehr separat beim BfArM registrieren oder Formblätter bestellen, da der elektronische Heilberufsausweis (HBA) die Berechtigung nachweist.
- Druck, Lagerung und Versand der bisherigen Formulare entfallen und der digitale Durchschlag wird automatisiert an das BfArM übermittelt.
- Pflichtangaben (z. B. Reichdauer, Aufklärung) werden bereits beim Verordnen geprüft, wodurch fehlerhafte oder unvollständige Rezepte vermieden werden.
- Das BfArM kann eingehende Daten strukturierter prüfen und schneller auf Auffälligkeiten reagieren (z. B. bei gebärfähigen Patientinnen), weil keine manuellen Schwärzungen oder postalischen Verzögerungen mehr anfallen.

## E-T-Rezept ausstellen

E-T-Rezepte können in der ambulanten vertragsärztlichen Versorgung sowie im Entlassmanagement durch alle Ärztinnen und Ärzte mit gültigem HBA ausgestellt werden. Tierärzte und Zahnärzte sind ausgeschlossen. Die bestehenden Prozesse zur Erstellung und Signatur eines E-Rezepts werden weiterverwendet; sie müssen für Versicherte aller Kostenträger verfügbar sein.

Das Primärsystem kennzeichnet jede Verordnung eines §3a-AMVV-Arzneimittels zwingend als „T-Rezept“ und stellt sicher, dass dieses Tag nicht versehentlich bei anderen Arzneimitteln verwendet wird. Zusätzlich müssen gemäß §3a AMVV folgende Angaben erfasst werden:

1. Bestätigung, dass die Sicherheitsmaßnahmen der aktuellen Fachinformation eingehalten werden und ggf. ein Schwangerschafts-Präventionsprogramm durchgeführt wird (§3a Abs. 2).
2. Bestätigung, dass Patientinnen oder Patienten vor Therapiebeginn geeignete Informationsmaterialien erhalten haben (§3a Abs. 2).
3. Kennzeichnung, falls die Behandlung außerhalb zugelassener Anwendungsgebiete erfolgt (§3a Abs. 2).
4. Angabe, ob es sich um eine Verschreibung für eine gebärfähige Frau handelt (§3a Abs. 3).
5. Dokumentation der Reichdauer, wobei die gesetzlichen Obergrenzen von vier Wochen (gebärfähige Frauen) bzw. zwölf Wochen einzuhalten sind (§3a Abs. 3).
6. Bestätigung ausreichender Sachkenntnisse zur Verordnung nach §3a Abs. 1 Satz 1 AMVV (§3a Abs. 5).

Das Primärsystem unterstützt bei der Berechnung der Reichdauer (beispielsweise anhand Packungsgrößen und Dosierungen) und warnt bei Überschreitung der zulässigen Grenzen. Wiederkehrende Angaben wie die Sachkenntnisbestätigung können nach der ersten Erfassung automatisch vorausgefüllt werden, während andere Pflichtangaben jedes Mal bewusst bestätigt werden müssen.

Falls technisch kein E-T-Rezept ausgestellt werden kann, ist weiterhin das amtliche Formblatt zu verwenden. Verordnungen für Stations- oder Praxisbedarf, Mehrfachverordnungen sowie direkte Zuweisungen an eine Apotheke sind ausgeschlossen.

**Beteiligte Systeme:** PVS, E-Rezept-Fachdienst

**Fachliche Anwendungsfälle**

{% assign scenario_use_cases = "E_Rezept_erstellen, E_Rezept_qualifiziert_signieren, E_Rezept_vervollstaendigen_und_Task_aktivieren, E_Rezept_loeschen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Fachliche Anwendungsfälle mit Bezug zu Szenario <i>Verordnung von E-T-Rezepten</i>" %}

## E-T-Rezept einlösen, dispensieren und abrechnen

Versicherte lösen E-T-Rezepte über dieselben Kanäle wie andere E-Rezepte ein (E-Rezept-FdV, Ausdruck, eGK in der Apotheke), jedoch weder im EU-Ausland noch über Versandapotheken. Die Einlösefrist beträgt sechs Kalendertage ab Ausstellung; der E-Rezept-Fachdienst stellt die Fristüberwachung sicher. Rezepte mit dem Kennzeichen „Entlassrezept“ dürfen zu Lasten der GKV nur drei Werktage beliefert werden, bleiben anschließend aber bis zum Ablauf der Gültigkeit als Selbstzahlerrezept nutzbar.

Apothekensysteme verarbeiten E-T-Rezepte wie andere apothekenpflichtige Verordnungen, zeigen jedoch die Kategorie „T-Rezept“ sowie alle zusätzlichen Angaben aus §3a Abs. 2, 3 und 5 AMVV prominent an. Versandbelieferung ist ausgeschlossen (§17 Abs. 2b ApBetrO).

Für jedes belieferte E-T-Rezept muss die Apotheke zwingend die Quittung abrufen, damit der digitale Durchschlag an das T-Register übertragen werden kann.

> Offener Punkt: Das BMG prüft, ob in der ApBetrO eine Pflicht zur Dokumentation des Zeitpunkts des Quittungsabrufs verankert wird.

**Beteiligte Systeme:** AVS, E-Rezept-Fachdienst

**Fachliche Anwendungsfälle**

{% assign scenario_use_cases = "E_Rezept_abrufen_apotheke, E_Rezept_abgabe_dokumentieren, E_Rezept_abgabe_abschliessen, E_Rezept_loeschen, E_Rezept_secret_wiederherstellen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Fachliche Anwendungsfälle mit Bezug zu Szenario <i>Belieferung von E-T-Rezepten</i>" %}

## Übermittlung an das BfArM T-Register

Der E-Rezept-Fachdienst überträgt gemäß §3a Abs. 7 AMVV die für das BfArM erforderlichen Informationen als „digitalen Durchschlag E-T-Rezept“ an den BfArM-Webdienst. Die Übermittlung erfolgt unverzüglich, nachdem die Apotheke die Quittung abgerufen hat, und ermöglicht dem BfArM die gesetzlich vorgeschriebene Auswertung und Archivierung der strukturierten Daten.

> Disclaimer: Das BMG und das BfArM stimmen aktuell ab, wie der „digitale Durchschlag E-T-Rezept“ in der AMVV präziser beschrieben wird.

**Beteiligte Systeme:** E-Rezept-Fachdienst, BfArM Webdienst

Für eine übersicht der fachlichen Anwendungsfälle mit Bezug zu diesem Szenario siehe [Beschreibung Fachlichkeit für die Übermittung an das BfArM T-Register](https://gemspec.gematik.de/ig/fhir/erp-t-prescription/1.1.0/index.html).