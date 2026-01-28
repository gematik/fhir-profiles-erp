### Technische Anwendungsfälle

Die folgenden technischen Anwendungsfälle ergänzen die fachlichen Anwendungsfälle zur Verordnung und Bereitstellung eines E-Rezepts.
Sie beschreiben die Interaktion des Primärsystems (PVS/KIS) mit dem E-Rezept-Fachdienst (Workflow-Ressource *Task*), sowie die dabei relevanten Artefakte.

Hinweis: Die konkreten Schnittstellenangaben werden im nächsten Schritt ergänzt; vorerst steht dort jeweils **todo**.

<a id="lesezugriffe"></a>
#### Lesezugriffe

Dieser technische Anwendungsfall beschreibt lesende Zugriffe im Kontext der ärztlichen Verordnung. Dazu zählen insbesondere die Abfrage von Task-Informationen (z.B. Status), sowie der Abruf von in der Primärsystem-Logik benötigten Metadaten.

<em>Schnittstelle:</em> <i>todo</i>

Typische Inhalte/Ergebnisse:

- Abfrage des aktuellen Task-Status zur Einordnung des Workflows (z.B. `draft`, `ready`).
- Abruf/Anzeige von für den Prozess relevanten Identifikatoren (z.B. Rezept-ID / PrescriptionID).

<a id="e-rezept-erstellen"></a>
#### E-Rezept erstellen

Technische Einordnung des fachlichen Use Cases „E-Rezept erstellen“:

- Ein Task wird im E-Rezept-Fachdienst angelegt, um eine Rezept-ID (PrescriptionID) zu erhalten.
- Der E-Rezept-Fachdienst erzeugt zusätzlich einen AccessCode, der für nachfolgende, berechtigte Operationen benötigt wird.

<em>Schnittstelle:</em> <i>todo</i>
<em>Schnittstelle:</em> <i><a href="./todo.html">todo</a></i>
<em>Schnittstelle:</em> <i><a href="./op-create.html">Operation API: E-Rezept erstellen</a></i>

<a id="e-rezept-qualifiziert-signieren"></a>
#### E-Rezept qualifiziert signieren

Technische Einordnung des fachlichen Use Cases „E-Rezept qualifiziert signieren“:

- Der Verordnungsdatensatz wird im Primärsystem mittels HBA qualifiziert elektronisch signiert (QES).
- Die QES wird typischerweise über den Konnektor erstellt; die signierten Nutzdaten werden anschließend für die Bereitstellung verwendet.

<em>Schnittstelle:</em> <i>todo</i>

<a id="e-rezept-vervollstaendigen-und-task-aktivieren"></a>
#### E-Rezept vervollständigen und Task aktivieren

Technische Einordnung des fachlichen Use Cases „E-Rezept vervollständigen und Task aktivieren“:

- Der QES-signierte Verordnungsdatensatz wird am referenzierten Task hinterlegt.
- Der E-Rezept-Fachdienst validiert Signatur und Schemakonformität und setzt bei Erfolg den Task-Status auf `ready`.

<em>Schnittstelle:</em> <i><a href="./op-activate.html">Operation API: E-Rezept aktivieren</a></i>

Technischer Ablauf (vereinfachte Sicht):

- Das Primärsystem ruft die Operation zur Aktivierung des referenzierten Tasks auf und übergibt dabei die QES-signierten Verordnungsdaten gemäß Operationsdefinition.
- Der E-Rezept-Fachdienst prüft u.a. die Berechtigung (z.B. AccessCode am Task), die Integrität der Signatur sowie die Schemakonformität der fachlichen Nutzdaten.
- Bei erfolgreicher Prüfung hinterlegt der E-Rezept-Fachdienst die Nutzdaten serverseitig und verknüpft sie mit dem Workflow (Task) so, dass die nachfolgende Einlösung/Belieferung möglich ist.

Relevante Datenmodelle und Relationen (konzeptionell):

- *Task* (Workflow-Ressource)
	- Status-Transition: `draft` → `ready`.
	- Referenzierung der bereitgestellten Verordnungsdaten (z.B. über `Task.input` auf eine serverseitig gespeicherte Ressource).
- *Binary* (Transport-/Persistenz-Container)
	- Persistierung der vom Primärsystem übermittelten, signierten Nutzdaten (QES/PKCS#7/CAdES) als serverseitiges Artefakt.
	- Verknüpfung vom Task auf diese Persistenz (indirekt über Referenzen in `Task.input`/`Task.output`).
- Verordnungsdaten (fachliche Payload, typischerweise als Bundle gemäß KBV/ERP-Profilen)
	- Inhaltliche Konsistenzprüfungen (z.B. Identifikatoren, Prüfziffern, flowtype-spezifische Constraints) erfolgen im Rahmen der Aktivierung.

Ergebnis:

- Bei Erfolg liefert der E-Rezept-Fachdienst den aktualisierten Task zurück (inkl. `ready`), sodass der Einlöse-Workflow starten kann.
- Bei Fehlern erfolgt eine ablehnende Antwort gemäß Operationsdefinition (z.B. fehlende/ungültige Berechtigung, ungültige Signatur, nicht schemakonforme oder fachlich inkonsistente Daten).

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="./t-uc-activate-diagram.png" alt="Anwendungsfall E-Rezept einstellen" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Anwendungsfall E-Rezept einstellen</figcaption>
</figure>

<br>

Im E-Rezept-Fachdienst Datenraum werden die folgenden Verknüpfungen und Datenmodelle verwendet, um den Anwendungsfall technisch umzusetzen:

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        {% include IG-ERP-DM-TASK-INPUT-REFERENCES.svg %}
    </div>
    <figcaption><strong>Abbildung: </strong>todo</figcaption>
</figure>

<br>

<a id="e-rezept-loeschen"></a>
#### E-Rezept löschen

Technische Einordnung des fachlichen Use Cases „E-Rezept löschen“:

- Das E-Rezept wird (solange es nicht in Belieferung ist) über den E-Rezept-Fachdienst widerrufen/gelöscht.
- Technisch bedeutet dies, dass der referenzierte Task gelöscht wird; Nutzdaten werden dabei nicht mehr bereitgestellt.

<em>Schnittstelle:</em> <i><a href="./op-abort.html">Operation API: E-Rezept löschen</a></i>

<a id="epa-ms"></a>
#### Übertragen an den ePA MedicationService

Technische Einordnung des fachlichen Use Cases „E-Rezept löschen“:

- Das E-Rezept wird (solange es nicht in Belieferung ist) über den E-Rezept-Fachdienst widerrufen/gelöscht.
- Technisch bedeutet dies, dass der referenzierte Task gelöscht wird; Nutzdaten werden dabei nicht mehr bereitgestellt.

<em>Schnittstelle:</em> <i><a href="./op-abort.html">Operation API: E-Rezept löschen</a></i>