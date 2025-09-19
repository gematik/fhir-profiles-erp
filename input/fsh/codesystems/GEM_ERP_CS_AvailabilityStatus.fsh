CodeSystem: GEM_ERP_CS_AvailabilityStatus
Id: GEM-ERP-CS-AvailabilityStatus
Title: "CodeSystem des Verfügbarkeitsstatus"
Description: "Typ des Verfügbarkeitsstatus für die Anfrage zur Medikamentenverfügbarkeit."
/* TODO: Technische Schuld, eigentlich müsste es * insert CodeSystem(GEM-ERP-CS-AvailabilityStatus), sein. Das führt aber zu breaking changes. IG Publisher wirft Fehler. Da der Task so eine referenz enthält können die Anpassungen nicht ohne API Versionierung getätigt werden

Das gilt auch für alle anderen Ressourcen, es wurde stets der Name mit Unterstrich für die URL verwendet, es sollte aber die ID mit Bindestrich sein
*/
* insert CodeSystem(GEM_ERP_CS_AvailabilityStatus)
* ^content = #complete
* #10 "sofort verfügbar"
* #20 "noch Heute verfügbar"
* #30 "am nächsten Werktag - vormittags"
* #40 "am nächsten Werktag- nachmittags"
* #50 "nicht verfügbar"
* #90 "unbekannt"
