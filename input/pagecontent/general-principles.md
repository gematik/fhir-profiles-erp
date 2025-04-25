Diese Seite enthält Inhalt

### Generelle Prinzipien

Dieser Leitfaden verwendet die Schlüsselwörter **MUSS**, **DARF NICHT**, **SOLL NICHT** und **KANN** als deutsche Pendants des [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119), um Anforderungen als Ausdruck normativer Festlegungen zu kennzeichnen.

Der E-Rezept-Fachdienst muss allgemeine TI-weite Anforderungen wie Paginierung und Suche- und Sortierung umsetzen. Das Capabilitystatement legt für jede Ressource fest, welche Suchparameter und Operationen erlaubt sind.

<requirement actor="E-Rezept-Fachdienst" conformance="SHALL" key="IG-FD-ERP69444KX6" title="Implementierung allgemeingültiger Anforderungen an FHIR Data Services" version="1">
    Der E-Rezept-Fachdienst MUSS als Ausprägung eines FHIR Data Service sämtliche Anforderungen aus <a href="https://gemspec.gematik.de/fhir/ig/epa-common/1.0.5/actor-erp-fd.html" target="_blank"><i>TI Common</i></a> berücksichtigen.
</requirement>


### Schnittstellenimplementierung

<requirement actor="E-Rezept-Fachdienst" conformance="SHALL" key="IG-FD-ERP87682CQQ" title="Schnittstellenimplementierung des E-Rezept-Fachdienst gemäß FHIR-Spezifikation" version="1">
    Der E-Rezept-Fachdienst MUSS die in diesem Leitfaden definierten Schnittstellen (d.h. <a href="./query-api.html">Query API</a>, und <a href="./operation-api.html">Operation API</a>) implementieren und dabei die Vorgaben der <a href="http://hl7.org/fhir/R4/index.html">FHIR-Spezifikation</a> berücksichtigen. Der Anbieter des MUSS die Konformität in einem Zulassungsverfahren nachweisen.
</requirement>


#### Rückgabewerte

<requirement actor="E-Rezept-Fachdienst" conformance="SHALL" key="IG-FD-ERP83152PPV" title="Implementierung der /metadata Funktion im E-Rezept-Fachdienst" version="1">
    Der E-Rezept-Fachdienst MUSS die Funktion <code>GET [base]/metadata</code> implementieren. Diese Funktionalität stellt sicher, dass bei einem Aufruf von <code>/metadata</code> das FHIR CapabilityStatement des Servers zurückgegeben wird. Dieses Capability Statement bietet eine detaillierte Beschreibung der Fähigkeiten des E-Rezept-Fachdienstes und ist entscheidend für das Verständnis der unterstützten FHIR-Funktionalitäten.
</requirement>