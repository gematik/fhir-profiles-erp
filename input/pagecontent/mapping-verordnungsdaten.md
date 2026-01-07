{% assign transformation-rules = site.data['transformation-rules'] %}

Nach einstellen eines E-Rezepts durch ein verordnendes System müssen die Verordnungsdaten an den ePA Medication Service übermittelt werden. 

Die Verordnung wird technisch als ein [KBV_PR_ERP_Bundle](https://simplifier.net/erezept/kbv_pr_erp_bundle) eingestellt und muss an den ePA Medication Service in die [Provide_Prescription_Parameters](https://gemspec.gematik.de/ig/fhir/epa-medication/{{ site.data.constants.epa_med_service_version }}/profiles-provide-prescription-parameters.html) Struktur überführt werden.


<figure>
    <div class="gem-ig-img-container" style="--box-width: 400px; margin-bottom: 30px;">
        <img src="./bundle-transform.png" alt="Transformation des Bundles" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Transformation des KBV_PR_ERP_Bundle in Provide_Prescription_Parameters</figcaption>
</figure>

<br>

### StructureMap für Verordnungsdaten

Für diese Transformation werden StructureMaps verwendet, die durch zusätzliche Transformationsregeln ergänzt werden. Die StructureMap, die als Einstieg das Mapping des KBV_PR_ERP_Bundle in Provide_Prescription_Parameters durchführt ist [KBVPrErpBundleMap](./StructureMap-KBVPrErpBundleMap.html). Dort ist tabellarisch beschrieben, wie die einzelnen Elemente des KBV_PR_ERP_Bundle in die entsprechenden Elemente der Provide_Prescription_Parameters Struktur überführt werden und welche Mappings für die enthaltenen Ressourcen verwendet werden.

Diese Structuremap kann in Kombination mit den StructureMaps aus diesem Projekt verwendet werden, um die Verordnungsdaten in die von der ePA geforderten Formate zu überführen.

Die folgenden Seiten beschreiben die Mappings der einzelnen Ressourcen im Detail:
- [Mapping der Patient Ressource](./mapping-patient.html)
- [Mapping der Practitioner Ressource](./mapping-practitioner.html)
- [Mapping der Organization Ressource](./mapping-organization.html)
- [Mapping der MedicationRequest Ressource](./mapping-medicationrequest.html)
- [Mapping der Medication Ressource](./mapping-medication.html)


### Transformationsregeln für Verordnungsdaten

Einige Daten müssen zusätzlich durch Transformationsregeln angepasst oder ergänzt werden. Die folgenden Transformationsregeln werden für das Mapping von Verordnungsdaten verwendet:

{% for transformation-rule in transformation-rules %}

{% include transformation-rules-details-table.html transformation-rule=transformation-rule mapping="provide-prescription" level=4 %}

{% endfor %}