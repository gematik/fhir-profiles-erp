{% assign transformation-rules = site.data['transformation-rules'] %}

Nach Einstellen eines E-Rezepts durch ein verordnendes System müssen die Verordnungsdaten an den ePA Medication Service übermittelt werden. 

Die Verordnung wird technisch als ein [KBV_PR_ERP_Bundle](https://simplifier.net/erezept/kbv_pr_erp_bundle) eingestellt und muss an den ePA Medication Service in die [EPAOpProvidePrescriptionERPInputParameters](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/profiles-provide-prescription-parameters.html) Struktur überführt werden.

<figure>
    <div class="gem-ig-img-container" style="--box-width: 400px; margin-bottom: 30px;">
        <img src="./bundle-transform.png" alt="Transformation des Bundles" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Transformation des KBV_PR_ERP_Bundle in EPAOpProvidePrescriptionERPInputParameters</figcaption>
</figure>

<br>

Hierbei werden verschiedene Quellen benötigt, um die Daten vollständig zu überführen:
- Der Verordnungsdatensatz als KBV_PR_ERP_Bundle
- Der ACCESS_TOKEN der Anfrage zur $activate-Operation

## Übersicht des Mappingvorgehens

Für dieses Mapping wird ein FHIR-Bundle in eine FHIR-Parameters Struktur überführt. Ein FHIR Bundle enthält eine Liste von FHIR-Ressourcen (entries). Dort ist tabellarisch beschrieben, wie die einzelnen Elemente des KBV_PR_ERP_Bundle in die entsprechenden Elemente der Provide_Prescription_Parameters Struktur überführt werden und welche Mappings für die enthaltenen Ressourcen verwendet werden.

Die folgende Seite beschreibt das generelle Mapping des Bundles:
- [Mapping der Bundle Ressource](./mapping-prescription-bundle-parameters.html)

Diese Structuremap kann in Kombination mit den StructureMaps aus diesem Projekt verwendet werden, um die Verordnungsdaten in die von der ePA geforderten Formate zu überführen.

Die folgenden Seiten beschreiben die Mappings der einzelnen Ressourcen im Detail:
- [Mapping der Practitioner Ressource](./mapping-prescription-practitioner.html)
- [Mapping der Organization Ressource](./mapping-prescription-organization.html)
- [Mapping der MedicationRequest Ressource](./mapping-prescription-medicationrequest.html)
- [Mapping der Medication Ressource](./mapping-prescription-medication.html)

## Transformationsregeln für Verordnungsdaten

Einige Daten müssen zusätzlich durch Transformationsregeln angepasst oder ergänzt werden. Die folgenden Transformationsregeln werden für das Mapping von *Verordnungsdaten* verwendet:

{% for transformation-rule in transformation-rules %}

{% include transformation-rules-details-table.html transformation-rule=transformation-rule mapping="provide-prescription" level=4 %}

{% endfor %}