### Task erzeugen ($create)

Die FHIR-Operation `$create` erzeugt einen neuen `Task` für ein E-Rezept.
Die Operation steht ausschließlich verordnenden Leistungserbringern zur Verfügung.

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/$create` gesendet.

#### Auslösung

Das Primärsystem (PVS/KIS) ruft `$create` auf, um eine Rezept-ID (PrescriptionID) sowie einen AccessCode zu erhalten.

#### FHIR Operation API

<requirement conformance="SHALL" key="IG-ERP-101" title="E-Rezept-Fachdienst - Task erzeugen - Rollenprüfung" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Erzeugen eines Tasks mittels HTTP-POST/$create-Operation die Rolle <i>professionOID</i> des Aufrufenden im ACCESS_TOKEN im HTTP-RequestHeader <i>Authorization</i> feststellen und sicherstellen, dass ausschließlich verordnende Leistungserbringer die Operation aufrufen dürfen.
  <ul>
    <li>oid_praxis_arzt</li>
    <li>oid_zahnarztpraxis</li>
    <li>oid_praxis_psychotherapeut</li>
    <li>oid_krankenhaus</li>
    <li>oid_institution-vorsorge-reha</li>
  </ul>
</requirement>

<requirement conformance="SHALL" key="IG-ERP-102" title="E-Rezept-Fachdienst - Task erzeugen - Schemavalidierung Rezept anlegen" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS die im Body der HTTP-POST-Operation auf die Ressource Task übertragenen Parameter gegen das Schema <i>http://gematik.de/fhir/erp/OperationDefinition/CreateOperationDefinition</i> prüfen und bei Nicht-Konformität das Anlegen der Ressource im Fachdienst mit dem HTTP-Status-Code <i>400</i> beantworten.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-103" title="E-Rezept-Fachdienst - Parametrierung Task für Workflow-Typ" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Erzeugen eines Tasks mittels HTTP-POST/$create-Operation den Parameter <i>workflowType</i> (Rezepttyp) aus dem HTTP-Body des POST-Requests entnehmen, als Attribut <i>Task.extension:flowType</i> des zu erstellenden Tasks verwenden und bei Fehlen bzw. Nicht-Konformität des Parameters den Request als unzulässig abweisen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-104" title="E-Rezept-Fachdienst - Ergänzung Performer-Typ für Einlöseinstitutstyp" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Erzeugen eines Tasks das Feld <i>Task.performerType</i> aus dem übergebenen, gültigen Parameter <i>Task.extension:flowType</i> gemäß der Prozessparameter übernehmen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-105" title="E-Rezept-Fachdienst - Task erzeugen - Generierung Rezept-ID" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Anlegen eines neuen Tasks eine Rezept-ID gemäß der Bildungsregel generieren, als Identifier mit Namingsystem <i>https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PrescriptionId</i> dem Task hinzufügen und sicherstellen, dass diese Rezept-ID innerhalb von 11 Jahren nach ihrer Erzeugung nicht erneut vergeben wird.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-106" title="E-Rezept-Fachdienst - Task erzeugen - Task-ID=Rezept-ID" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Erzeugen eines neuen Tasks die Rezept-ID, welche mit Task an das verordnende Primärsystem übermittelt wird, als Task-ID verwenden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-107" title="E-Rezept-Fachdienst - Task erzeugen - Generierung AccessCode" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Erzeugen eines Tasks mittels HTTP-POST/$create-Operation eine 256 Bit Zufallszahl (hexadezimal kodiert, <i>[0-9a-f]{64}</i>) erzeugen und diese im zu speichernden Task als externe ID in <i>Task.identifier:AccessCode</i> hinzufügen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-108" title="E-Rezept-Fachdienst - Status draft" version="0">
  <meta lockversion="false"/>
  <actor name="eRp_FD">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS die zulässige Anlage eines Tasks mittels HTTP-POST/$create-Operation im Status <i>Task.status = draft</i> vollziehen und beim erfolgreichen Abschluss der Operation die angelegte Ressource Task im HTTP-Body der HTTP-Response zurückgeben.
</requirement>

<div class="gematik-api"
  data-api-type="FHIROperation"
  data-api-fhir-invoke-level="type"
  data-api-operation-id="createOperation">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
  <div id="OperationDefinition">
    <pre>
      {% include OperationDefinition-CreateOperation.json %}
    </pre>
  </div>
  <div id="Request-Examples">
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Parameters/OperationCreateParametersInputExample XML %}
    </div>
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Task/b12eb5f7-91ce-4887-93c7-800454601377 XML %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment OperationOutcome/ExampleOperationCreateError XML %}
    </div>
  </div>
</div>

### Geschäftslogik

Das folgende Aktivitätsdiagramm illustriert die Geschäftslogik der Operation `$create`.

{% include IG-ERP-BL-TASK-CREATE.svg %}

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.
