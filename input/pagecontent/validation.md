### FHIR-Ressource validieren

Der E-Rezept-Fachdienst validiert von Clientsystemen beim Aufruf einer Operation übermittelte FHIR-Ressourcen. Folgende Anforderungen gelten zusätzlich zur Validierung nach FHIR.

<requirement actor="E-Rezept-Fachdienst" conformance="SHALL" key="IG-FD-ERP80390YZV" title="FHIR-Ressource validieren - Prüfung Ressource-IDs" version="1">
   Der E-Rezept-Fachdienst MUSS bei der Validierung einer Ressource prüfen, ob die ID der Ressource (Bundle.entry.resource.id) und die ID ihrer fullUrl (Bundle.entry.fullurl) übereinstimmen, und bei einer fehlerhaften Prüfung auf dieses Auffälligkeit gemäß der Konfiguration reagieren.
</requirement>

<requirement actor="E-Rezept-Fachdienst" conformance="SHALL" key="IG-FD-ERP90393RM2" title="FHIR-Ressource validieren - Prüfung Ressource-IDs - Konfiguration bei Auffälligkeiten" version="1">
   Der E-Rezept-Fachdienst MUSS eine Konfiguration für Prüfung der Ressourcen-IDs mit den Werten "Warnung" und "Fehler" vorsehen.
</requirement>

<requirement actor="E-Rezept-Fachdienst" conformance="SHALL" key="IG-FD-ERP08253W0S" title="FHIR-Ressource validieren - Prüfung Ressource-IDs - Konfiguration Warnung" version="1">
   Der E-Rezept-Fachdienst MUSS bei der Überprüfung der Ressourcen-IDs, wenn eine Auffälligkeit auftritt und die Konfiguration "Warnung" aktiv ist, mit der Abarbeitung der Operation fortfahren und bei fehlerfreier Abarbeitung mit dem Http-Responsecode 253 antworten und den Response für die Auffälligkeit mit einem Http-Header "Warning" mit

   warning-code: 253
   warning-agent: "erp-server"
   warning-text: "Die ID einer Ressource und die ID ihrer zugehörigen fullUrl stimmen nicht überein."
   versehen.
</requirement>

<requirement actor="E-Rezept-Fachdienst" conformance="SHALL" key="IG-FD-ERP91316NZD" title="FHIR-Ressource validieren - Prüfung Ressource-IDs - Konfiguration Fehler" version="1">
   Der E-Rezept-Fachdienst MUSS bei der Überprüfung der Ressourcen-IDs, wenn eine Auffälligkeit auftritt und die Konfiguration "Fehler" aktiv ist, mit dem HTTP-Fehlercode 400 abbrechen und die Fehlermeldung "Die ID einer Ressource und die ID der zugehörigen fullUrl stimmen nicht überein." in Form eines OperationOutcome ausliefern.
</requirement>

<requirement actor="E-Rezept-Fachdienst" conformance="SHALL" key="IG-FD-ERP18556DW6" title="FHIR-Ressource validieren - Prüfung Format fullUrl" version="1">
   Der E-Rezept-Fachdienst MUSS bei der Validierung einer FHIR-Ressource prüfen, ob die fullUrl dem von FHIR vorgegebene Regex zur Bildung von fullUrls [RegEx fullUrl] entspricht, und bei einer fehlerhaften Prüfung auf dieses Auffälligkeit gemäß der Konfiguration reagieren.
</requirement>

<requirement actor="E-Rezept-Fachdienst" conformance="SHALL" key="IG-FD-ERP81315PRV" title="FHIR-Ressource validieren - Prüfung Format fullUrl - Konfiguration bei Auffälligkeiten" version="1">
   Der E-Rezept-Fachdienst MUSS eine Konfiguration für die Prüfung Format fullUrl mit den Werten "Warnung" und "Fehler" vorsehen.
</requirement>

<requirement actor="E-Rezept-Fachdienst" conformance="SHALL" key="IG-FD-ERP57798BJN" title="FHIR-Ressource validieren - Prüfung Format fullUrl - Konfiguration Warnung" version="1">
   Der E-Rezept-Fachdienst MUSS bei der Prüfung Format fullUrl, wenn eine Auffälligkeit auftritt und die Konfiguration "Warnung" aktiv ist, mit der Abarbeitung der Operation fortfahren und bei fehlerfreier Abarbeitung mit dem Http-Responsecode 254 antworten und den Response mit einen Http-Header "Warning" mit

   warning-code: 254
   warning-agent: "erp-server"
   warning-text: "Format der fullUrl ist ungültig."
   erweitern.
</requirement>

<requirement actor="E-Rezept-Fachdienst" conformance="SHALL" key="IG-FD-ERP04480UWF" title="FHIR-Ressource validieren - Prüfung Format fullUrl - Konfiguration Fehler" version="1">
   Der E-Rezept-Fachdienst MUSS bei der Prüfung Format fullUrl, wenn eine Auffälligkeit auftritt und die Konfiguration "Fehler" aktiv ist, mit dem HTTP-Fehlercode 400 abbrechen und die Fehlermeldung "Format der fullUrl ist ungültig." in Form eines OperationOutcome ausliefern.
</requirement>
