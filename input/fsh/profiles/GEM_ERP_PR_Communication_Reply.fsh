Profile: GEM_ERP_PR_Communication_Reply
Parent: GEM_ERP_PR_Communication
Id: GEM-ERP-PR-Communication-Reply
Title: "Antwort vom Leistungserbringer an den Patienten"
Description: "Ressource, die für die Kommunikation der Antwort zur Weitergabe/Informationsanfrage vom Leistungserbringer an Patienten/Vertreter verwendet wird"
* insert Profile(GEM_ERP_PR_Communication_Reply)

* recipient 1..1
  * identifier 1..1
  * identifier only IdentifierKvid10
  * identifier ^type[0].profile[0] = "http://fhir.de/StructureDefinition/identifier-kvid-10|1.5.4" //TODO: Remove with next minor version

* sender MS
  * identifier 1..1
  * identifier only IdentifierKvid10 or IdentifierTelematikId
  * identifier ^type[0].profile[0] = "http://fhir.de/StructureDefinition/identifier-kvid-10|1.5.4" //TODO: Remove with next minor version
  * identifier ^type[0].profile[1] = "http://fhir.de/StructureDefinition/identifier-telematik-id|1.5.4" //TODO: Remove with next minor version

* payload 1..1 MS
  * content[x] only string
  * content[x] MS
    * ^short = "Der tatsächliche Inhalt der Nachricht"
    * ^comment = "Dieser Inhalt muss gemäß gemSpec_DM_eRp ein JSON sein."

  * extension
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "url"
    * ^slicing.description = "Erweiterungen werden immer (mindestens) nach url gesliced."
    * ^slicing.rules = #closed
  * extension contains
    GEM_ERP_EX_SupplyOptionsType named OfferedSupplyOptions 0..1 and
    GEM_ERP_EX_AvailabilityState named AvailabilityStatus 0..1

  * extension[OfferedSupplyOptions] ^short = "Angebotene Lieferoptionen durch die Apotheke"
  * extension[OfferedSupplyOptions] ^definition = "In einer Kommunikation kann eine Apotheke ihre verfügbaren Lieferoptionen angeben, ob sie Kunden im Geschäft bedienen, Medikamente per Boten senden oder den Versand per Paket nutzen."
  * extension[AvailabilityStatus] ^short = "Verfügbarkeitsstatus des abgefragten Medikaments"

