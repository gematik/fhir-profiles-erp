## E-Rezept Workflow

Diese Spezifikation beschreibt die Datenmodelle des E-Rezept Workflow.

Die Fachanwendung E-Rezept ermöglicht die Übermittlung von ärztlichen bzw. zahnärztlichen Verordnungen in elektronischer Form. In der ersten Stufe sind dies Verordnungen für apothekenpflichtige Arzneimittel. In weiteren Ausbaustufen wird die Anwendung um weitere Verordnungen wie Betäubungsmittel (BtM), T-Rezepte sowie Heil- und Hilfsmittel erweitert.

Die erstellten FHIR Profile richten sich an die Implementierer und Nutzer der Schnittstellen der Fachanwendung E-Rezept. Die Profile bilden dabei das technische Grundgerüst der Informationsobjekte zur Umsetzung des Projektes E-Rezept. Sie stehen in Verbindung mit den von der KBV definierten fachlichen Informationsobjekten (https://simplifier.net/eRezept/~introduction). 

Folgende Dokumente gelten über die Datenmodelle hinaus:

- API Dokumentation am E-Rezept-Fachdienst [ERP-API-Doc](https://github.com/gematik/api-erp)
- Die Spezifikation für den E-Rezept-Fachdienst findet sich unter [gemSpec_FD_eRp](https://gemspec.gematik.de/docs/gemSpec/gemSpec_FD_eRp/latest/)
- Implementierungsleitfaden für Primärsystem Hersteller [gemILF_PS_eRp](https://gemspec.gematik.de/docs/gemILF/gemILF_PS_eRp/latest/)
- Spezifikation E-Rezept-Frontend des Versicherten [gemSpec_eRp_FdV](https://gemspec.gematik.de/docs/gemSpec/gemSpec_eRp_FdV/latest/)

Das Repository, was diesem Projekt zugrundeliegt und auch die FSH-Files enthält findet sich hier: https://github.com/gematik/fhir-profiles-erp

### Abhängigkeiten

{% include dependency-table.xhtml %}

### Kontakt und Feedback

Für Fragen und Feedback wenden Sie sich bitte an [erp-umsetzung@gematik.de](mailto:erp-umsetzung@gematik.de) oder nutzen Sie das [GitHub-Repository](https://github.com/gematik/fhir-profiles-erp/issues).

### Rechtliche Hinweise

Dieser IG wird von der [gematik GmbH](https://www.gematik.de/) erstellt und verwaltet.

Copyright ©2025+ gematik GmbH

HL7®, HEALTH LEVEL SEVEN®, FHIR® und das FHIR®-Logo sind Marken von Health Level Seven International, eingetragen beim United States Patent and Trademark Office.
