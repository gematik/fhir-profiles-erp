Extension: GEM_ERP_EX_DeepLinks
Id: GEM-ERP-EX-DeepLinks
Title: "DiGA-DeepLinks"
Description: "Contains information regarding deep links for a DiGA."
* ^context[0].type = #element
* ^context[=].expression = "MedicationDispense"
* extension contains
    apple 0..1 MS and
    android 0..1 MS and
    web 0..1 MS
* extension[apple]
  * value[x] only url
* extension[android]
  * value[x] only url
* extension[web]
  * value[x] only url