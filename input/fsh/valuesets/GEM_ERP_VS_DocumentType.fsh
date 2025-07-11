ValueSet: GEM_ERP_VS_DocumentType
Id: GEM-ERP-VS-DocumentType
Title: "ValueSet of Documenttype Codes"
Description: "Type of document depending on the recipient."
* insert Versioning
// Hier nicht das RuleSet "ValueSet" einfügen, da die URL hier "CodeSystem" ist. Aus Kompatibilitätsgründen wird das so belassen (Stand März '24).
* ^url = "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_VS_DocumentType"
* ^publisher = "gematik GmbH"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.gematik.de"
* include codes from system GEM_ERP_CS_DocumentType
