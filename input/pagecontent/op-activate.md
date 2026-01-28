Die FHIR-Operation `$activate` überführt einen im Status `draft` befindlichen `Task` in den Status `ready`, nachdem das Primärsystem den qualifiziert elektronisch signierten Verordnungsdatensatz (QES) übermittelt hat. Der E-Rezept-Fachdienst validiert dabei Identitäten, Flowtype-spezifische Inhalte sowie die Signatur und erzeugt anschließend serverseitige Nachweise und Downstream-Daten (z.B. ePA Medication Service, Push-Benachrichtigungen).

## Nachricht

Die Nachricht wird als HTTP `POST` an `/Task/{id}/$activate` gesendet und enthält den PKCS#7-kapselten QES-Datensatz als `Parameters`-Ressource. Der Aufruf MUSS den AccessCode im Header `X-AccessCode` oder als URL-Parameter `ac` übermitteln und darf nur erfolgen, solange der `Task.status = draft` ist ([gemSpec_FD_eRp#A_19114], [A_19128]).

### Auslösung

Das Primärsystem (PVS/KIS) ruft `$activate` unmittelbar nach der QES-Erzeugung auf. Grundlage ist die zuvor erhaltene PrescriptionID. Vor dem Versand MUSS das System sicherstellen, dass alle Pflichtangaben (u.a. KVNR, Coverage, Medication, Flowtype, PerformerType) vollständig sind und der Workflow zum Ziel (Apotheke, Kostenträger, DiGA) passt.

### FHIR Operation API

**Serverpflichten gemäß gemSpec_FD_eRp Kap. 6.1.2.2**

#### Allgemeine Anforderungen der Operation

##### Vorbedingungen und Transport

<requirement conformance="SHALL" key="IG-ERP-62" title="E-Rezept-Fachdienst - Task aktivieren - Task nach Aktivierung bereitstellen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS bei erfolgreichem `$activate` den adressierten Task in den Status <i>ready</i> überführen und die aktualisierte Ressource im Response zurückgeben.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-63" title="E-Rezept-Fachdienst - Task aktivieren - PKCS#7-Parameter prüfen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS den übergebenen QES-Datensatz als Enveloping CAdES PKCS#7 entgegennehmen und bei fehlender bzw. ungültiger ASN.1-Struktur die Operation mit HTTP 400 abbrechen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-64" title="E-Rezept-Fachdienst - Task aktivieren - Prüfung AccessCode Rezept aktualisieren" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS vor jeder Aktivierung den bereitgestellten AccessCode aus HTTP-Header <i>X-AccessCode</i> bzw. Parameter <i>ac</i> mit dem im Task gespeicherten Wert vergleichen und den Aufruf bei Abweichung oder fehlender Angabe mit HTTP 403 abbrechen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-65" title="E-Rezept-Fachdienst - Task aktivieren - Brute-Force-Drosselung für AccessCodes" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS bei fehlenden oder ungültigen AccessCodes den Aufruf mit HTTP 403 abbrechen, den `Warning`-Header zur Brute-Force-Drosselung setzen und die nächste mögliche Aktivierung künstlich verzögern.
</requirement>

##### Signatur- und Payload-Validierung

<requirement conformance="SHALL" key="IG-ERP-66" title="E-Rezept-Fachdienst - Task aktivieren - Signaturzertifikat des HBA validieren" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS das QES-Signaturzertifikat C.HP.QES gemäß gemSpec_PKI (inklusive OCSP-Prüfung) validieren und bei fehlgeschlagener Online-Prüfung den Aufruf mit HTTP 512 beenden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-67" title="E-Rezept-Fachdienst - Task aktivieren - QES und KBV-Bundle validieren" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS die qualifizierte Signatur prüfen, das eingebettete FHIR-Bundle gegen `kbv.ita.erp` bzw. `kbv.itv.evdga` validieren und den PKCS#7-Datensatz sicher speichern; Fehler sind mit HTTP 400 zu quittieren.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-68" title="E-Rezept-Fachdienst - Task aktivieren - Signatur-MimeType prüfen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS den MimeType des signierten Dokuments auf <i>text/plain; charset=utf-8</i> prüfen und bei Abweichungen mit HTTP 400 abbrechen.
</requirement>

##### Ableitungen und Folgeverarbeitung

<requirement conformance="SHALL" key="IG-ERP-69" title="E-Rezept-Fachdienst - Task aktivieren - PerformerType aus Flowtype ableiten" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren eines Tasks das Feld <i>Task.performerType</i> anhand der Prozessparameter des Flowtypes befüllen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-70" title="E-Rezept-Fachdienst - Task aktivieren - KVNR in Task.for übernehmen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS die KVNR aus <i>Patient.identifier</i> (System `http://fhir.de/sid/gkv/kvid-10`) in <i>Task.for</i> übernehmen, damit die Patientenreferenz im Workflow eindeutig ist.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-71" title="E-Rezept-Fachdienst - Task aktivieren - Verordnungsdaten für ePA Medication Service bereitstellen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS nach erfolgreichem `$activate` die Verordnungsdaten für den ePA Medication Service vorbereiten.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-72" title="E-Rezept-Fachdienst - Task aktivieren - Push Notification erp.task.activate auslösen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS bei erfolgreicher Aktivierung den Push-Trigger <i>erp.task.activate</i> für die KVNR aus <i>Task.for</i> starten.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-73" title="E-Rezept-Fachdienst - Task aktivieren - Serversigniertes Bundle erzeugen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS das QES-Bundle normalisieren, mit ID.FD.OSIG als detached JWS signieren und das Ergebnis als Dokumenttyp 2 in <i>Task.input</i> referenzieren.
</requirement>

#### Identifikations- und Prüfziffern

##### Kostenträger (IKNR)

<requirement conformance="SHALL" key="IG-ERP-74" title="E-Rezept-Fachdienst - Task aktivieren - IKNR der Krankenkasse prüfen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS beim Aktivieren den Wert <i>Coverage.payor.identifier.value</i> gemäß IK-Prüfziffervalidierung kontrollieren und bei Fehlern HTTP 400 mit der definierten Meldung liefern.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-75" title="E-Rezept-Fachdienst - Task aktivieren - Alternative IKNR prüfen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS bei vorhandenem Wert in <i>Coverage.payor.identifier.extension:alternativeID</i> prüfen, dass dieser das IK-Prüfzifferverfahren besteht; andernfalls ist die Operation mit HTTP 400 abzulehnen.
</requirement>

##### Leistungserbringer (LANR/ZANR)

<requirement conformance="SHALL" key="IG-ERP-76" title="E-Rezept-Fachdienst - Task aktivieren - ANR/ZANR prüfen und bei Konfiguration Fehler abbrechen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS, wenn die Prüfung der LANR/ZANR eine Auffälligkeit erkennt und die Konfiguration auf „Fehler“ gestellt ist, mit HTTP 400 abbrechen und den angegebenen Fehlertest liefern.
</requirement>

##### Arzneimittel (PZN)

<requirement conformance="SHALL" key="IG-ERP-77" title="E-Rezept-Fachdienst - Task aktivieren - PZN in KBV_PR_ERP_Medication_PZN validieren" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS die PZN in <i>KBV_PR_ERP_Medication_PZN</i> gemäß Prüfziffer berechnen und bei Ungültigkeit HTTP 400 mit der vorgesehenen Meldung zurückgeben.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-78" title="E-Rezept-Fachdienst - Task aktivieren - PZN in Rezepturen prüfen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS auch für <i>KBV_PR_ERP_Medication_Compounding</i> die PZN-Prüfziffer kontrollieren und bei Fehlern die Operation beenden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-79" title="E-Rezept-Fachdienst - Task aktivieren - PZN-Länge prüfen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS sicherstellen, dass jede übergebene PZN exakt achtstellig ist, andernfalls ist HTTP 400 mit dem Hinweis „Länge PZN unzulässig“ zurückzugeben.
</requirement>

##### Patient (KVNR)

<requirement conformance="SHALL" key="IG-ERP-80" title="E-Rezept-Fachdienst - Task aktivieren - Patientenidentifier als KVNR erzwingen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS sicherstellen, dass in der Patient-Ressource der Identifier das System `http://fhir.de/sid/gkv/kvid-10` verwendet; bei Abweichung ist HTTP 400 mit der entsprechenden Fehlermeldung zu liefern.
</requirement>

##### Datums- und Konsistenzprüfungen

<requirement conformance="SHALL" key="IG-ERP-81" title="E-Rezept-Fachdienst - Task aktivieren - AuthoredOn und Signaturdatum abgleichen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS sicherstellen, dass <i>MedicationRequest.authoredOn</i> und das Signaturdatum aus dem QES taggleich sind; bei Abweichungen ist HTTP 400 mit dem vorgesehenen Hinweis zurückzugeben.
</requirement>

#### Flowtype-spezifische Anforderungen

##### Flowtypes 160/169/200/209: Zulässige Berufsgruppen für QES

<requirement conformance="SHALL" key="IG-ERP-82" title="E-Rezept-Fachdienst - Task aktivieren - QES für Flowtype 160/169/200/209 nur durch berechtigte Berufsgruppen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS für Flowtypes 160, 169, 200 und 209 prüfen, dass die QES von einer zulässigen professionOID (z.B. <i>oid_arzt</i>, <i>oid_zahnarzt</i>) stammt und bei unzulässigen Berufsgruppen mit HTTP 400 abbrechen.
</requirement>

##### Flowtype 166: T-Rezept-spezifische Payload-Prüfung

<requirement conformance="SHALL" key="IG-ERP-83" title="E-Rezept-Fachdienst - Task aktivieren - T-Rezept-spezifische Payload-Prüfung" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS bei Flowtype 166 sicherstellen, dass das Bundle eine <i>MedicationRequest</i> plus eine <i>Medication</i> mit Kategorie 02 enthält; andernfalls ist HTTP 400 mit dem entsprechenden Fehlertext zu liefern.
</requirement>

##### Flowtype 162: DiGA-spezifische Prüfungen

<requirement conformance="SHALL" key="IG-ERP-84" title="E-Rezept-Fachdienst - Task aktivieren - DiGA-spezifische Payload-Prüfung" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS für Flowtype 162 eine <i>DeviceRequest</i>-Ressource sowie <i>Composition.type = e16D</i> verlangen und bei Abweichungen mit HTTP 400 abbrechen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-85" title="E-Rezept-Fachdienst - Task aktivieren - PZN in KBV_PR_EVDGA_HealthAppRequest validieren" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS für Flowtype 162 die PZN in <i>KBV_PR_EVDGA_HealthAppRequest.code</i> gemäß den Technischen Hinweisen prüfen; Fehler führen zu HTTP 400.
</requirement>

##### Coverage-Type: GKV- und PKV-Workflows

<requirement conformance="SHALL" key="IG-ERP-86" title="E-Rezept-Fachdienst - Task aktivieren - Coverage-Type für GKV-Workflows" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS sicherstellen, dass bei Flowtypes 160, 162 und 169 <i>Coverage.type.coding.code</i> nicht den Wert <i>PKV</i> enthält; Verstöße führen zu HTTP 400.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-87" title="E-Rezept-Fachdienst - Task aktivieren - Coverage-Type für PKV-Workflows" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS für Flowtypes 200 und 209 sicherstellen, dass der Coverage-Typ den Wert <i>PKV</i> enthält; andernfalls ist die Operation abzulehnen.
</requirement>

##### Allgemeine Inhaltsausschlüsse

<requirement conformance="SHALL" key="IG-ERP-88" title="E-Rezept-Fachdienst - Task aktivieren - Betäubungsmittel ausschließen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS `$activate` mit dem Fehler „BTM nicht zulässig“ abbrechen, wenn das Bundle <i>Medication.extension:KBV_EX_ERP_Medication_Category = 01</i> enthält.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-89" title="E-Rezept-Fachdienst - Task aktivieren - Alternative IK für Flowtype 162 verbieten" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS Verordnungen des Flowtype 162 mit <i>Coverage.payor.identifier.extension:alternativeID</i> mit HTTP 400 abweisen, um Unfallkassen auszuschließen.
</requirement>

##### Ableitungen aus Flowtype (EU-Einlösbarkeit)

<requirement conformance="SHALL" key="IG-ERP-90" title="E-Rezept-Fachdienst - Task aktivieren - Einlösbarkeit im EU-Ausland kennzeichnen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS <i>Task.extension:eu-isRedeemableByProperties</i> auf „true“ setzen, wenn Flowtype 160 oder 200 mit PZN-Verordnung vorliegt, und ansonsten auf „false“.
</requirement>

#### Anforderungen für Mehrfachverordnungen

##### Flowtype-Zulässigkeit

<requirement conformance="SHALL" key="IG-ERP-91" title="E-Rezept-Fachdienst - Task aktivieren - Zulässige Flowtypes für Mehrfachverordnungen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS bei <i>Mehrfachverordnung.kennzeichen = true</i> sicherstellen, dass der Flowtype 160, 169, 200 oder 209 beträgt; anderenfalls ist HTTP 400 zurückzugeben.
</requirement>

##### Zählwerte (Numerator/Denominator)

<requirement conformance="SHALL" key="IG-ERP-92" title="E-Rezept-Fachdienst - Task aktivieren - Maximal vier Teilverordnungen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS Numerator und Denominator auf Werte ≤ 4 prüfen und bei Überschreitung mit HTTP 400 abbrechen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-93" title="E-Rezept-Fachdienst - Task aktivieren - Numerator größer 0" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS bei Mehrfachverordnungen sicherstellen, dass der Numerator mindestens 1 ist; ansonsten ist die Operation unzulässig.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-94" title="E-Rezept-Fachdienst - Task aktivieren - Denominator mindestens 2" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS sicherstellen, dass der Denominator ≥ 2 ist, da Mehrfachverordnungen aus mindestens zwei Teilen bestehen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-95" title="E-Rezept-Fachdienst - Task aktivieren - Numerator darf Denominator nicht überschreiten" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS sicherstellen, dass Numerator ≤ Denominator ist; andernfalls ist HTTP 400 zurückzugeben.
</requirement>

##### Ausschlüsse und Konsistenzregeln

<requirement conformance="SHALL" key="IG-ERP-96" title="E-Rezept-Fachdienst - Task aktivieren - Keine MVO-Extensions bei normalen Verordnungen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS `$activate` mit HTTP 400 beenden, wenn eine Verordnung MVO-Extensions enthält, obwohl das Kennzeichen = false ist.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-97" title="E-Rezept-Fachdienst - Task aktivieren - Keine Kombination mit Entlassrezept" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS den Aufruf mit HTTP 400 abweisen, wenn eine Verordnung als Mehrfachverordnung und gleichzeitig als Entlassrezept gekennzeichnet ist.
</requirement>

##### Zeitraum und ID-Schema

<requirement conformance="SHALL" key="IG-ERP-98" title="E-Rezept-Fachdienst - Task aktivieren - Beginn der Einlösefrist Pflicht" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS bei Mehrfachverordnungen sicherstellen, dass <i>Mehrfachverordnung.Zeitraum.start</i> gesetzt ist; fehlt der Wert, ist die Aktivierung mit HTTP 400 zu beenden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-99" title="E-Rezept-Fachdienst - Task aktivieren - Enddatum darf Startdatum nicht unterschreiten" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS sicherstellen, dass ein angegebenes Enddatum ≥ Startdatum ist; sonst ist die Operation ungültig.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-100" title="E-Rezept-Fachdienst - Task aktivieren - ID-Schema für Mehrfachverordnungen prüfen" version="0">
  <meta lockversion="false"/>
  <actor name="E-Rezept-Fachdienst">
    <testProcedure id="Produkttest"/>
  </actor>
  Der E-Rezept-Fachdienst MUSS sicherstellen, dass die ID in <i>Mehrfachverordnung.ID.valueIdentifier</i> dem in der KBV-Technischen Anlage definierten Schema entspricht; Abweichungen führen zu HTTP 400.
</requirement>

<div class="gematik-api"
  data-api-type="FHIROperation"
  data-api-fhir-invoke-level="instance"
  data-api-operation-id="activateTask">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server.json %}
    </pre>
  </div>
  <div id="OperationDefinition">
    <pre>
      {% include OperationDefinition-ActivateOperation.json %}
    </pre>
  </div>
  <div id="Request-Examples">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Parameters/ExampleOperationActivateParametersInput JSON %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Parameters/ExampleOperationActivateParametersInput XML %}
    </div>
  </div>
  <div id="Response-Examples">
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment Task/607255ed-ce41-47fc-aad3-cfce1c39963f JSON %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment Task/607255ed-ce41-47fc-aad3-cfce1c39963f XML %}
    </div>
    <div data-name="application/fhir+json" data-type="JSON" data-render="ig-Fragment">
      {% fragment OperationOutcome/ExampleOperationActivateError JSON %}
    </div>
    <div data-name="application/fhir+xml" data-type="XML" data-render="ig-Fragment">
      {% fragment OperationOutcome/ExampleOperationActivateError XML %}
    </div>
  </div>
</div>

## Geschäftslogik

Die Aktivierung folgt einem streng sequenziellen Prüfpfad:

1. **Authentisierung und Statusprüfung:** AccessCode, optional Secret und Taskstatus `draft` bilden die Eintrittskriterien. Verletzungen führen zu 403.
2. **Identitäts- und Attributvalidierungen:** IKNR, alternative Kostenträger-IDs, KVNR (Patient), LANR/ZANR (Performer) und PZN werden mit den jeweiligen Prüfziffern kontrolliert. Zusätzlich gelten Flowtype-spezifische Constraints (Coverage-Typ, DiGA DeviceRequest, T-Rezept Medication category).
3. **Mehrfachverordnungslogik:** Für Kennzeichnung `Mehrfachverordnung=true` prüft der Fachdienst Numerator/Denominator, Datumsfenster und Rechtsgrundlage. Entlass-/Ersatzrezepte sowie unvollständige Zeiträume werden abgewiesen.
4. **QES- und Schemaprüfung:** Der PKCS#7-Datensatz wird gegen ETSI/QES-Regeln validiert; das eingebettete Bundle muss KBV-konform sein. OCSP-Fehler resultieren in HTTP 512.
5. **Persistenz und Ableitungen:** Bei Erfolg speichert der Fachdienst QES und serversigniertes Bundle, übernimmt KVNR und performerType in den Task, setzt `Task.status = ready`, ermittelt EU-Einlösbarkeit und stellt Daten für den ePA Medication Service bereit ([A_25925]).
6. **Benachrichtigungen:** Es erfolgt eine Push Notification `erp.task.activate` an das E-Rezept-FdV sowie Logging/Audit nach Vorgabe ([A_28126]).

{% include IG-ERP-BL-TASK-ACTIVATE.svg %}

## Sicherheitsanforderungen

Zusätzlich zu den allgemeinen Vorgaben gelten:

- Zugriffe ohne gültigen AccessCode werden verworfen; bei Fehlversuchen greift die Brute-Force-Drosselung via HTTP-Header `Warning` und künstlicher Verzögerung ([A_20703]).
- Der QES muss mit einer nicht gesperrten HBA-Identität erstellt worden sein; OCSP-Prüfungen sind verpflichtend und Timeout führt zu HTTP 512 ([A_20159-04]).
- Der Payload darf keine Betäubungsmittel enthalten, solange der Workflow dies nicht explizit vorsieht ([A_22231]).
- Erfolgreiche Aktivierungen lösen Push-Nachrichten aus, wodurch Versicherte über neue offene Verordnungen informiert werden ([A_28126]).

Weitere Sicherheitsgrundlagen sind im Dokument [menu-schnittstellen-datenschutz-und-sicherheit.html](./menu-schnittstellen-datenschutz-und-sicherheit.html) beschrieben.
