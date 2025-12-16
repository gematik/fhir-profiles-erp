Der E-Rezept-Fachdienst hat einen Exporter, der Daten aus dem E-Rezept Kontext an den Medication Service der ePA überträgt, damit Medikationsdaten automatisch in der elektronischen Medikationsliste (eML) erscheinen. 

Der E-Rezept-Fachdienst muss für die Verordnungen und Dispensierungen von Arzneimitteln Daten für die Übertragung an das ePA Aktensystem aufbereiten:

1. Übertragen von Verordnungsdaten an den ePA Medication Service ([Operation API: Verschreibungsdaten einstellen](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/op-provide-prescription-erp.html))
2. Übertragen von Dispensierinformationen an den ePA Medication Service ([Operation API: Dispensierinformationen einstellen](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/op-provide-dispensation-erp.html))

Der E-Rezept-Fachdienst führt keine Interpretation oder Anreicherung von medizinischen Daten durch und führt daher rein technische Mappings aus. Die Mappings werden einer Anwendung der gematik definiert und in diesem Projekt als StructureMaps angegeben.

Die folgenden Seiten beschreiben für jedes Profil, was vom E-Rezept-Fachdienst gemappt wird, wie das Mapping aussieht und welche Daten an den ePA Medication Service übertragen werden:

- [Mapping vom KBV_Bundle zu Provide_Prescription_Parameters](./mapping-bundle-parameters.html)

{% sql select '[' + Name + '](StructureMap-' + Name + '.html)' as Name, Description from Resources where Type = 'StructureMap' %}

Die folgenden Beispiele zeigen funktional, wie das mapping für konkrete Instanzen aussieht.

### Beispiele für das Mapping von Verordnungsdaten

{% include provide-prescription-mappings.md %}

### Beispiele für das Mapping von Dispensierdaten

//TODO: include provide-prescription-mappings.md
