Profile: GEM_ERP_PR_Communication_Reply
Parent: GEM_ERP_PR_Communication
Id: GEM-ERP-PR-Communication-Reply
Title: "Reply from Provider to Patient"
Description: "Ressource used for the communication of the reply to dispense/info request from provider to patient/representative"
* insert Profile(GEM_ERP_PR_Communication_Reply)
* basedOn 1..1
* basedOn only Reference(GEM_ERP_PR_Task)
  * ^type.aggregation = #referenced
  * reference 1..1

* status = #unknown (exactly)

* sent MS
* received MS

* recipient 1..1
  * identifier 1..1
  * identifier only IdentifierKvid10

* sender MS
  * identifier 1..1
  * identifier only IdentifierKvid10 or IdentifierTelematikId

* payload 1..1 MS
  * content[x] only string
  * content[x] MS
    * ^short = "The actual content of the message"
    * ^comment = "This content needs to be a JSON according to gemSpec_DM_eRp."

  * extension
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "url"
    * ^slicing.description = "Extensions are always sliced by (at least) url"
    * ^slicing.rules = #closed
  * extension contains
    GEM_ERP_EX_SupplyOptionsType named OfferedSupplyOptions 0..1 and
    GEM_ERP_EX_AvailabilityState named AvailabilityStatus 0..1

  * extension[OfferedSupplyOptions] ^short = "Offered supply options by pharmacy"
  * extension[OfferedSupplyOptions] ^definition = "In a communication reply a pharmacy may state its available supply options, whether to serve customers at the store, send medication by messenger or use parcel shippment"
  * extension[AvailabilityStatus] ^short = "Availability Status of queried medication"

