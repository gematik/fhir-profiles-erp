### Task aktivieren ($activate)

Die FHIR-Operation `$activate` aktiviert einen zuvor erstellten `Task` für das E‑Rezept.
Dabei wird das qualifiziert elektronisch signierte Verordnungsbundle (QES) an den E‑Rezept-Fachdienst übergeben.

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$activate` gesendet.

#### Auslösung

Das Primärsystem (PVS/KIS) ruft `$activate` auf, nachdem die Verordnung qualifiziert signiert wurde.

#### FHIR Operation API

<div class="gematik-api"
  data-api-type="FHIROperation"
  data-api-fhir-invoke-level="instance"
  data-api-operation-id="activateTask">
  <div id="CapabilityStatement">
    <pre>todo</pre>
  </div>
  <div id="OperationDefinition">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment OperationDefinition/ActivateOperation JSON %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment OperationDefinition/ActivateOperation XML %}
    </div>
  </div>
  <div id="Request-Examples">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Parameters/ExampleOperationActivateParametersInput JSON %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Parameters/ExampleOperationActivateParametersInput XML %}
    </div>
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Task/607255ed-ce41-47fc-aad3-cfce1c39963f JSON %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Task/607255ed-ce41-47fc-aad3-cfce1c39963f XML %}
    </div>
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment OperationOutcome/ExampleOperationActivateError JSON %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment OperationOutcome/ExampleOperationActivateError XML %}
    </div>
  </div>
</div>

### Geschäftslogik

Beispielhafte Beschreibung (wird in einem nächsten Schritt fachlich/technisch vervollständigt).

<figure>
  <div class="gem-ig-img-container" style="--box-width: 100%">
    <img src="./IG-ERP-BL-TASK-ACTIVATE.svg" alt="Geschäftslogik $activate" style="width: 100%;">
  </div>
  <figcaption><strong>Abbildung:</strong> Geschäftslogik für die Operation <i>$activate</i> (Beispiel)</figcaption>
</figure>

### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.
