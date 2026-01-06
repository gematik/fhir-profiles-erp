
RuleSet: MedicationInteraction(expectation)
* insert CapSupportResource(Medication, #SHALL)
// * insert CapProfile(EPAMedication, #SHALL)
* insert CapSupportProfile(EPAMedication, #SHALL)
* insert CapSupportProfile(EMPMedication, #SHALL)
* insert CapSupportProfile(EPAMedicationPharmaceuticalProduct, #SHALL)
* insert CapSupportProfile(EPAMedicationPZNIngredient, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#history-type, #SHALL)
* insert HistoryInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ReadInteractionStatusCodes
* insert CapResourceInteraction(#history-instance, #SHALL)
* insert ReadInteractionStatusCodes
* insert CapResourceInteraction(#vread, #SHALL)
* insert ReadInteractionStatusCodes

* insert CapSupportResourceSearchParam(_id, http://hl7.org/fhir/SearchParameter/Resource-id, #token, {expectation}, "Resource.id")
* insert CapSupportResourceSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, {expectation}, "Resource.meta.lastUpdated")
* insert CapSupportResourceSearchParamNoDefinition(_has, #string, {expectation}, "Return resources linked to by the given target")
* insert CapSupportResourceSearchParam(identifier, http://hl7.org/fhir/SearchParameter/clinical-identifier, #token, {expectation}, "Medication.identifier")
* insert CapSupportResourceSearchParam(code, http://hl7.org/fhir/SearchParameter/clinical-code, #token, {expectation}, "Medication.code")
* insert CapSupportResourceSearchParam(status, http://hl7.org/fhir/SearchParameter/Medication-status, #token, {expectation}, "Medication.status")
// * insert CapSupportResourceSearchParam(ingredient, http://hl7.org/fhir/SearchParameter/Medication-ingredient, #reference, {expectation}, "Medication.​ingredient.​item.​reference")
* insert CapSupportResourceSearchParam(ingredient-code, http://hl7.org/fhir/SearchParameter/Medication-ingredient-code, #token, {expectation}, "Medication.ingredient.item as CodeableConcept")
* insert CapSupportCustomSearchParam(rx-prescription, RxPrescriptionProcessSP, #token, {expectation}, "Medication.extension")
* insert CapSupportCustomSearchParam(context, ContextSP, #token, {expectation}, "Medication.extension:context")
// * rest.resource[=].searchInclude[+] = "Medication:ingredient"
* rest.resource[=].searchRevInclude[+] = "MedicationRequest:medication"
* rest.resource[=].searchRevInclude[+] = "MedicationDispense:medication"
* rest.resource[=].searchRevInclude[+] = "MedicationStatement:medication"
// * rest.resource[=].searchRevInclude[+] = "Medication:ingredient"


RuleSet: MedicationRequestInteraction(expectation)
* insert CapSupportResource(MedicationRequest, #SHALL)
// * insert CapProfile(EPAMedicationRequest, #SHALL)
* insert CapSupportProfile(EPAMedicationRequest, #SHALL)
* insert CapSupportProfile(EMPMedicationRequest, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#history-type, #SHALL)
* insert HistoryInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ReadInteractionStatusCodes
* insert CapResourceInteraction(#history-instance, #SHALL)
* insert ReadInteractionStatusCodes
* insert CapResourceInteraction(#vread, #SHALL)
* insert ReadInteractionStatusCodes

* insert CapSupportResourceSearchParam(_id, http://hl7.org/fhir/SearchParameter/Resource-id, #token, {expectation}, "Resource.id")
* insert CapSupportResourceSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, {expectation}, "Resource.meta.lastUpdated")
* insert CapSupportResourceSearchParamNoDefinition(_has, #string, {expectation}, "Return resources linked to by the given target")
* insert CapSupportResourceSearchParam(identifier, http://hl7.org/fhir/SearchParameter/clinical-identifier, #token, {expectation}, "MedicationRequest.identifier")
* insert CapSupportResourceSearchParam(authoredon, http://hl7.org/fhir/SearchParameter/MedicationRequest-authoredon, #date, {expectation}, "MedicationRequest.authoredOn")
* insert CapSupportResourceSearchParam(intent, http://hl7.org/fhir/SearchParameter/MedicationRequest-intent, #token, {expectation}, "MedicationRequest.intent")
* insert CapSupportResourceSearchParam(status, http://hl7.org/fhir/SearchParameter/medications-status, #token, {expectation}, "MedicationRequest.status")
* insert CapSupportResourceSearchParam(requester, http://hl7.org/fhir/SearchParameter/MedicationRequest-requester, #reference, {expectation}, "MedicationRequest.requester")
* insert CapSupportResourceSearchParam(medication, http://hl7.org/fhir/SearchParameter/medications-medication, #reference, {expectation}, "MedicationRequest.medication as Reference")
* insert CapSupportCustomSearchParam(context, ContextSP, #token, {expectation}, "MedicationRequest.extension:context")
* insert CapSupportCustomSearchParam(activity, MedicationRequestActivitySP, #reference, {expectation}, "MedicationRequest.extension:activity")
* insert CapSupportCustomSearchParam(effective-dose-period, MedicationRequestEffectiveDosePeriodSP, #date, {expectation}, "MedicationRequest.extension:effectiveDosePeriod")
* rest.resource[=].searchInclude[+] = "MedicationRequest:medication"
* rest.resource[=].searchInclude[+] = "MedicationRequest:requester"
* rest.resource[=].searchInclude[+] = "MedicationRequest:activity"
* rest.resource[=].searchRevInclude[+] = "MedicationDispense:prescription"
* rest.resource[=].searchRevInclude[+] = "MedicationStatement:derived-from"


RuleSet: MedicationDispenseInteraction(expectation)
* insert CapSupportResource(MedicationDispense, #SHALL)
* insert CapSupportProfile(GEM_ERP_PR_MedicationDispense, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ReadInteractionStatusCodes

* insert CapSupportResourceSearchParam(_id, http://hl7.org/fhir/SearchParameter/Resource-id, #token, {expectation}, "Resource.id")
* insert CapSupportResourceSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, {expectation}, "Resource.meta.lastUpdated")
* insert CapSupportResourceSearchParamNoDefinition(_has, #string, {expectation}, "Return resources linked to by the given target")
* insert CapSupportResourceSearchParam(identifier, http://hl7.org/fhir/SearchParameter/clinical-identifier, #token, {expectation}, "MedicationDispense.identifier")
* insert CapSupportResourceSearchParam(whenhandedover, http://hl7.org/fhir/SearchParameter/MedicationDispense-whenhandedover, #date, {expectation}, "MedicationDispense.whenHandedOver")
* insert CapSupportResourceSearchParam(prescription, http://hl7.org/fhir/SearchParameter/medications-prescription, #reference, {expectation}, "MedicationDispense.authorizingPrescription")
* insert CapSupportResourceSearchParam(performer, http://hl7.org/fhir/SearchParameter/MedicationDispense-performer, #reference, {expectation}, "MedicationDispense.performer.actor")
* insert CapSupportResourceSearchParam(status, http://hl7.org/fhir/SearchParameter/medications-status, #token, {expectation}, "MedicationDispense.status")
* insert CapSupportResourceSearchParam(medication, http://hl7.org/fhir/SearchParameter/medications-medication, #reference, {expectation}, "MedicationDispense.medication as Reference")
* rest.resource[=].searchInclude[+] = "MedicationDispense:medication"
* rest.resource[=].searchInclude[+] = "MedicationDispense:performer"
* rest.resource[=].searchInclude[+] = "MedicationDispense:prescription"


RuleSet: MedicationStatementInteraction(expectation)
* insert CapSupportResource(MedicationStatement, #SHALL)
// * insert CapProfile(EPAMedicationStatement, #SHALL)
* insert CapSupportProfile(EPAMedicationStatement, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#history-type, #SHALL)
* insert HistoryInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ReadInteractionStatusCodes
* insert CapResourceInteraction(#history-instance, #SHALL)
* insert ReadInteractionStatusCodes
* insert CapResourceInteraction(#vread, #SHALL)
* insert ReadInteractionStatusCodes

* insert CapSupportResourceSearchParam(_id, http://hl7.org/fhir/SearchParameter/Resource-id, #token, {expectation}, "Resource.id")
* insert CapSupportResourceSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, {expectation}, "Resource.meta.lastUpdated")
* insert CapSupportResourceSearchParamNoDefinition(_has, #string, {expectation}, "Return resources linked to by the given target")
// * insert CapSupportResourceSearchParam(identifier, http://hl7.org/fhir/SearchParameter/clinical-identifier, #token, {expectation}, "MedicationStatement.identifier")
* insert CapSupportResourceSearchParam(medication, http://hl7.org/fhir/SearchParameter/medications-medication, #reference, {expectation}, "MedicationStatement.medication as Reference")
// * insert CapSupportResourceSearchParam(part-of, http://hl7.org/fhir/SearchParameter/MedicationStatement-part-of, #reference, {expectation}, "MedicationStatement.partOf as Reference")
* insert CapSupportResourceSearchParam(status, http://hl7.org/fhir/SearchParameter/medications-status, #token, {expectation}, "MedicationStatement.status")
* insert CapSupportResourceSearchParam(effective, http://hl7.org/fhir/SearchParameter/MedicationStatement-effective, #date, {expectation}, "MedicationStatement.effective")
* insert CapSupportCustomSearchParam(rx-prescription, RxPrescriptionProcessSP, #token, {expectation}, "Medication.extension")
// Custom SearchParameter for derivedFrom MedicationStatement.derived-from
* insert CapSupportCustomSearchParam(derived-from, DerivedFromSP, #reference, {expectation}, "MedicationStatement.derivedFrom as Reference")
* insert CapSupportCustomSearchParam(context, ContextSP, #token, {expectation}, "MedicationStatement.extension:context")
* insert CapSupportCustomSearchParam(based-on-emp, BasedOnEMPSP, #reference, {expectation}, "MedicationStatement.basedOn mit Extension:is-emp = true")

* rest.resource[=].searchInclude[+] = "MedicationStatement:medication"
// * rest.resource[=].searchInclude[+] = "MedicationStatement:part-of"
* rest.resource[=].searchInclude[+] = "MedicationStatement:derived-from"
* rest.resource[=].searchInclude[+] = "MedicationStatement:based-on-emp"
* rest.resource[=].searchRevInclude[+] = "Provenance:target"

* insert CapSupportResourceOperation(add-eml-entry, AddEMLEntryOP, {expectation})
* insert TypeLevelPostEMLOperation

* insert CapSupportResourceOperation(cancel-eml-entry, CancelEMLEntryOP, {expectation})
* insert TypeLevelCancelEMLOperation

* insert CapSupportResourceOperation(link-emp, LinkEMPEntryOP, {expectation})
* insert TypeLevelLinkEMPOperation

* insert CapSupportResourceOperation(unlink-emp, UnlinkEMPEntryOP, {expectation})
* insert TypeLevelUnlinkEMPOperation


RuleSet: OrganizationInteraction(expectation)
* insert CapSupportResource(Organization, #SHALL)
* insert CapSupportProfile(OrganizationDirectory, #SHALL)
* insert CapSupportProfile(TIOrganization, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#history-type, #SHALL)
* insert HistoryInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ReadInteractionStatusCodes
* insert CapResourceInteraction(#history-instance, #SHALL)
* insert ReadInteractionStatusCodes
* insert CapResourceInteraction(#vread, #SHALL)
* insert ReadInteractionStatusCodes

* insert CapSupportResourceSearchParam(_id, http://hl7.org/fhir/SearchParameter/Resource-id, #token, {expectation}, "Resource.id")
* insert CapSupportResourceSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, {expectation}, "Resource.meta.lastUpdated")
* insert CapSupportResourceSearchParamNoDefinition(_has, #string, {expectation}, "Return resources linked to by the given target")
* insert CapSupportResourceSearchParam(identifier, http://hl7.org/fhir/SearchParameter/Organization-identifier, #token, {expectation}, "Organization.identifier")
* insert CapSupportResourceSearchParam(name, http://hl7.org/fhir/SearchParameter/Organization-name, #string, {expectation}, "Organization.name | Organization.alias")
* rest.resource[=].searchRevInclude[+] = "MedicationDispense:performer"
* rest.resource[=].searchRevInclude[+] = "PractitionerRole:organization"
* rest.resource[=].searchRevInclude[+] = "MedicationRequest:requester"


RuleSet: PractitionerInteraction(expectation)
* insert CapSupportResource(Practitioner, #SHALL)
* insert CapSupportProfile(PractitionerDirectory, #SHALL)
* insert CapSupportProfile(TIPractitioner, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#history-type, #SHALL)
* insert HistoryInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ReadInteractionStatusCodes
* insert CapResourceInteraction(#history-instance, #SHALL)
* insert ReadInteractionStatusCodes
* insert CapResourceInteraction(#vread, #SHALL)
* insert ReadInteractionStatusCodes

* insert CapSupportResourceSearchParam(_id, http://hl7.org/fhir/SearchParameter/Resource-id, #token, {expectation}, "Resource.id")
* insert CapSupportResourceSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, {expectation}, "Resource.meta.lastUpdated")
* insert CapSupportResourceSearchParamNoDefinition(_has, #string, {expectation}, "Return resources linked to by the given target")
* insert CapSupportResourceSearchParam(identifier, http://hl7.org/fhir/SearchParameter/Practitioner-identifier, #token, {expectation}, "Practitioner.identifier")
* insert CapSupportResourceSearchParam(name, http://hl7.org/fhir/SearchParameter/Practitioner-name, #string, {expectation}, "Practitioner.name")
// * rest.resource[=].searchRevInclude[+] = "MedicationDispense:performer"
* rest.resource[=].searchRevInclude[+] = "PractitionerRole:practitioner"
* rest.resource[=].searchRevInclude[+] = "MedicationRequest:requester"


RuleSet: PractitionerRoleInteraction(expectation)
* insert CapSupportResource(PractitionerRole, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#history-type, #SHALL)
* insert HistoryInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ReadInteractionStatusCodes
* insert CapResourceInteraction(#history-instance, #SHALL)
* insert ReadInteractionStatusCodes
* insert CapResourceInteraction(#vread, #SHALL)
* insert ReadInteractionStatusCodes

* insert CapSupportResourceSearchParam(_id, http://hl7.org/fhir/SearchParameter/Resource-id, #token, {expectation}, "Resource.id")
* insert CapSupportResourceSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, {expectation}, "Resource.meta.lastUpdated")
* insert CapSupportResourceSearchParamNoDefinition(_has, #string, {expectation}, "Return resources linked to by the given target")
* insert CapSupportResourceSearchParam(identifier, http://hl7.org/fhir/SearchParameter/PractitionerRole-identifier, #token, {expectation}, "PractitionerRole.identifier")
* insert CapSupportResourceSearchParam(practitioner, http://hl7.org/fhir/SearchParameter/PractitionerRole-practitioner, #reference, {expectation}, "PractitionerRole.practitioner")
* insert CapSupportResourceSearchParam(organization, http://hl7.org/fhir/SearchParameter/PractitionerRole-organization, #reference, {expectation}, "PractitionerRole.organization")
* rest.resource[=].searchInclude[+] = "PractitionerRole:practitioner"
* rest.resource[=].searchInclude[+] = "PractitionerRole:organization"
* rest.resource[=].searchRevInclude[+] = "MedicationDispense:performer"
* rest.resource[=].searchRevInclude[+] = "MedicationRequest:requester"


RuleSet: ProvenanceInteraction(expectation)
* insert CapSupportResource(Provenance, #SHALL)
* insert CapSupportProfile(EPAActivityProvenance, #SHALL)
* insert CapSupportProfile(EMPChronologyProvenance, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
// * insert CapResourceInteraction(#history-type, #SHALL)
// * insert HistoryInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ReadInteractionStatusCodes
// * insert CapResourceInteraction(#history-instance, #SHALL)
// * insert ReadInteractionStatusCodes
// * insert CapResourceInteraction(#vread, #SHALL)
// * insert ReadInteractionStatusCodes

* insert CapSupportResourceSearchParam(_id, http://hl7.org/fhir/SearchParameter/Resource-id, #token, {expectation}, "Resource.id")
* insert CapSupportResourceSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, {expectation}, "Resource.meta.lastUpdated")
* insert CapSupportResourceSearchParamNoDefinition(_has, #string, {expectation}, "Return resources linked to by the given target")
* insert CapSupportResourceSearchParam(agent, http://hl7.org/fhir/SearchParameter/Provenance-agent, #reference, {expectation}, "Who participated")
* insert CapSupportCustomSearchParam(agent-identifier, ProvenanceAgentIdentifierSP, #token, {expectation}, "Provenance.agent.who.identifier")
* insert CapSupportResourceSearchParam(target, http://hl7.org/fhir/SearchParameter/Provenance-target, #reference, {expectation}, "Target References - usually version specific")
* insert CapSupportResourceSearchParam(recorded, http://hl7.org/fhir/SearchParameter/Provenance-recorded, #date, {expectation}, "When the activity was recorded / updated")
* insert CapSupportResourceSearchParam(when, http://hl7.org/fhir/SearchParameter/Provenance-when, #date, {expectation}, "Provenance.occurred as dateTime")
* insert CapSupportCustomSearchParam(is-emp-chronology, IsEMPChronologySP, #token, {expectation}, "Provenance.extension:isEMPChronology")
// TODO: Custom SearchParameter for extension of the Type MedicationStatement.extension.typr
* rest.resource[=].searchInclude[+] = "Provenance:agent"
* rest.resource[=].searchInclude[+] = "Provenance:target"
// * rest.resource[=].searchRevInclude[+] = "Provenance:target"







