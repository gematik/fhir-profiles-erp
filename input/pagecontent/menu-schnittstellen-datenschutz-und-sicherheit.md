### Allgemeine Sicherheitsanforderungen

<requirement conformance="SHALL" key="ERP-FD64318UGP" title="E-Rezept-Fachdienst – Ausschluss unbekannter FdV-Versionsnummern von der Kommunikation" version="0">
    <meta lockversion="false"/>
    <actor name="ERP">
        <testProcedure id="Produkttest"/>
    </actor>
    Der E-Rezept-Fachdienst MUSS an der Schnittstelle zum Internet die Produktidentifikation (Produktbezeichnung, Produktversion) des Clients erkennen und nicht zugelassene Produkte oder bestimmte Produktversionen von der Kommunikation mit dem E-Rezept-Fachdienst ausschließen können. Der E-Rezept-Fachdienst MUSS in diesen Fällen eine entsprechende Fehlermeldung mit dem http-StatusCode 403 an den aufrufenden Client geben.
</requirement>

<requirement conformance="SHALL" key="ERP-FD23427X68" title="Medikationsplan (durch das Aktensystem gerendert) im ePA-FdV anzeigen" version="0">
    <meta lockversion="false"/>
    <actor name="EPA-FdV">
        <testProcedure id="Produkttest"/>
    </actor>
    Das ePA-FdV MUSS es dem Nutzer ermöglichen, den Medikationsplan für sein Aktenkonto oder für das Aktenkonto des zu Vertretenden unter Verwendung von <i>Render API: Medikationsplan abrufen (eMP)</i> anzuzeigen.
</requirement>

Hinweis: Der Ausschluss soll über ein Whitelisting gültiger Produktidentifikationen erfolgen.

<requirement conformance="SHALL" key="ERP-FD85389ZF9" title="E-Rezept-Fachdienst – Ausschluss von Client-Versionen" version="0">
    <meta lockversion="false"/>
    <actor name="Anb_eRp_FD"/>
    Der Anbieter des E-Rezept-Fachdienstes MUSS ausschließlich auf Anweisung der gematik Clients mit einer bestimmten Produktidentifikation für die Kommunikation mit dem E-Rezept-Fachdienst zulassen.
</requirement>

<requirement conformance="SHALL" key="ERP-FD11627FC5" title="E-Rezept-Fachdienst – Berücksichtigung OWASP-Top-10-Risiken" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der E-Rezept-Fachdienst MUSS Maßnahmen zum Schutz vor den OWASP-Top-10-Risiken in der aktuellen Version umsetzen.
</requirement>

Der E-Rezept-Fachdienst soll sich vor Anfragen, die nicht auf ein übliches Verhalten von Leistungserbringerinstitutionen und Versicherten während des Verordnungsprozesses schließen lassen, schützen. Diesen Anomalien wird mit einer Drosselung der Bearbeitungsgeschwindigkeit begegnet, um bspw. Brute-Force-Attacken auf das Erraten von AccessCodes für den Zugriff auf E-Rezept-Daten unattraktiv zu machen.

<requirement conformance="SHALL" key="ERP-FD34980N5L" title="E-Rezept-Fachdienst – Drosselung Brute-Force-Anfragen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der E-Rezept-Fachdienst MUSS jede Antwort auf einen Funktionsaufruf, der einen AccessCode oder Secret enthält, um den konfigurierbaren http-Response-Header "Warning" (default "999 Throttling active") ergänzen und um ein konfigurierbares Zeitintervall (default: 500 Millisekunden) verzögert zurückschicken, sofern der erwartete AccessCode bzw. Secret nicht mit dem übergebenen AccessCode bzw. Secret übereinstimmt, um Brute-Force-Angriffe durch einen hohen Zeitaufwand unattraktiv zu machen.
</requirement>

<requirement conformance="SHALL" key="ERP-FD04712LW3" title="E-Rezept-Fachdienst – Drosselung Rezeptfälschungen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der E-Rezept-Fachdienst MUSS jede Antwort auf den Funktionsaufruf zum Aktivieren eines Tasks mittels Übergabe des QES-signierten Datensatzes um den konfigurierbaren http-Response-Header "Warning" (default "999 Throttling active") ergänzen und um ein konfigurierbares Zeitintervall (default: 500 Millisekunden) verzögert zurückschicken, sofern die QES in der Prüfung während der Operation POST /Task/<id>/$activate als ungültig erkannt wird, um Angriffe durch Rezeptfälschungen durch einen hohen Zeitaufwand unattraktiv zu machen.
</requirement>

<requirement conformance="SHALL" key="ERP-FD30074ZHL" title="Anbieter E-Rezept-Fachdienst – Konfiguration und Deaktivierung Drosselung" version="0">
    <meta lockversion="false"/>
    <actor name="Anb_eRp_FD"/>
    Der Anbieter des E-Rezept-Fachdienstes MUSS die Funktion der Drosselung sowie die Konfiguration auf Weisung der gematik aktivieren oder deaktivieren bzw. die Konfigurationsparameter anpassen, um die Wirksamkeit des Mechanismus im Feld bei Bedarf zu verbessern.
</requirement>

Die gematik stellt mit der Prüfkarte eGK eine elektronische Identität zur Überprüfung verschiedener Anwendungsfälle in der TI und wird vorrangig von Dienstleistern vor Ort (DVOs) genutzt. Die Prüfkarte eGK ist nicht für die Nutzung im regulären Versorgungsalltag von Leistungserbringern oder Versicherten vorgesehen. Die folgenden Anforderungen verhindern eine Vermischung von Prüfaktivitäten mittels der Prüfkarte eGK und den Anwendungsfällen von Versicherten einer Krankenkasse.

<requirement conformance="SHALL" key="ERP-FD08368UL3" title="E-Rezept-Fachdienst – Erkennen der Prüfidentität" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der E-Rezept-Fachdienst MUSS eine eGK-Prüfkartenidentität anhand der Bildungsregel in Card-G2-A_3820 (X0000nnnnP, mit nnnn aus der Menge {0001 .. 5000} und P = Prüfziffer) für die KVNR der Prüfkarte eGK erkennen.
</requirement>

<requirement conformance="SHALL" key="ERP-FD82358ACB" title="E-Rezept-Fachdienst – Ausschluss Vertreterkommunikation von bzw. an Prüf-Identität" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der E-Rezept-Fachdienst MUSS das Einstellen einer Communication-Ressource mit dem http-Status-Code 400 ablehnen, wenn diese in den Absender- und Empfänger-Informationen eine Kombination von KVNR der Prüfkarte eGK und KVNR von Versicherten enthält.
</requirement>

<requirement conformance="SHALL" key="ERP-FD96295XUY" title="E-Rezept-Fachdienst – Ausschluss Vertreterzugriff auf bzw. mittels Prüf-Identität" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der E-Rezept-Fachdienst MUSS jeden Zugriff auf E-Rezepte mittels AccessCode (Vertreterzugriff) mit dem http-Status-Code 400 ablehnen, wenn sich aus dem Zugriff eine Kombination aus KVNR der Prüfkarte eGK und KVNR von Versicherten ergibt, d. h. Versicherte dürfen nicht auf Prüfrezepte und mit Prüfkarte eGK darf nicht auf Rezepte von Versicherten zugegriffen werden.
</requirement>

<requirement conformance="SHALL" key="ERP-FD48133QF6" title="E-Rezept-Fachdienst – Drosselung User Agent Aufrufe" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der E-Rezept-Fachdienst MUSS bei einer im laufenden Betrieb konfigurierbaren Anzahl von 200 Aufrufen pro Sekunde eines User-Agents die Antwortzeit um ein konfigurierbares Zeitintervall (Default 500ms) verzögert zurückschicken, um eine Überlast am E-Rezept-Fachdienst zu verhindern. Die Drosselung muss über einen konfigurierbaren Schalter im laufenden Betrieb aktivierbar bzw. deaktivierbar sein. Der E-Rezept-Fachdienst MUSS zusätzlich ein Whitelisting implementieren, damit User-Agents von der Drosselung ausgenommen werden können.
</requirement>

### Identifikation des Clientsystems
Der E-Rezept-Fachdienst verwaltet und steuert den Einlöseprozess für elektronische Verordnungen. Damit kommt ihm eine Relevanz in der Medikamentenversorgung zu, die sich zum einen in einer hohen Verfügbarkeit und zum anderen in einem hohen Angriffspotential widerspiegelt. Zur Unterstützung der betrieblichen Überwachung des E-Rezept-Fachdienstes wird die Nutzung der im Feld befindlichen Clientsysteme protokolliert. Dabei ist der Zugriff auf die Schnittstellen des E-Rezept-Fachdienstes nur durch Primärsysteme der Leistungserbringer und zugelassene E-Rezept-FdVs zulässig. Der E-Rezept-Fachdienst erkennt die Clientsysteme anhand des User-Agent-Header eingehender HTTP-Requests und protokolliert diesen Wert.

<requirement conformance="SHALL" key="ERP-FD65454TGD" title="E-Rezept-Fachdienst – Erkennung Clientsystem User-Agent" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der E-Rezept-Fachdienst MUSS das vom aufrufenden Nutzer verwendete Clientsystem anhand des im HTTP-Request enthaltenen Header-Feld "User-Agent" gemäß [RFC7231] erkennen und in den Einträgen zur Performance-Rohdatenerfassung gemäß [gemSpec_Perf] protokollieren. Der E-Rezept-Fachdienst MUSS bei fehlendem User-Agent-Header den Request mit dem HTTP-Status-Code 403 beantworten, damit in der Betriebsüberwachung des E-Rezept-Fachdienstes die Nutzung unzulässiger Frontends erkannt werden kann.
</requirement>

Beim Verbindungsaufbau zwischen Client und E-Rezept-Fachdienst an Schnittstellen zum Internet wird ein API-KEY übermittelt, welcher durch den E-Rezept-Fachdienst an der Web-Schnittstelle auf Zulässigkeit geprüft wird.

API-KEYs werden durch die gematik in ihrer Rolle als Gesamtverantwortlicher der TI erzeugt. Sie sind Zufallswerte mit hoher Entropie und produkt-spezifisch. Die Zulässigkeit von API-KEYs wird von der gematik über organisatorische Prozesse dem Betreiber des E-Rezept-Fachdienstes und den Herstellern von Clientsystemen mitgeteilt. Die Übermittlung muss vertraulichkeits- und integritätsgeschützt erfolgen. Die gematik muss bei der Übergabe des API-KEY sicherstellen, dass nur ein berechtigter Client-Hersteller einen für ihn erzeugten API-KEY erhält.

Die Veranlassung zur Sperrung eines API-KEYs erfolgt durch die gematik, bspw. wenn der Verdacht besteht, dass der API-KEY kompromittiert wurde (bspw. missbräuchliche Nutzung des API-KEYs durch Dritte). Hinweis: Betriebliche Sperrprozesse werden über user-agent gesteuert, da ggf. der API-KEY-Mechanismus gegen einen alternativen Mechanismus getauscht wird, welcher zusätzlich die Authentizität des Clients absichert.

<requirement conformance="SHALL" key="ERP-FD69180LPZ" title="E-Rezept-Fachdienst – Prozess zur Verwaltung von API-KEYs" version="0">
    <meta lockversion="false"/>
    <actor name="Anb_eRp_FD"/>
    Der Anbieter des E-Rezept-Fachdienstes MUSS organisatorische Prozesse mit der gematik zur Verwaltung von API-KEYs für die Schnittstellen des E-Rezept-Fachdienstes zum Internet unterstützen.
</requirement>

Mittels dieser Prozesse werden zulässige API-KEYs übermittelt und API-KEYs als ungültig erklärt.

<requirement conformance="SHALL" key="ERP-FD34828WAY" title="E-Rezept-Fachdienst – Zuordnung Abfrageursprung Client" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der E-Rezept-Fachdienst MUSS jeden Zugriff über eine Schnittstelle im Internet mittels dem HTTP-Header "X-api-key" gegen die Liste zulässiger API-KEYs prüfen. Anfragen ohne HTTP-Header "X-api-key" oder einem nicht gültigen API-KEY MÜSSEN als nicht authentisiert (HTTP-Statuscode 401) abgelehnt werden.
</requirement>

### Vertrauensraum der TI
Der E-Rezept-Fachdienst muss das E-Rezept-Frontend des Versicherten (E-Rezept-FdV) bei den Aufgaben unterstützen, regelmäßig die TSL-Aktualisierung vorzunehmen [gemSpec_eRp_FdV#A_20028] und Sperrinformationen für Zertifikate zu ermitteln [gemSpec_eRp_FdV#A_20032]. Die OCSP-Responder und der TSL-Dienst haben deutlich höhere SLAs in Bezug auf die Verfügbarkeit innerhalb der TI. Manche OCSP-Responder besitzen keine direkte Anbindung an das Internet (Komponenten-PKI, Kontext: Prüfung Identität vertrauenswürdige Ausführungsumgebung). Es wird damit auch möglich, bessere Aussagen über die Verfügbarkeit von E-Rezept-Anwendungsfällen zu treffen, weil weniger nicht-SLA-belegte Datenverbindungen für die Anwendungsfälle notwendig sind. (Wenn eine funktionierende Datenverbindung zwischen E-Rezept-FdV und E-Rezept-Fachdienst besteht, dann kann eine in [gemSpec_Perf] definierte Verfügbarkeit garantiert werden.) Aufgrund der Verwendung der Schnittstellen-Funktionalität über die schon etablierte TLS-Verbindung sind OCSP-Requests des E-Rezept-FdV nicht im Klartext im Internet sichtbar.

<requirement conformance="SHALL" key="ERP-FD96581ZZ1" title="E-Rezept-Fachdienst – Bereitstellung TSL" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der E-Rezept-Fachdienst MUSS folgende Vorgaben umsetzen: Er MUSS mindestens einmal täglich aus der TI (TI-interne Verbindung) die "TSL(ECC-RSA)" und deren zugehörigen Hashwert aus der TI herunterladen. Er MUSS unter dem Pfadnamen "/TSL.xml" über das vom E-Rezept-FdV genutzte HTTPS-Interface die "TSL(ECC-RSA)" der TI zur Verfügung stellen (HTTP-GET, HTTP Content-Type: text/xml). Er MUSS unter dem Pfadnamen "/TSL.sha2" über das vom E-Rezept-FdV genutzte HTTPS-Interface den vom TSL-Dienst heruntergeladenen SHA-256 Hashwert der Datei TSL.xml aus Spiegelstrich 2 zur Verfügung stellen (HTTP Content-Type: text/plain, Hashwert als hexdump kodiert (64 Byte + Newline)).
</requirement>

Hinweise:

"TI-interne Verbindung" hat den Hintergrund, dass dort über SLAs eine ausreichende Verfügbarkeit gewährleistet ist.
Hashwert der TSL.xml bedeutet der Hashwert der Datei TSL.xml, so wie sie vom TSL-Dienst der TI bereitgestellt wird und als wenn man die Datei als Binärdatei interpretiert (vgl. [gemSpec_TSL]).

<requirement conformance="SHALL" key="ERP-FD88382L68" title="E-Rezept-Fachdienst – Bereitstellung OCSP-Forwarder" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der E-Rezept-Fachdienst MUSS folgende Vorgaben umsetzen: Er MUSS unter der Adresse <FQDN>/ocspf eine Möglichkeit zur Statusabfrage über das vom E-Rezept-FdV genutzte HTTPS-Interface zur Verfügung stellen (HTTP-POST, vgl. auch [RFC-6960, Appendix [gemSpec_PKI]). Er MUSS über die Schnittstelle aus Spiegelstrich 1 OCSP-Requests [RFC-6960] entgegennehmen. Aus einem solchen OCSP-Request MUSS er aus dem issuerKeyHash [RFC-6960] die URL des entsprechenden OCSP-Responders in der TI ermitteln (Datengrundlage ist die TSL der TI) und den OCSP-Request an diese ermittelte URL weiterleiten. Er MUSS die erhaltenen OCSP-Response an das die OCSP-Anfrage stellende E-Rezept-FdV unverändert weiterreichen.
</requirement>

Auf Anfrage stellt die gematik eine Beispielimplementierung für A_20024 Spiegelstrich 3 bereit.

<requirement conformance="MAY" key="ERP-FD90745NW1" title="E-Rezept-Fachdienst – Caching OCSP-Antworten" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der E-Rezept-Fachdienst KANN OCSP-Antworten aus A_20024 bis zu 4 Stunden cachen und bei einer entsprechend passenden OCSP-Anfrage, anstatt neu den OCSP-Responder anzufragen, die im Cache befindliche OCSP-Antwort ausliefern.
</requirement>

<requirement conformance="SHALL" key="ERP-FD36260L42" title="E-Rezept-Fachdienst – OCSP-Stapling" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der E-Rezept-Fachdienst MUSS an der HTTPS-Schnittstelle zum Internet OCSP-Stapling [RFC-6066] unterstützen.
</requirement>

Als Alternative zur TSL-Verarbeitung stellt der E-Rezept-Fachdienst eine kurze Zertifikatskette in einer JSON-Struktur bereit, die sich in Plattformen mobiler Betriebssysteme leichter verarbeiten lässt. Diese Zertifikatskette muss regelmäßig aktualisiert und über einen Downloadpunkt für Primärsysteme und das E-Rezept-FdV zur Verfügung gestellt werden. Die normativen Festlegungen finden sich in der Spezifikation [gemSpec_Krypt] in Abschnitt 7.2.2 "Client-seitige Prüfung der E-Rezept-VAU-Identität".

### Sicherheit der Netzübergänge
Der E-Rezept-Fachdienst wird für Versicherte über das Internet erreichbar gemacht und für Leistungserbringer über das Netz der TI. Die folgenden Anforderungen beschreiben die für diese Netzübergänge erforderlichen Sicherheitsmechanismen. Für den Netzübergang aus dem Internet als Transportnetz zum E-Rezept-Fachdienst ist ein Paketfilter erforderlich.

<requirement conformance="SHALL" key="ERP-FD35066LGS" title="E-Rezept-Fachdienst – Sicherung zum Transportnetz Internet durch Paketfilter" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der E-Rezept-Fachdienst MUSS zum Transportnetz Internet durch einen Paketfilter (ACL) gesichert werden, welcher ausschließlich die erforderlichen Protokolle weiterleitet. Der Paketfilter des E-Rezept-Fachdienstes MUSS frei konfigurierbar sein auf der Grundlage von Informationen aus OSI-Layer 3 und 4, das heißt Quell- und Zieladresse, IP-Protokoll sowie Quell- und Zielport.
</requirement>

<requirement conformance="SHALL NOT" key="ERP-FD37124TBP" title="E-Rezept-Fachdienst – Platzierung des Paketfilters Internet" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der Paketfilter des E-Rezept-Fachdienstes, zum Schutz in Richtung Transportnetz Internet, DARF NICHT physisch auf Systemen der VAU des E-Rezept-Fachdienstes oder dem vorgeschalteten TLS-terminierenden Load Balancer implementiert werden.
</requirement>

<requirement conformance="SHALL" key="ERP-FD01725QFP" title="E-Rezept-Fachdienst – Richtlinien für den Paketfilter zum Internet" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der Paketfilter des E-Rezept-Fachdienstes MUSS die Weiterleitung von IP-Paketen an der Schnittstelle zum Internet auf die nachfolgenden Protokolle beschränken: HTTPS, und OCSP-Zugriffe für das OCSP-Stapling nach A_20026 (vgl. Hinweis nach A_19815-*), ggf. notwendige DNS-Anfragen (und Antworten), Zugriff auf den FHIR-VZD, Zugriff auf Webdienste des BfArM, Zugriff auf die authentisierten Push Gateways. Ein Verbindungsaufbau aus dem E-Rezept-Fachdienst in Richtung Internet MUSS unterbunden werden, mit Ausnahme der Verbindungen aus Punkten 2, 3, 4 und 5.
</requirement>

Hinweis zu A_19815-*:

Der Anbieter des E-Rezept-Fachdienstes muss für seine HTTPS-Schnittstelle ein TLS-Zertifikat von einem durch das CAB-Forum zulässigen TSP erwerben (dessen CA-Zertifikat also über einen aktuellen Webbrowser prüfbar ist, vgl. A_19823). Für dieses TLS-Zertifikat fragt der E-Rezept-Fachdienst regelmäßig für das OCSP-Stapling nach A_20026 den OCSP-Responder des TSP nach dem Sperrstatus des TLS-Zertifikats. Als Antwort erhält der E-Rezept-Fachdienst eine OCSP-Response. Diese wird nach A_20022 geprüft und anschließend von der HTTPS-Schnittstelle verwendet (vgl. https://tools.ietf.org/html/rfc6066#section-8 und bspw. http://nginx.org/en/docs/http/ngx_http_ssl_module.html#ssl_stapling).

Um dies zu ermöglichen, muss der Paketfilter entsprechende stateful-Firewall-Regeln gemäß A_19815-* und A_20022 definieren.

<requirement conformance="SHALL" key="ERP-FD47556DVB" title="E-Rezept-Fachdienst – OCSP-Status für das OCSP-Stapling" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der Paketfilter des E-Rezept-Fachdienstes MUSS bezüglich des OCSP-Stapling gemäß A_20026 folgende Vorgaben umsetzen: Für das vom Anbieter des E-Rezept-Fachdienstes erworbene TLS-Zertifikat (vgl. Hinweis zu A_19815) MUSS der E-Rezept-Fachdienst initial die IP-Adresse (ggf. die IP-Adressen) des entsprechenden OCSP-Responsers ermitteln. Diese IP-Adresse(n) MÜSSEN gemäß A_19815 per stateful-Firewalling Verbindungen von der HTTPS-Schnittstelle an den OCSP-Responder erlaubt werden (Whitelisting). Gemäß OCSP-Stapling (https://tools.ietf.org/html/rfc6066#section-8) MUSS der E-Rezept-Fachdienst regelmäßig eine OCSP-Response vom entsprechenden OCSP-Responder beziehen (die Regelmäßigkeit wird vom zertifikatsausgebenden TSP und der Gültigkeitsdauer dessen OCSP-Responses bestimmt). Die OCSP-Responses MÜSSEN vom E-Rezept-Fachdienst geprüft werden (Signaturprüfung, CertID in der OCSP-Response passt zum angefragten Zertifikat). Falls eine der Prüfungen ein nicht-positives Ergebnis liefert, so MUSS die erhaltene OCSP-Response verworfen werden. Sollte die letzte im E-Rezept-Fachdienst vorhandene OCSP-Response zeitlich nicht mehr gültig sein (bspw. der OCSP-Responder im Internet war länger nicht erreichbar), so MUSS diese OCSP-Response verworfen werden und ein von einem Klienten (E-Rezept-FdV) initiierter TLS-Verbindungsaufbau der HTTPS-Schnittstelle ohne OCSP-Stapling durchgeführt werden.
</requirement>

<requirement conformance="SHALL" key="ERP-FD05222WAD" title="E-Rezept-Fachdienst – Verhalten bei Vollauslastung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der Paketfilter des E-Rezept-Fachdienstes MUSS so konfiguriert sein, dass bei Vollauslastung der Systemressourcen im E-Rezept-Fachdienst keine weiteren Verbindungen angenommen werden.
</requirement>

Durch die Zurückweisung von Verbindungen wird sichergestellt, dass Clients einen Verbindungsaufbau mit einer anderen Instanz des Fachdienstes versuchen, bei dem die erforderlichen Ressourcen zur Verfügung stehen.

Da der E-Rezept-Fachdienst die Verarbeitung der fachlichen Operationen in einer VAU ausführt, ist der Zugang zum Schutz dieser VAU zweistufig. Der E-Rezept-Fachdienst verfügt über einen Eingangspunkt (einen Load Balancer), an dem die TLS-Verbindung terminiert wird. Der Eingangspunkt wertet dann den HTTP-Header aus, um aus der Ziel-URL des Requests den für die Verarbeitung zu adressierenden Verarbeitungskontext zu ermitteln. An diesen Verarbeitungskontext wird der Request durch den Eingangspunkt weitergeleitet. In umgekehrter Richtung sendet der Eingangspunkt die Response des Verarbeitungskontextes über die TLS-Verbindung an den Client.

<requirement conformance="SHALL" key="ERP-FD55516P8F" title="E-Rezept-Fachdienst – Verbindungen von Clients zu Verarbeitungskontexten der VAU über den Eingangspunkt" version="0">
    <meta lockversion="false"/>
    <actor name="Eingangspunkt E-Rezept-Fachdienst"/>
    Der Eingangspunkt des E-Rezept-Fachdienstes MUSS Verbindungen von Clients (Internet oder TI) ausschließlich über TLS akzeptieren. Er MUSS die TLS-Verbindung terminieren und HTTP Requests und Responses zwischen dem Client und dem für die jeweilige Sitzung zugeordneten Verarbeitungskontext der VAU vermitteln.
</requirement>

<requirement conformance="SHALL" key="ERP-FD01556A9B" title="E-Rezept-Fachdienst – Richtlinien zum TLS-Verbindungsaufbau" version="0">
    <meta lockversion="false"/>
    <actor name="Eingangspunkt E-Rezept-Fachdienst"/>
    Der Eingangspunkt des E-Rezept-Fachdienstes MUSS sich beim TLS-Verbindungsaufbau über das Transportnetz gegenüber dem Client mit einem Extended Validation TLS-Zertifikat eines Herausgebers gemäß [CAB Forum] authentisieren. Das Zertifikat MUSS an die jeweilige Schnittstelle des Eingangspunkts für Primärsysteme und Frontends der Versicherten des E-Rezept-Fachdienstes gebunden werden, damit Clientsysteme beim TLS-Verbindungsaufbau eine vereinfachte Zertifikatsprüfung mit TLS-Standardbibliotheken durchführen können.
</requirement>

<requirement conformance="SHALL" key="ERP-FD06745UX0" title="E-Rezept-Fachdienst – Zugriff auf Webdienste – Deaktivieren von Übertragungen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der E-Rezept-Fachdienst MUSS eine Konfiguration für die Ausführung der folgenden Anwendungsfälle vorsehen: Anwendungsfall Übertragen digitaler Durchschlag E-T-Rezept, um kurzfristig auf sicherheitsrelevante Vorfälle reagieren zu können, indem die Ausführung der Anwendungsfälle deaktiviert wird.
</requirement>

<requirement conformance="SHALL" key="ERP-FD02811TYD" title="Anbieter E-Rezept-Fachdienst – Betrieblicher Prozess Deaktivieren von Übertragungen" version="0">
    <meta lockversion="false"/>
    <actor name="Anb_eRp_FD"/>
    Der Anbieter des E-Rezept-Fachdienstes MUSS einen betrieblichen Prozess unterstützen, mittels dem die Konfiguration des Deaktivierens von Anwendungsfällen angepasst werden kann.
</requirement>

### Vertrauenswürdige Ausführungsumgebung
In diesem Abschnitt werden die Anforderungen an den E-Rezept-Fachdienst zur Umsetzung einer Vertrauenswürdigen Ausführungsumgebung (VAU) dargestellt. Die VAU dient der datenschutzrechtlich zulässigen und sicheren Verarbeitung von schützenswerten Klartextdaten innerhalb des E-Rezept-Fachdienstes sowie dem technischen Ausschluss der Profilbildung durch den Anbieter bzw. Betreiber. Die VAU stellt dazu Verarbeitungskontexte (d. h. Instanzen der VAU) bereit, in denen die Verarbeitung sensibler Daten im Klartext erfolgen kann. Diese Verarbeitungskontexte sind entsprechend zu schützen.

<requirement conformance="SHALL" key="ERP-FD36975N4C" title="E-Rezept-Fachdienst – Umsetzung der fachlichen Operationen in einer Vertrauenswürdigen Ausführungsumgebung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der E-Rezept-Fachdienst MUSS die Verarbeitung aller fachlichen Operationen des Fachdienstes in einer Vertrauenswürdigen Ausführungsumgebung umsetzen.
</requirement>

#### Verarbeitungskontext
Die Gesamtheit aus der für eine Klartextverarbeitung erforderlichen Software, dem für eine Klartextverarbeitung genutzten physikalischen System sowie den für die Integrität einer Klartextverarbeitung erforderlichen organisatorischen und physischen Rahmenbedingungen bildet den Verarbeitungskontext der Vertrauenswürdigen Ausführungsumgebung.

Zur Vertrauenswürdigen Ausführungsumgebung gehören neben den Verarbeitungskontexten alle für ihre Erreichbarkeit und betriebliche Steuerung erforderlichen Komponenten.

Der Verarbeitungskontext grenzt sich von allen weiteren, im betrieblichen Kontext beim Anbieter des E-Rezept-Fachdienstes vorhandenen Systemen und Prozessen dadurch ab, dass die sensiblen Klartextdaten von Komponenten innerhalb des Verarbeitungskontextes aus erreichbar sind oder sein können, während sie dies von außerhalb des Verarbeitungskontextes nicht sind. Sensible Daten verlassen den Verarbeitungskontext ausschließlich gemäß wohldefinierten (Zugriffs-)Regeln und in verschlüsselter Form.

<requirement conformance="SHALL" key="ERP-FD94711P63" title="E-Rezept-Fachdienst – Verarbeitungskontext der VAU" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der Verarbeitungskontext des E-Rezept-Fachdienstes MUSS sämtliche physikalischen Systemkomponenten sowie sämtliche Softwarekomponenten umfassen, deren Sicherheitseigenschaften sich auf den Schutz der personenbezogenen medizinischen Daten vor Zugriff durch Unbefugte bei ihrer Verarbeitung im Klartext auswirken können.
</requirement>

<requirement conformance="SHALL" key="ERP-FD42451P44" title="E-Rezept-Fachdienst – Verschlüsselung von außerhalb des Verarbeitungskontextes der VAU gespeicherten Daten" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der Verarbeitungskontext des E-Rezept-Fachdienstes MUSS sicherstellen, dass sämtliche schützenswerten Daten vor einer Speicherung außerhalb der VAU verschlüsselt werden. Der Verarbeitungskontext MUSS dazu Schlüssel für nur jeweils ein individuelles E-Rezept (inkl. aller mit diesem E-Rezept verbundenen Daten) verwenden oder mindestens einmal pro Sekunde den verwendeten Schlüssel wechseln, sodass nur die innerhalb einer Sekunde neu angelegten E-Rezepte mit einem Schlüssel verschlüsselt werden.
</requirement>

<requirement conformance="SHALL" key="ERP-FD31982N6D" title="E-Rezept-Fachdienst – Ableitung der Persistenzschlüssel durch ein HSM" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der Verarbeitungskontext des E-Rezept-Fachdienstes MUSS die zur Verschlüsselung der persistierten E-Rezept-Daten verwendeten Schlüssel von einem HSM innerhalb der VAU abrufen.
</requirement>

<requirement conformance="SHALL" key="ERP-FD88954YDM" title="E-Rezept-Fachdienst – Ableitung der Persistenzschlüssel aus Merkmal der E-Rezepte" version="0">
    <meta lockversion="false"/>
    <actor name="HSM der VAU"/>
    Das HSM der VAU des E-Rezept-Fachdienstes MUSS eine Schnittstelle zur Ableitung von symmetrischen Schlüsseln für die Persistierung von E-Rezept-Daten bereitstellen. Das HSM der VAU des E-Rezept-Fachdienstes MUSS zur Ableitung des jeweiligen Schlüssels ein nach der ersten Erstellung unveränderliches Merkmal des E-Rezept-Datensatzes als Ableitungsparameter verwenden (z. B. den Zeitstempel der Registrierung von Rezept-ID und Access Code oder den Access Code selbst).
</requirement>

<requirement conformance="SHALL" key="ERP-FD22674T4Z" title="E-Rezept-Fachdienst – Geschützte Weitergabe von Daten an autorisierte Nutzer durch die VAU" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der Verarbeitungskontext des E-Rezept-Fachdienstes MUSS sicherstellen, dass sämtliche schützenswerten Daten ausschließlich über sichere Verbindungen an autorisierte Nutzer weitergegeben werden.
</requirement>

<requirement conformance="SHALL" key="ERP-FD40680HRZ" title="E-Rezept-Fachdienst – Transportverschlüsselte Übertragung von Daten mit PVS" version="0">
    <meta lockversion="false"/>
    <actor name="Verarbeitungskontext E-Rezept-Fachdienst"/>
    Der Verarbeitungskontext des E-Rezept-Fachdienstes MUSS sicherstellen, dass er nur transportverschlüsselt mit dem PVS kommuniziert.
</requirement>

<requirement conformance="SHALL" key="ERP-FD76352K95" title="E-Rezept-Fachdienst – Transportverschlüsselte Übertragung von Daten mit AVS" version="0">
    <meta lockversion="false"/>
    <actor name="Verarbeitungskontext E-Rezept-Fachdienst"/>
    Der Verarbeitungskontext des E-Rezept-Fachdienstes MUSS sicherstellen, dass er nur transportverschlüsselt mit dem AVS kommuniziert.
</requirement>

<requirement conformance="SHALL" key="ERP-FD52209B49" title="E-Rezept-Fachdienst – Transportverschlüsselte Übertragung von Daten mit FdV" version="0">
    <meta lockversion="false"/>
    <actor name="Verarbeitungskontext E-Rezept-Fachdienst"/>
    Der Verarbeitungskontext des E-Rezept-Fachdienstes MUSS sicherstellen, dass er nur transportverschlüsselt mit dem FdV kommuniziert.
</requirement>

<requirement conformance="SHALL" key="ERP-FD76956VH9" title="E-Rezept-Fachdienst – vertrauliche Kommunikation" version="0">
    <meta lockversion="false"/>
    <actor name="Verarbeitungskontext E-Rezept-Fachdienst"/>
    Der Verarbeitungskontext des E-Rezept-Fachdienstes MUSS sicherstellen, dass er nur transportverschlüsselt mit Komponenten außerhalb des Verarbeitungskontextes kommuniziert.
</requirement>

Hinweis: Für die Qualität der Transportverschlüsselung gelten die Anforderungen aus [gemSpec_Krypt].

<requirement conformance="SHALL" key="ERP-FD32785QT5" title="E-Rezept-Fachdienst – Authentisierung gegenüber Clients" version="0">
    <meta lockversion="false"/>
    <actor name="Verarbeitungskontext E-Rezept-Fachdienst"/>
    Der Verarbeitungskontext des E-Rezept-Fachdienstes MUSS sich gegenüber Clients, die mit ihm kommunizieren, mittels der Fachdienstidentität oid_erp-vau mit Zertifikatsprofil C.FD.ENC (oid_fd_enc) ausweisen.
</requirement>

<requirement conformance="SHALL" key="ERP-FD39015GH3" title="E-Rezept-Fachdienst – Isolation zwischen Datenverarbeitungsprozessen mehrerer Verarbeitungskontexte der VAU" version="0">
    <meta lockversion="false"/>
    <actor name="VAU E-Rezept-Fachdienst"/>
    Die VAU des E-Rezept-Fachdienstes MUSS die in ihr ablaufenden Verarbeitungen für die Daten eines Verarbeitungskontextes von den Verarbeitungen für die Daten anderer Verarbeitungskontexte in solcher Weise trennen, dass mit technischen Mitteln ausgeschlossen wird, dass die Verarbeitungen eines Verarbeitungskontextes schadhaft auf die Verarbeitungen eines anderen Verarbeitungskontextes einwirken können.
</requirement>

Hinweis: Da der Verarbeitungskontext der VAU des E-Rezept-Fachdienstes für jede fachliche Operation neu aufgebaut werden muss, ist ein Low-Level-Mechanismus zur Kontextseparation aus Gründen der Performance bzw. Skalierung nicht zwingend vorgeschrieben. Der hier geforderte Separationsmechanismus kann daher auch als Server-Thread, Worker, o. Ä. ausgeführt sein, solange für den dadurch gebildeten Verarbeitungskontext die geforderte Separation nachgewiesen werden kann. Dies setzt voraus, dass die Umsetzung der Verarbeitungskontexte und der in ihnen ablaufenden Verarbeitungsvorgänge technisch möglichst einfach und nachvollziehbar gestaltet ist.

<requirement conformance="SHALL" key="ERP-FD47035F2B" title="E-Rezept-Fachdienst – Unabhängige Skalierung der Dienst-Ressourcen für verschiedene Anwendergruppen" version="0">
    <meta lockversion="false"/>
    <actor name="VAU E-Rezept-Fachdienst"/>
    Die VAU des E-Rezept-Fachdienstes MUSS für die Anwendergruppen Leistungserbringer (E-Rezepte ausstellen, E-Rezepte einlösen) und Versicherte (E-Rezepte einsehen, zuweisen und löschen) sicherstellen, dass eine Überlastung aufgrund außergewöhnlich hoher Aktivität einer Anwendergruppe (primär der Versicherten) keine Beeinträchtigung der Arbeitsfähigkeit der anderen Anwendergruppen (primär der Ärzte und Apotheker) zur Folge hat.
</requirement>

Dies kann durch Betrieb der Funktionalitäten auf jeweils getrennten physischen Servern oder durch Mechanismen des vorgelagerten Load Balancing realisiert werden.

#### Ausschluss von nicht autorisierten Zugriffen aus dem Betriebsumfeld
Der Schutzbedarf der in der VAU verarbeiteten Klartextdaten erfordert den technischen Ausschluss von Zugriffen des Anbieters. Dies umfasst insbesondere Zugriffe durch Personen aus dem betrieblichen Umfeld des Anbieters.

<requirement conformance="SHALL" key="ERP-FD30410DZ1" title="E-Rezept-Fachdienst – Isolation der VAU von Datenverarbeitungsprozessen des Anbieters" version="0">
    <meta lockversion="false"/>
    <actor name="VAU E-Rezept-Fachdienst"/>
    Die VAU des E-Rezept-Fachdienstes MUSS die in ihren Verarbeitungskontexten ablaufenden Datenverarbeitungsprozesse von allen sonstigen Datenverarbeitungsprozessen des Anbieters trennen und damit gewährleisten, dass der Anbieter des E-Rezept-Fachdienstes vom Zugriff auf die in der VAU verarbeiteten schützenswerten Daten ausgeschlossen ist.
</requirement>

Hinweis: Für die Separation zwischen Verarbeitungskontexten und Verarbeitungsprozessen des Anbieters, die der betrieblichen Steuerung des Systems dienen, ist eine Low-Level Separation anzustreben, da - im Unterschied zur Separation zwischen Verarbeitungskontexten - hier technisch sehr verschiedene Aspekte getrennt werden müssen.

<requirement conformance="SHALL" key="ERP-FD01507KJ4" title="E-Rezept-Fachdienst – Ausschluss von Manipulationen an der Software der VAU" version="0">
    <meta lockversion="false"/>
    <actor name="VAU E-Rezept-Fachdienst"/>
    Die VAU des E-Rezept-Fachdienstes MUSS eine Manipulation der eingesetzten Software erkennen und eine Ausführung der manipulierten Software verhindern.
</requirement>

<requirement conformance="SHALL" key="ERP-FD76154QMA" title="E-Rezept-Fachdienst – Ausschluss von Manipulationen an der Hardware der VAU" version="0">
    <meta lockversion="false"/>
    <actor name="VAU E-Rezept-Fachdienst"/>
    Die VAU des E-Rezept-Fachdienstes MUSS die Integrität der eingesetzten Hardware schützen und damit insbesondere Manipulationen an der Hardware durch den Anbieter des E-Rezept-Fachdienstes ausschließen.
</requirement>

<requirement conformance="SHALL" key="ERP-FD42807H6K" title="E-Rezept-Fachdienst – Kontinuierliche Wirksamkeit des Manipulationsschutzes der VAU" version="0">
    <meta lockversion="false"/>
    <actor name="VAU E-Rezept-Fachdienst"/>
    Die VAU des E-Rezept-Fachdienstes MUSS den Ausschluss von Manipulationen an der Hardware und der Software durch den Anbieter des E-Rezept-Fachdienstes mit Mitteln umsetzen, deren dauerhafte und kontinuierliche Wirksamkeit gewährleistet werden kann.
</requirement>

<requirement conformance="SHALL" key="ERP-FD27076A8J" title="E-Rezept-Fachdienst – Kein physischer Zugang des Anbieters zu Systemen der VAU" version="0">
    <meta lockversion="false"/>
    <actor name="VAU E-Rezept-Fachdienst"/>
    Die VAU des E-Rezept-Fachdienstes MUSS mit technischen Mitteln sicherstellen, dass niemand, auch nicht der Anbieter des E-Rezept-Fachdienstes, während der Verarbeitung personenbezogener medizinischer Daten Zugriff auf physische Schnittstellen der Systeme erlangen kann, auf denen eine VAU ausgeführt wird.
</requirement>

<requirement conformance="SHALL" key="ERP-FD03409QT4" title="E-Rezept-Fachdienst – Nutzdatenbereinigung vor physischem Zugang zu Systemen der VAU" version="0">
    <meta lockversion="false"/>
    <actor name="VAU E-Rezept-Fachdienst"/>
    Die VAU des E-Rezept-Fachdienstes MUSS mit technischen Mitteln sicherstellen, dass physischer Zugang zu Hardware-Komponenten der Verarbeitungskontexte nur erfolgen kann, nachdem gewährleistet ist, dass aus ihnen keine Nutzdaten extrahiert werden können.
</requirement>

<requirement conformance="SHALL" key="ERP-FD01299AJA" title="E-Rezept-Fachdienst – Private Schlüssel von Dienstzertifikaten im HSM" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der E-Rezept-Fachdienst MUSS die folgenden privaten Schlüssel in einem Hardware Security Module (HSM) erzeugen und anwenden: Privater Schlüssel (PrK.FD.ENC) des Schlüsselpaars zur Authentisierung des Verarbeitungskontextes gegenüber dem E-Rezept-Frontend des Versicherten und Primärsystemen (sicherer Kanal auf Anwendungsebene). Die Prüftiefe des HSM MUSS dabei den in [A_19712] angegebenen Standards entsprechen.
</requirement>

Hinweis: Die TLS-TI-Fachdienst-Identität kann z. B. auf einem außerhalb der VAU betriebenen Load Balancer mit TLS-Terminierung verwendet werden. Hierfür muss dann ein HSM außerhalb der VAU verwendet werden.

<requirement conformance="SHALL" key="ERP-FD09148ZQ7" title="E-Rezept-Fachdienst – Einsatz zertifizierter HSM" version="0">
    <meta lockversion="false"/>
    <actor name="Anb_eRp_FD"/>
    Der Anbieter des E-Rezept-Fachdienstes MUSS beim Einsatz eines HSM sicherstellen, dass dessen Eignung durch eine erfolgreiche Evaluierung nachgewiesen wurde. Als Evaluierungsschemata kommen dabei Common Criteria, ITSEC oder Federal Information Processing Standard (FIPS) in Frage. Die Prüftiefe MUSS mindestens FIPS 140-2 Level 3, Common Criteria EAL 4+ mit hohem Angriffspotenzial oder ITSEC E3 der Stärke "hoch" entsprechen.
</requirement>

<requirement conformance="SHALL" key="ERP-FD16783EK6" title="E-Rezept-Fachdienst – HSM-Kryptographieschnittstelle verfügbar nur für Instanzen der VAU" version="0">
    <meta lockversion="false"/>
    <actor name="VAU E-Rezept-Fachdienst"/>
    Die VAU des E-Rezept-Fachdienstes MUSS mit technischen Mitteln, die auch Manipulationen durch den Anbieter des E-Rezept-Fachdienstes ausschließen, gewährleisten, dass nur Instanzen der VAU Zugriff auf die Kryptographieschnittstelle des HSM zur Nutzung des privaten Schlüsselmaterials für ihre Dienstzertifikate erhalten können.
</requirement>

Hinweis: Falls die Verarbeitungskontexte als Threads, Workers, o. Ä. umgesetzt sind und daher gemeinsam in einem übergreifenden Anwendungsprozess ausgeführt werden, kann dieser Anwendungsprozess eine authentisierte Verbindung zur Kryptograhieschnittstelle des HSM herstellen und aufrechterhalten, um darüber die Kryptographieschnittstelle des HSM den Verarbeitungskontexten (und nur diesen) lokal zur Verfügung zu stellen.

<requirement conformance="SHALL" key="ERP-FD74033P6P" title="E-Rezept-Fachdienst – Sicherer Kanal vom Client zum Verarbeitungskontext der VAU" version="0">
    <meta lockversion="false"/>
    <actor name="VAU E-Rezept-Fachdienst"/>
    Die VAU des E-Rezept-Fachdienstes MUSS den Aufbau eines vertraulichen und integritätsgeschützten Kommunikationskanals gemäß [gemSpec_Krypt#3.16] und [gemSpec_Krypt#7] zwischen einem Client und einem Verarbeitungskontext erzwingen, bevor der Verarbeitungskontext seine fachlichen Schnittstellen für den Client nutzbar macht.
</requirement>

#### Konsistenz des Systemzustands, Logging und Monitoring
<requirement conformance="SHALL" key="ERP-FD95094TNA" title="E-Rezept-Fachdienst – Konsistenter Systemzustand des Verarbeitungskontextes der VAU" version="0">
    <meta lockversion="false"/>
    <actor name="VAU E-Rezept-Fachdienst"/>
    Die VAU des E-Rezept-Fachdienstes MUSS sicherstellen, dass ein konsistenter Zustand des Verarbeitungskontextes auch bei Bedienfehlern oder technischen Problemen immer erhalten bleibt bzw. wiederhergestellt werden kann.
</requirement>

<requirement conformance="SHALL" key="ERP-FD43093Z73" title="E-Rezept-Fachdienst – Datenschutzkonformes Logging und Monitoring des Verarbeitungskontextes der VAU" version="0">
    <meta lockversion="false"/>
    <actor name="VAU E-Rezept-Fachdienst"/>
    Die VAU des E-Rezept-Fachdienstes MUSS die für den Betrieb eines Fachdienstes erforderlichen Logging- und Monitoring-Informationen in solcher Art und Weise erheben und verarbeiten, dass mit technischen Mitteln ausgeschlossen ist, dass dem Anbieter des E-Rezept-Fachdienstes oder Dritten vertrauliche oder zur Profilbildung geeignete Daten zur Kenntnis gelangen.
</requirement>

#### Client-Verbindungen zum Verarbeitungskontext
Um Verbindungen vom E-Rezept-Frontend des Versicherten nach [gemSpec_eRp_FdV] zum Verarbeitungskontext zu ermöglichen, ist ein der VAU vorgelagertes Routing ausgehend von einem netztechnischen Eingangspunkt (z. B. in Form eines TLS-terminierenden Load Balancers) erforderlich. Der Eingangspunkt ist im Netzwerk der TI für das Primärsystem unter mindestens einer IP-Adresse/Port-Kombination erreichbar, die im Namensdienst der TI registriert sein muss. Der Eingangspunkt vermittelt die Verbindungen zwischen dem Client und dem jeweils benötigten Verarbeitungskontext.

<requirement conformance="SHALL" key="ERP-FD24028HRF" title="E-Rezept-Fachdienst – Verarbeitungskontexte der VAU über gemeinsame Host-Adressen erreichbar" version="0">
    <meta lockversion="false"/>
    <actor name="VAU E-Rezept-Fachdienst"/>
    Die VAU des E-Rezept-Fachdienstes MUSS ihre Verarbeitungskontexte über gemeinsame IP-Adressen und Ports des Eingangspunkts des Fachdienstes erreichbar machen.
</requirement>

<requirement conformance="SHALL" key="ERP-FD11178S4L" title="E-Rezept-Fachdienst – Identität des Verarbeitungskontextes für Clients" version="0">
    <meta lockversion="false"/>
    <actor name="Verarbeitungskontext E-Rezept-Fachdienst"/>
    Der Verarbeitungskontext des E-Rezept-Fachdienstes MUSS sich gegenüber Clients mittels der Fachdienstidentität oid_erp-vau mit Zertifikatsprofil C.FD.ENC ausweisen.
</requirement>

<requirement conformance="SHALL" key="ERP-FD68443DFQ" title="E-Rezept-Fachdienst – Sicherer Kanal zum Verarbeitungskontext der VAU auf Inhaltsebene" version="0">
    <meta lockversion="false"/>
    <actor name="Eingangspunkt E-Rezept-Fachdienst"/>
    Der Eingangspunkt des E-Rezept-Fachdienstes MUSS Clients den Aufbau eines sicheren Kanals auf Inhaltsebene, d. h. einen Verbindungsaufbau gemäß [gemSpec_Krypt#3.16] und [gemSpec_Krypt#7], zum Verarbeitungskontext ermöglichen.
</requirement>

<requirement conformance="SHALL" key="ERP-FD46454DJ3" title="E-Rezept-Fachdienst – Automatisierter Abbau des sicheren Kanals" version="0">
    <meta lockversion="false"/>
    <actor name="Verarbeitungskontext E-Rezept-Fachdienst"/>
    Der Verarbeitungskontext des E-Rezept-Fachdienstes MUSS den sicheren Kanal zu einem Client nach Abschluss einer fachlichen Operation (die aus mehreren Requests bestehen kann) abbauen, sodass anschließend keine Zugriffe dieses Clients auf den Verarbeitungskontext mehr möglich sind, ohne dass eine neue Verbindung aufgebaut wird.
</requirement>

#### gematik-Logdaten zum Zwecke der gesetzlichen Kontrollpflichten der gematik
Für die Pseudonymisierung der gematik-Logdaten siehe [gemSpec_Krypt#A_27332-*].

<requirement conformance="SHALL" key="ERP-FD98306PCS" title="E-Rezept-Fachdienst – Pseudonymisieren der gematik-Logdaten – geheimer Schlüssel nur in VAU" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der E-Rezept-Fachdienst MUSS sicherstellen, dass der für das Pseudonymisieren der gematik-Logdaten benötigte geheime Schlüssel key_pn_log im Klartext ausschließlich innerhalb einer VAU-Instanz verarbeitet wird.
</requirement>

<requirement conformance="SHALL" key="ERP-FD16761XDX" title="E-Rezept-Fachdienst – Pseudonymisieren der gematik-Logdaten – Einbringen des Schlüssels im 4-Augen-Prinzip" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst"/>
    Der E-Rezept-Fachdienst MUSS sicherstellen, dass der für das Pseudonymisieren der gematik-Logdaten benötigte geheime Schlüssel key_pn_log ausschließlich im 4-Augen-Prinzip in den E-Rezept-Fachdienst eingebracht werden kann.
</requirement>

Hinweis: Der geheime Schlüssel für das Pseudonymisieren der gematik-Logdaten muss nicht im VAU-HSM gespeichert werden.

<requirement conformance="SHALL" key="ERP-FD83938KX4" title="Anbieter E-Rezept-Fachdienst – Pseudonymisieren der gematik-Logdaten – Einbringen des Schlüssels im 4-Augen-Prinzip" version="0">
    <meta lockversion="false"/>
    <actor name="Anb_eRp_FD"/>
    Der Anbieter des E-Rezept-Fachdienst MUSS den für das Pseudonymisieren der gematik-Logdaten benötigten geheimen Schlüssel key_pn_log ausschließlich im 4-Augen-Prinzip in den E-Rezept-Fachdienst einbringen.
</requirement>

<requirement conformance="SHALL" key="ERP-FD99427WMG" title="Anbieter E-Rezept-Fachdienst – Pseudonymisieren der gematik-Logdaten – unverzüglicher Schlüsselwechsel" version="0">
    <meta lockversion="false"/>
    <actor name="Anb_eRp_FD"/>
    Der Anbieter des E-Rezept-Fachdienst MUSS den für das Pseudonymisieren der gematik-Logdaten benötigten geheimen Schlüssel key_pn_log unverzüglich nach Bereitstellung durch die gematik wechseln.
</requirement>

Es ist ein jährlicher Schlüsselwechsel geplant.
