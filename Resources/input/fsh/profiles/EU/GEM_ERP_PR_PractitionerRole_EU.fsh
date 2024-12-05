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

//TODO: speciality

/*
Profession	"The profession of the HP prescribing the medicine.
Example: Physician."	BASIC	Mandatory	ehdsi-dataelement-229 Profession mit valueset: http://52.212.185.219/html/publication/epSOS/epsos-html-20240422T073854/voc-1.3.6.1.4.1.12559.11.10.1.3.1.42.1-2020-04-22T155100.html	https://simplifier.net/for/kbvprforpractitioner	Practitioner.qualification:Typ.code.coding.code	Übertragung der entsprechenden Information aus der angegebenen Element Id des Profils KBV_PR_FOR_Practitioner in das dargestellte CDA Feld. Aus deutscher Sicht ist anhand der im besagten Feld enthaltenen Information lediglich zwischen ÄrztInnen und ZahnärztInnen zu unterscheiden. Ein entsprechendes Mapping auf das im CDA Element verwendete Valueset ist erforderlich.
Medical Specialty	"The field of practice/specialization of the HP prescribing the medicine.
Example: Dermatologist."	BASIC	Optional	-	-	-	Aus dem Profil KBV_PR_FOR_Practitioner wäre prinzipiell eine entsprechende Information aus den Elementen Practitioner.qualification:Berufsbezeichnung und Practitioner.qualification:ASV-Fachgruppennummer ableitbar. Da es sich bei erstgenanntem jedoch um ein Freitextfeld handelt, eine Angabe des zweitgenannten lediglich im Kontext einer ambulante spezialfachärztlichen Versorgung (ASV) erfasst würde und es sich hier um eine optional zu übermittelende Information handelt, soll diese aus Sicht der AutorInnen nicht übermittelt werden.
*/