Profile: GEM_ERP_PR_Secret
Parent: Identifier
Id: GEM-ERP-PR-Secret
Title: "GEM ERP PR Secret"
Description: "Das Secret ist ein generiertes Geheimnis, das Zugriff auf eine E-Rezept-Ressource gewährt, z. B. Task."
* insert StructureDefinition(GEM_ERP_PR_Secret)
* use = #official (exactly)
* system 1.. MS
* system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret" (exactly)
* value 1.. MS
  * ^short = "Secret für die abgebende Apotheke."
  * ^definition = "Das Secret, das die Apotheke erhält, wenn das E-Rezept vom E-Rezept-Server angenommen wird."
