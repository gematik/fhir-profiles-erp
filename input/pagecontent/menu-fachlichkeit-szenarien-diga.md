{% assign use_cases = site.data.use-cases %}

Das E-Rezept für Digitale Gesundheitsanwendungen (DiGA) ersetzt das Muster-16-Verfahren und sorgt dafür, dass zertifizierte DiGAs medienbruchfrei, sicher und nachvollziehbar verordnet, an Kostenträger übermittelt und freigeschaltet werden können. Es ergänzt die bestehenden Abläufe des E-Rezepts, erweitert sie um Psychotherapeutinnen und Psychotherapeuten sowie Kostenträger und ermöglicht eine vollständig digitale Bereitstellung der Freischaltcodes.

## Vorteile durch das E-Rezept für DiGA

- Versicherte müssen Anträge und Muster-16-Vordrucke nicht mehr postalisch einreichen, sondern erhalten Verordnungen sofort im E-Rezept-FdV oder optional als Ausdruck (§360 Abs. 9 SGB V).
- Ärztinnen, Zahnärzte und Psychotherapeutinnen nutzen etablierte E-Rezept-Prozesse weiter, inklusive QES und Workflowsteuerung, wodurch Schulungs- und Dokumentationsaufwände sinken.
- Krankenkassen empfangen Anfragen überwiegend digital, können die Verordnungsdaten strukturiert abrufen und sparen manuelle Bearbeitung der Papierformulare.
- Der E-Rezept-Fachdienst dokumentiert Bereitstellung und Nutzung des Freischaltcodes transparent, was Missbrauch erschwert und revisionssichere Nachweise liefert.

## DiGA-Verordnung erstellen

PVS/KIS greifen auf das BfArM-DiGA-Verzeichnis zu, wählen die passende PZN (inklusive indikations- oder laufzeitbezogener Varianten) und erzeugen eine elektronische Verordnung. Nach Vergabe der PrescriptionID wird die Verordnung qualifiziert elektronisch signiert, an den E-Rezept-Fachdienst übermittelt und dort als Flowtype 162 geprüft. Ärztinnen, Zahnärzte und Psychotherapeutinnen folgen damit den gleichen QES- und Aktivierungsabläufen wie bei Arzneimitteln; bei TI-Störungen steht das Muster 16 weiterhin als Ersatzverfahren bereit.

> Offener Punkt: Das BMG und die KBV stimmen ab, ob die PZN dauerhaft als Identifier genutzt wird. Das Datenmodell wird an das Ergebnis angepasst.

**Beteiligte Systeme:** PVS/KIS (inkl. Psychotherapeut:innen-Systeme), Konnektor, E-Rezept-Fachdienst

**Fachliche Anwendungsfälle**

{% assign scenario_use_cases = "E_Rezept_erstellen, E_Rezept_qualifiziert_signieren, E_Rezept_vervollstaendigen_und_Task_aktivieren" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Fachliche Anwendungsfälle mit Bezug zu Szenario <i>DiGA</i>" %}

## DiGA zuweisen und Freischaltcode anfordern

Versicherte sehen neue DiGA-Verordnungen im E-Rezept-FdV (oder erhalten einen Ausdruck) und weisen sie ihrem Kostenträger zu. Das E-Rezept-FdV ermittelt – idealerweise automatisch – die Telematik-ID der Krankenkasse über das FHIR-VZD, erstellt eine `Communication_DispReq` und übermittelt den E-Rezept-Token. Alternativ können Versicherte den Ausdruck per Post, Servicecenter oder Krankenkassen-App einreichen; der Kostenträger startet daraufhin selbst den Abruf. Status- und Protokolleinträge im FdV machen den Fortschritt (Freischaltcode angefordert, in Prüfung, erledigt) sichtbar.

**Beteiligte Systeme:** E-Rezept-FdV nach §360 Abs. 10 SGB V, Krankenkassen-App, Kostenträger-Backend, E-Rezept-Fachdienst

**Fachliche Anwendungsfälle**

{% assign scenario_use_cases = "DiGA_E_Rezept_zuweisen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Fachliche Anwendungsfälle mit Bezug zu Szenario <i>Zuweisung der DiGA-Verordnung</i>" %}

## Prüfung durch Kostenträger und Bereitstellung des Freischaltcodes

Kostenträger authentisieren sich über ihren Basis-Consumer, rufen das E-Rezept mit `$accept` ab und prüfen Anspruch, Indikation sowie ggf. ergänzende Unterlagen. Nach erfolgreicher Prüfung erzeugen sie den Freischaltcode, legen ihn als Abgabeinformation via `$dispense` oder `$close` im E-Rezept-Fachdienst ab und schließen den Workflow mit einer Quittung ab. Falls kein Freischaltcode ausgegeben werden kann, hinterlegen sie eine versichertenfreundliche Begründung, damit Versicherte den Ausgang im FdV nachvollziehen können. Die gespeicherten Abgabeinformationen stehen – wie bei Arzneimitteln – auch der ePA zur Verfügung.

**Beteiligte Systeme:** Kostenträger-Backend inkl. Basis-Consumer, E-Rezept-Fachdienst, interne Freischaltcode-Services

**Fachliche Anwendungsfälle**

{% assign scenario_use_cases = "DiGA_E_Rezept_abrufen_kostentraeger, DiGA_Freischaltcode_bereitstellen" | split: ", " %}

{% include use-case-overview.table.html scenario_use_case_ids=scenario_use_cases use_cases=use_cases caption="Fachliche Anwendungsfälle mit Bezug zu Szenario <i>Freischaltcode-Bereitstellung durch Kostenträger</i>" %}
