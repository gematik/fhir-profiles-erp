### Task abbrechen ($abort)

Die FHIR-Operation `$abort` bricht den Workflow eines E-Rezepts ab und löscht alle Daten, die mit der referenzierten Aufgabe zusammenhängen.

### Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$abort` gesendet.

Hinweis: Der Zugriff erfolgt je nach Akteur über URL-Parameter:

- Patient/(Z)PVS: `?ac=...`
- Apotheke: `?secret=...`

#### FHIR Operation API

<div class="gematik-api"
  data-api-type="FHIROperation"
  data-api-fhir-invoke-level="instance"
  data-api-operation-id="abortTask">
  <div id="CapabilityStatement">
    <pre>todo</pre>
  </div>
  <div id="OperationDefinition">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment OperationDefinition/AbortOperation JSON %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment OperationDefinition/AbortOperation XML %}
    </div>
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment OperationOutcome/ExampleOperationAbortErrorPVS JSON %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment OperationOutcome/ExampleOperationAbortErrorPVS XML %}
    </div>
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment OperationOutcome/ExampleOperationAbortErrorAVS JSON %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment OperationOutcome/ExampleOperationAbortErrorAVS XML %}
    </div>
  </div>
</div>

### Geschäftslogik

Beispielhafte Beschreibung (wird in einem nächsten Schritt fachlich/technisch vervollständigt).

{% include IG-ERP-BL-TASK-ABORT.svg %}


### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.
