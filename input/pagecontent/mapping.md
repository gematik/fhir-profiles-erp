Aufgabe des E-Rezept-Fachdienst ist es Verordnungs- und Dispensierungsdaten von Arzneimitteln an die ePA zu übermitteln.

Der E-Rezept-Fachdienst muss daher in der Lage sein, die von den verordnenden Systemen (z.B. Praxis- oder Krankenhausinformationssysteme) gelieferten Daten in die von der ePA geforderten Formate zu überführen und an den ePA Medication Service zu übertragen.
Dabei führt der E-Rezept-Fachdienst keine Interpretation oder Anreicherung von medizinischen Daten durch und führt daher rein technische Mappings aus. Die Mappings werden einer Anwendung der gematik definiert und in diesem Projekt als StructureMaps angegeben und mit Transformationsregeln ergänzt.

### Übertragen von *Verordnungsdaten* an den ePA Medication Service
([ePA Operation API: Verschreibungsdaten einstellen](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/op-provide-prescription-erp.html))

Der E-Rezept-Fachdienst empfängt die Verordnungsdaten durch Aufruf der [$activate-Operation](./op-activate.html) durch ein verordnendes System. Die empfangenen Daten entsprechen den Profilen und Vorgaben des E-Rezepts.
Die Seite [Mapping vom KBV_Bundle zu Provide_Prescription_Parameters](./mapping-verordnungsdaten.html) beschreibt das Mapping der empfangenen Daten zu den Parametern der $provide-prescription-Operation des ePA Medication Service.

### Übertragen von *Dispensierinformationen* an den ePA Medication Service
([ePA Operation API: Dispensierinformationen einstellen](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/op-provide-dispensation-erp.html))

Der E-Rezept-Fachdienst empfängt die Dispensierinformationen durch Abschluss eines Workflows mittels der [$dispense-Operation](./op-dispense.html) durch ein abgebendes System. Die empfangenen Daten entsprechen den Profilen und Vorgaben der Dispensierinformationen.

// TODO Beispiele