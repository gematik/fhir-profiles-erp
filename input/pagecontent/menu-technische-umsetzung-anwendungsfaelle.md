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

<a id="e-rezept-loeschen"></a>
#### E-Rezept löschen

Technische Einordnung des fachlichen Use Cases „E-Rezept löschen“:

- Das E-Rezept wird (solange es nicht in Belieferung ist) über den E-Rezept-Fachdienst widerrufen/gelöscht.
- Technisch bedeutet dies, dass der referenzierte Task gelöscht wird; Nutzdaten werden dabei nicht mehr bereitgestellt.

<em>Schnittstelle:</em> <i><a href="./op-abort.html">Operation API: E-Rezept löschen</a></i>