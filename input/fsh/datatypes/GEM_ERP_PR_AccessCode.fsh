Profile: GEM_ERP_PR_AccessCode
Parent: Identifier
Id: GEM-ERP-PR-AccessCode
Title: "GEM ERP PR AccessCode"
Description: "Der AccessCode ist ein generiertes Geheimnis, das Zugriff auf eine E-Rezept-Ressource gewährt, z. B. Task."
* insert StructureDefinition(GEM_ERP_PR_AccessCode)
* use = #official (exactly)
* system 1.. MS
* system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode" (exactly)
* value 1.. MS
  * ^comment = "Das Datenmodell ist in der gemSpecDMeRp zu finden."
