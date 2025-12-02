Der E-Rezept-Fachdienst hat einen Exporter, der Daten aus dem E-Rezept Kontext an den Medication Service der ePA überträgt, damit Medikationsdaten automatisch in der elektronischen Medikationsliste (eML) erscheinen. 

Der E-Rezept-Fachdienst muss für die Verordnungen und Dispensierungen von Arzneimitteln Daten für die Übertragung an das ePA Aktensystem aufbereiten:

1. Übertragen von Verordnungsdaten an den ePA Medication Service ([Operation API: Verschreibungsdaten einstellen](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/op-provide-prescription-erp.html))
2. Übertragen von Dispensierinformationen an den ePA Medication Service ([Operation API: Dispensierinformationen einstellen](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/op-provide-dispensation-erp.html))

Der E-Rezept-Fachdienst führt keine Interpretation oder Anreicherung von medizinischen Daten durch und führt daher rein technische Mappings aus. Die Mappings werden einer Anwendung der gematik definiert und in diesem Projekt als StructureMaps angegeben. Die Ressourcenseiten der StructrureMaps enthalten jeweils eine Tabelle, die darstellt welche Daten gemappt werden.

{% sql select Name, Title, Description from Resources where Type = 'StructureMap' %}

Die folgenden Beispiele zeigen funktional, wie das mapping für konkrete Instanzen aussieht:

### Beispiele für das Mapping von Verordnungsdaten

{% include provide-prescription-mappings.md %}

### Beispiele für das Mapping von Dispensierdaten

//TODO: include provide-prescription-mappings.md
