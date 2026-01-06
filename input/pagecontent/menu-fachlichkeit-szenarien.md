
### Szenarien

Die nachfolgenden Szenarien beschreiben idealtypische Teilprozessschritte rund um die Verschreibung und Bereitstellung eines E‑Rezepts im Versorgungsalltag. Zu jedem Szenario sind die relevanten fachlichen Anwendungsfälle zugeordnet.

#### Verschreibung von Arzneimitteln

_Die Entscheidung für eine Arzneimitteltherapie, die Erstellung der Verordnung im Primärsystem und die qualifizierte elektronische Signatur (QES) sind zentrale Schritte, bevor ein E‑Rezept auf dem E‑Rezept-Fachdienst bereitgestellt werden kann._

Im Behandlungsprozess erfolgt zunächst Anamnese und Indikationsstellung. Darauf aufbauend wählt der Arzt/die Ärztin ein geeignetes Arzneimittel und erstellt den Verordnungsdatensatz im Primärsystem (PVS/KIS).

Damit das E‑Rezept als digitales Artefakt genutzt werden kann, wird anschließend eine Rezept-ID über den E‑Rezept-Fachdienst erzeugt (Task anlegen). Diese Rezept-ID wird in den Verordnungsdatensatz eingebettet.

Vor der Bereitstellung muss der Verordnungsdatensatz qualifiziert elektronisch signiert werden. Die QES kann ausschließlich durch den (Zahn-)Arzt/die (Zahn-)Ärztin mit freigeschaltetem HBA erfolgen; vorbereitende Tätigkeiten (z.B. durch MFA) sind je nach Organisation möglich.

Nach erfolgreicher QES wird der Task im E‑Rezept-Fachdienst aktiviert und der signierte Verordnungsdatensatz übermittelt. Der E‑Rezept-Fachdienst prüft Signatur und Schemakonformität und stellt das E‑Rezept bereit.

Wenn im Nachgang eine Fehlverordnung erkannt wird, kann das E‑Rezept (solange es nicht bereits in Belieferung ist) durch den verordnenden Leistungserbringer widerrufen/gelöscht werden, um den Patienten vor Bezug und Einnahme zu schützen.

**Beteiligte Systeme:** PVS/KIS, E‑Rezept-Fachdienst, IdP/Konnektor, HBA

**Fachliche Anwendungsfälle**

- [E‑Rezept erstellen](./menu-fachlichkeit-anwendungsfaelle.html#e-rezept-erstellen)
- [E‑Rezept qualifiziert signieren](./menu-fachlichkeit-anwendungsfaelle.html#e-rezept-qualifiziert-signieren)
- [E‑Rezept vervollständigen und Task aktivieren](./menu-fachlichkeit-anwendungsfaelle.html#e-rezept-vervollstaendigen-und-task-aktivieren)
- [E‑Rezept löschen](./menu-fachlichkeit-anwendungsfaelle.html#e-rezept-loeschen)
