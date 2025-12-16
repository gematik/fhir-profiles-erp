Diese Seite beschreibt Anforderungen und Umsetzungsunterstützung für das Mapping vom [KBV_FOR_PR_Practitioner](https://simplifier.net/packages/kbv.ita.for/1.2.1/files/3157104) zum [PractitionerDirectory](https://simplifier.net/packages/de.gematik.fhir.directory/1.0.0/files/2970193).

### Generelles Mapping des Profils

Die folgende Tabelle stellt generell das Mapping der beiden Profile gegenüber:

{% include StructureMap-KBVPrForPractitionerMap-intro.md %}

### Transformationsregeln

Folgende zusätzliche Anmerkungen und Regeln sind für das Mapping zu umzusetzen:

#### Bildung des Practitioner.name.text

Der Practitioner.name.text ist ein Pflichtfeld und muss im aus den Namensinformation erzeugt werden.

Dabei ist folgende Bildungsregel anzuwenden:


```
def build_practitioner_name(practitioner):
    # Verknüpft Elemente einer Liste zu einem String, getrennt durch Leerzeichen
    def join_with_space(elements):
        return " ".join(elements)

    # Hilfsfunktion zum Abrufen des Werts einer Extension
    def get_extension_value(extensions, url):
        for ext in extensions:
            if ext.get('url') == url:
                return ext.get('valueString') or ext.get('valueCode', '')
        return ""

    # Namenszusätze und Präfix-Qualifier URLs
    namenszusatz_url = "http://hl7.org/fhir/StructureDefinition/humanname-namenszusatz"
    nachname_url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
    vorsatzwort_url = "http://hl7.org/fhir/StructureDefinition/humanname-own-prefix"
    prefix_qualifier_url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier"

    # Zusätzliche Namenskomponenten aus den Extensions abrufen
    family_extensions = practitioner['name'][0]['family']['extension']
    namenszusatz = get_extension_value(family_extensions, namenszusatz_url)
    nachname = get_extension_value(family_extensions, nachname_url)
    vorsatzwort = get_extension_value(family_extensions, vorsatzwort_url)
    prefix_extensions = practitioner['name'][0].get('prefix', [{}])[0].get('extension', [])
    prefix_qualifier = get_extension_value(prefix_extensions, prefix_qualifier_url)

    # Zusammensetzung des Namens
    prefix = join_with_space([practitioner['name'][0].get('prefix', {}).get('value', '')])
    given_name = practitioner['name'][0].get('given', "")
    family_name = f"{vorsatzwort} {nachname} {namenszusatz}".strip()

    # Zusammensetzen des vollständigen Namens mit Leerzeichen dazwischen
    full_name = f"{prefix_qualifier} {prefix} {given_name} {family_name}".strip()

    return full_name

# Beispielhafte Verwendung
practitioner_example = {
    "name": [
        {
            "use": "official",
            "family": {
                "extension": [
                    {"url": "http://hl7.org/fhir/StructureDefinition/humanname-namenszusatz", "valueString": "von"},
                    {"url": "http://hl7.org/fhir/StructureDefinition/humanname-own-name", "valueString": "Müller"},
                    {"url": "http://hl7.org/fhir/StructureDefinition/humanname-own-prefix", "valueString": "Dr."}
                ],
                "family": "Müller"
            },
            "given": "Hans",
            "prefix": [
                {
                    "extension": [
                        {"url": "http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier", "valueCode": "AC"}
                    ],
                    "value": "Prof."
                }
            ]
        }
    ]
}
print(build_practitioner_name(practitioner_example))
```