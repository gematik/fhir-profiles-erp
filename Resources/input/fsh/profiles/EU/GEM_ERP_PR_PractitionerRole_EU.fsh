Profile: GEM_ERP_PR_PractitionerRole_EU
Parent: PractitionerRole
Id: GEM-ERP-PR-PractitionerRole-EU
Title: "PractitionerRole Information Received from the EU"
Description: "This PractitionerRole Profile is sent by the NCPeH when redeeming a Prescription in the EU"
* insert Profile(GEM_ERP_PR_PractitionerRole_EU)

* practitioner 1..1 MS
* practitioner only Reference(GEM_ERP_PR_Practitioner_EU)

* organization 1..1 MS
* organization only Reference(GEM_ERP_PR_Organization_EU)