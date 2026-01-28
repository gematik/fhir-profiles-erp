### Systemüberblick
Der E-Rezept-Fachdienst verwaltet E-Rezepte in der Telematikinfrastruktur als ein zentraler Ressourcenserver auf Basis des FHIR-Standards mit einer RESTful API. Die Rezepte werden dabei über eine eindeutige Ressourcen-ID (Rezept-ID) adressiert. Zusätzlich protokolliert der E-Rezept-Fachdienst alle Zugriffe auf ein E-Rezept für den Versicherten und verwaltet die Statusübergänge eines E-Rezepts. Für einen Nachrichtenaustausch zwischen Apotheken und Versicherten über die Verfügbarkeit von Medikamenten, die Belieferung von E-Rezepten und der Vertretung beim Einlösen eines E-Rezepts ist zusätzlich eine Kommunikation über den E-Rezept-Fachdienst möglich.

Der E-Rezept-Fachdienst realisiert die Vertraulichkeit und Integrität der verarbeiteten Daten über das Konzept der vertrauenswürdigen Ausführungsumgebung (VAU), die eine durchgängige Verschlüsselung der E-Rezepte und der dazu gehörigen Daten aus einer Kombination kryptografischer Verfahren während des Transports, der vertrauenswürdigen Verarbeitung und in der verschlüsselten Persistierung der Daten sicherstellt.

Abbildung 1: Systemüberblick
<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="./vau-erp-fd.png" alt="VAU des E-Rezept-Fachdienstes" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Systemüberblick</figcaption>
</figure>

<br>

### Systemkontext
Der E-Rezept-Fachdienst stellt Schnittstellen für die Verwaltung von E-Rezepten und für den Nachrichtenaustausch bereit. Diese werden von Leistungserbringerorganisationen und Versicherten genutzt, die über ihre jeweiligen Clientsysteme auf den E-Rezept-Fachdienst zugreifen.

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
        <img src="./systemkontext.png" alt="Systemkontext" style="width: 100%;">
    </div>
    <figcaption><strong>Abbildung: </strong>Systemkontext E-Rezept-Fachdienst</figcaption>
</figure>

<br>

#### Nachbarsysteme
Die Schnittstellen des E-Rezept-Fachdienstes werden durch die Praxisverwaltungs- und Krankenhausinformationssysteme der verordnenden Leistungserbringer im Verordnungsprozess genutzt. Die Apothekenverwaltungssysteme nutzen die Schnittstellen des E-Rezept-Fachdienstes im Rahmen der Dispensierung. Außerdem werden sie vom E-Rezept-Frontend des Versicherten (E-Rezept-FdV) aufgerufen. Als Fachdienst der Telematikinfrastruktur bedient sich der E-Rezept-Fachdienst der weiteren Infrastrukturdienste wie TSPs für die Gültigkeitsabfrage für Signaturzertifikate, des HBA (für QES-Prüfung) und des IdentityManagements, bei dem der IDP-Dienst in seiner Rolle als Authorization-Server auf verschiedenen Wegen die Identitätsfeststellung für Nutzer übernimmt und deren Zugriffsberechtigungen dann in Form von ACCESS_TOKEN für den Zugriff auf den E-Rezept-Fachdienst bestätigt.

#### Akteure und Rollen
Leistungserbringerinstitutionen und Versicherte weisen sich gegenüber dem E-Rezept-Fachdienst mit einer Identitätsbestätigung (ACCESS_TOKEN) aus, die sie vom IDP-Dienst in seiner Rolle als Authorization-Server für den E-Rezept-Fachdienst, beziehen. In diesen ACCESS_TOKEN ist ihre Rollen-OID (bspw. Arztpraxis, Apotheke, Versicherter) sowie ihr Identitätskennzeichen in Form der Versicherten-ID (10-stelliger unveränderlicher Anteil der KVNR) bzw. Telematik-ID enthalten. Anhand der jeweiligen Rolle wird die Zulässigkeit einer aufgerufenen Operation geprüft. Das Identitätskennzeichen wird für die Protokollierung von Zugriffen sowie die Zuordnung von Datensätzen, insbesondere bei E-Rezepten zu Versicherten, genutzt.

### Zerlegung des Produkttyps
Der E-Rezept-Fachdienst verwaltet E-Rezepte über einen medizinischen Workflow. Dabei muss er die Vertraulichkeit und Integrität der verarbeiteten Daten sicherstellen. Daraus ergeben sich Sicherheitsanforderungen an die Betriebsumgebung, an die Fachlogik der Prozessverarbeitung sowie an die Ausführungsumgebung des Programmcodes.

<requirement conformance="SHALL" key="IG-ERP-109" title="Anbieter E-Rezept-Fachdienst Speicherung Schlüsselmaterial in HSM" version="0">
    <meta lockversion="false"/>
    <actor name="Anbieter E-Rezept-Fachdienst">
        <testProcedure id="Sich.techn. Eignung: Gutachten (Anbieter)"/>
    </actor>
Der Anbieter des E-Rezept-Fachdienstes MUSS das private Schlüsselmaterial für kryptografische Verfahren (Entschlüsselung, Signaturen) in einem HSM speichern, dessen Eignung durch eine erfolgreiche Evaluierung nachgewiesen wurde. Als Evaluierungsschemata kommen dabei Common Criteria, ITSEC oder Federal Information Processing Standard (FIPS) in Frage.     
Die Prüftiefe MUSS mindestens 
- FIPS 140-2 Level 3,    
- Common Criteria EAL 4+ mit hohem Angriffspotenzial oder
- ITSEC E3 der Stärke „hoch“ entsprechen.
</requirement>

Eine über die Schlüsselspeicherung in einem Hardware Security Module (HSM) hinausgehende Anforderung an die Zerlegung des E-Rezept-Fachdienstes gibt es aus funktionaler Sicht nicht.