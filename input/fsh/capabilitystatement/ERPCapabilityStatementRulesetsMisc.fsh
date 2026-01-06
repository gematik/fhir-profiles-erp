RuleSet: Successful
* extension[responseInfo][+]
  * extension[statusCode].valueString = "200"
  * extension[description].valueString = "Successful operation"

RuleSet: SuccessfulWithBundle
* extension[responseInfo][+]
  * extension[statusCode].valueString = "200"
  * extension[description].valueString = "Successful operation"
  * extension[responseType].valueString = "Bundle"

RuleSet: SuccessfulWithParameters
* extension[responseInfo][+]
  * extension[statusCode].valueString = "200"
  * extension[description].valueString = "Successful operation"
  * extension[responseType].valueString = "Parameters"

RuleSet: Error423Locked
* extension[responseInfo][+]
  * extension[statusCode].valueString = "423"
  * extension[description].valueString = "If the insurant objected to the medication process or objected to the submission of prescription and dispensation data into the ePA system, the Medication Service is locked."
  * extension[responseType].valueString = "application/json"
  * extension[errorCode].valueString = "locked"

RuleSet: UnknownSearchParameter
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Unknown search parameter"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_PARAM_UNKNOWN"


RuleSet: InvalidQueryParameters
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Invalid query parameter(s)"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_BAD_SYNTAX"

RuleSet: InvalidRequest
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Invalid request"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_BAD_FORMAT"


RuleSet: UnknownResourceType
* extension[responseInfo][+]
  * extension[statusCode].valueString = "404"
  * extension[description].valueString = "Unknown resource type"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_UNKNOWN_TYPE"

RuleSet: IDTokenCheck
* extension[responseInfo][+]
  * extension[statusCode].valueString = "403"
  * extension[description].valueString = "ID-Token or Insurant-ID mismatch"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "SVC_IDENTITY_MISMATCH"


RuleSet: ResourceIsNotKnown
* extension[responseInfo][+]
  * extension[statusCode].valueString = "404"
  * extension[description].valueString = "Resource is not known"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_RESOURCE_ID_FAIL"


RuleSet: ResourceWasDeleted
* extension[responseInfo][+]
  * extension[statusCode].valueString = "410"
  * extension[description].valueString = "Resource was deleted"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_DELETED"


RuleSet: EmptyList
* extension[responseInfo][+]
  * extension[statusCode].valueString = "404"
  * extension[description].valueString = "No Resource found matching the query"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_NO_MATCH"

// Medication Service specific Error
RuleSet: WrongStatusParameter
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Parameter with wrong status"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MEDSVC_STATUS_INVALID"

RuleSet: ParameterInvalidContent
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Parameter contains not allowed content"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MEDSVC_PARAMETERS_INVALID_CONTENT"


RuleSet: DosageInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Invalid dosage structure or content"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MEDSVC_DOSAGE_INVALID"


RuleSet: VersionAwareConflict
* extension[responseInfo][+]
  * extension[statusCode].valueString = "409"
  * extension[description].valueString = "Update Conflict (server current version = %s, client version referenced = %s)"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_VERSION_AWARE_CONFLICT"


RuleSet: NoValidStructure
* extension[responseInfo][+]
  * extension[statusCode].valueString = "422"
  * extension[description].valueString = "Invalid Data Structure in Medication Service"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MEDSVC_NO_VALID_STRUCTURE"


RuleSet: OrgHeaderProfileMismatch
* extension[responseInfo][+]
  * extension[statusCode].valueString = "422"
  * extension[description].valueString = "Profile mismatch in header Organization"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "SVC_ORG_HEADER_PROFILE_MISMATCH"


RuleSet: OpNotAllowed
* extension[responseInfo][+]
  * extension[statusCode].valueString = "405"
  * extension[description].valueString = "Operation %s not allowed for resource %s"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_OP_NOT_ALLOWED"


RuleSet: EMPChronologyIdMismatch
* extension[responseInfo][+]
  * extension[statusCode].valueString = "409"
  * extension[description].valueString = "Mismatch between acknowledged and current eMP chronology ID"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MEDSVC_EMP_CHRONOLOGY_ID_MISMATCH"


RuleSet: EMPLinkingNotSuccessful
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "MedicationStatement could not be linked to an eMP-Entry successfully"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "LINKING_NOT_SUCCESSFUL"


RuleSet: EMPUnlinkingNotSuccessful
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "MedicationStatement could not be unlinked from an eMP-Entry successfully"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "UNLINKING_NOT_SUCCESSFUL"


RuleSet: OperationOutsideBatch
* extension[responseInfo][+]
  * extension[statusCode].valueString = "405"
  * extension[description].valueString = "The operation can only be executed within a batch context"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MEDSVC_OPERATION_OUTSIDE_BATCH"


RuleSet: AlreadyLinked
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Already linked to another instance"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MEDSVC_ALREADY_LINKED"


RuleSet: EMPEntryAlreadyExists
* extension[responseInfo][+]
  * extension[statusCode].valueString = "409"
  * extension[description].valueString = "eMP entry already exists"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MEDSVC_EMP_ENTRY_ALREADY_EXISTS"


RuleSet: EMPNoExist
* extension[responseInfo][+]
  * extension[statusCode].valueString = "404"
  * extension[description].valueString = "eMP does not exist"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MEDSVC_EMP_NO_EXIST"


RuleSet: X-Requesting-Organization (required)
* extension[header][+]
  * extension[name].valueString = "X-Requesting-Organization"
  * extension[type].valueString = "string"
  * extension[description].valueString = "Base64 encoded FHIR Organization resource in JSON format used to identify the originator of the request"
  * extension[format].valueString = "base64(fhir+json:Organization)"
  * extension[required].valueBoolean = {required}
* extension[responseInfo][+]
  * extension[statusCode].valueString = "431"
  * extension[description].valueString = "Requesting Organization Header exceeds maximum size"
  * extension[responseType].valueString = "application/json"
  * extension[errorCode].valueString = "SVC_ORG_HEADER_TOO_LARGE"



RuleSet: ImportCapabilityStatment (capabilityStatement, expectation)
* imports[+] = Canonical({capabilityStatement})
* imports[=].extension[0].url = $capabilitystatement-expectation
* imports[=].extension[0].valueCode = {expectation}


RuleSet: CapSupportResource (resource, expectation)
* rest.resource[+].type = #{resource}
* rest.resource[=].versioning = #versioned-update
* rest.resource[=].readHistory = true
* rest.resource[=].extension[0].url = $capabilitystatement-expectation
* rest.resource[=].extension[0].valueCode = {expectation}

// RuleSet: CapProfile (profile, expectation)
// * rest.resource[=].profile = Canonical({profile})
// * rest.resource[=].profile.extension[0].url = $capabilitystatement-expectation
// * rest.resource[=].profile.extension[0].valueCode = {expectation}

RuleSet: CapProfile (profile)
* rest.resource[=].profile = Canonical({profile})


RuleSet: CapSupportProfile (profile, expectation)
* rest.resource[=].supportedProfile[+] = Canonical({profile})
* rest.resource[=].supportedProfile[=].extension[0].url = $capabilitystatement-expectation
* rest.resource[=].supportedProfile[=].extension[0].valueCode = {expectation}

RuleSet: CapResourceInteraction (interaction, expectation)
* rest.resource[=] insert CapInteraction({interaction}, {expectation})

RuleSet: CapSystemRestInteraction (interaction, expectation)
* rest insert CapInteraction({interaction}, {expectation})

RuleSet: CapInteraction (interaction, expectation)
* interaction[+]
  * code = {interaction}
  * extension[0].url = $capabilitystatement-expectation
  * extension[0].valueCode = {expectation}

RuleSet: CapSupportResourceSearchParam (name, canonical, type, expectation, documentation)
* rest.resource[=] insert CapSupportSearchParam ({name}, {canonical}, {type}, {expectation}, {documentation})

RuleSet: CapSupportResourceSearchParamNoDefinition (name, type, expectation, documentation)
* rest.resource[=].searchParam[+]
  * name = "{name}"
  * type = {type}
  * documentation = {documentation}
  * extension[0].url = $capabilitystatement-expectation
  * extension[0].valueCode = {expectation}

RuleSet: CapSupportSearchParam (name, canonical, type, expectation, documentation)
* searchParam[+]
  * name = "{name}"
  * definition = "{canonical}"
  * type = {type}
  * documentation = {documentation}
  * extension[0].url = $capabilitystatement-expectation
  * extension[0].valueCode = {expectation}

RuleSet: CapSupportCustomSearchParam (name, instance, type, expectation, documentation)
* rest.resource[=].searchParam[+].name = "{name}"
* rest.resource[=].searchParam[=].definition = Canonical({instance})
* rest.resource[=].searchParam[=].type = {type}
* rest.resource[=].searchParam[=].documentation = {documentation}
* rest.resource[=].searchParam[=].extension[0].url = $capabilitystatement-expectation
* rest.resource[=].searchParam[=].extension[0].valueCode = {expectation}

RuleSet: CapSupportResourceOperation(name, operation, expectation)
* rest.resource[=] insert CapSupportOperation({name}, {operation}, {expectation})

RuleSet: CapSupportSystemOperation(name, operation, expectation)
* rest insert CapSupportOperation({name}, {operation}, {expectation})

RuleSet: CapSupportOperation(name, operation, expectation)
* operation[+]
  * name = "{name}"
  * definition = Canonical({operation})
  * extension.url = $capabilitystatement-expectation
  * extension.valueCode = {expectation}


RuleSet: HistoryInteractionStatusCodes
* rest.resource[=].interaction[=] insert Successful
* rest.resource[=].interaction[=] insert InvalidRequest
* rest.resource[=].interaction[=] insert UnknownResourceType


RuleSet: SearchTypeInteractionStatusCodes
* rest.resource[=].interaction[=] insert Successful
* rest.resource[=].interaction[=] insert UnknownSearchParameter
* rest.resource[=].interaction[=] insert InvalidQueryParameters
* rest.resource[=].interaction[=] insert UnknownResourceType


RuleSet: ReadInteractionStatusCodes
* rest.resource[=].interaction[=] insert Successful
* rest.resource[=].interaction[=] insert InvalidRequest
* rest.resource[=].interaction[=] insert UnknownResourceType
* rest.resource[=].interaction[=] insert ResourceIsNotKnown
* rest.resource[=].interaction[=] insert ResourceWasDeleted


// RuleSet: SystemLevelOperationStatusCodes
// * rest.operation[=] insert Successful

RuleSet: SystemLevelOperationStatusCodes
* rest.operation[=] insert UnknownSearchParameter
* rest.operation[=] insert InvalidQueryParameters
* rest.operation[=] insert InvalidRequest

RuleSet: SystemLevelOperationStatusCodesWithBundle
* rest.operation[=] insert SuccessfulWithBundle
* insert SystemLevelOperationStatusCodes


RuleSet: SystemLevelQueryOperationStatusCodesWithNormalSuccess
* rest.operation[=] insert Successful
* insert SystemLevelOperationStatusCodes


RuleSet: SystemLevelOperationStatusCodesWithParameters
* rest.operation[=] insert SuccessfulWithParameters
* insert SystemLevelOperationStatusCodes

RuleSet: SystemLevelOperationStatusCodesEmptyIdTokenCheck
* rest.operation[=] insert IDTokenCheck

RuleSet: SystemLevelOperationStatusCodesEmptyList
* rest.operation[=] insert EmptyList

RuleSet: SystemLevelOperationStatusCodesGeteMP
* insert SystemLevelOperationStatusCodesEmptyList
* rest.resource[=].interaction[=] insert InvalidRequest
* rest.operation[=] insert ResourceIsNotKnown
* rest.operation[=] insert EMPNoExist


RuleSet: SystemLevelPostOperation
* rest.operation[=] insert X-Requesting-Organization(true)
* rest.operation[=] insert SuccessfulWithParameters
* rest.operation[=] insert IDTokenCheck
* rest.operation[=] insert OrgHeaderProfileMismatch


RuleSet: SystemLevelPostEMLOperation
* insert SystemLevelPostOperation
* rest.operation[=] insert DosageInvalid
* rest.operation[=] insert NoValidStructure
* rest.operation[=] insert WrongStatusParameter


RuleSet: SystemLevelUpdateEMLOperation
* insert SystemLevelPostOperation
* rest.operation[=] insert VersionAwareConflict
* rest.operation[=] insert ResourceIsNotKnown
* rest.operation[=] insert OpNotAllowed
* rest.operation[=] insert DosageInvalid
* rest.operation[=] insert NoValidStructure
* rest.operation[=] insert WrongStatusParameter


RuleSet: SystemLevelPostEMPOperation
* insert SystemLevelPostOperation
* rest.operation[=] insert DosageInvalid
* rest.operation[=] insert NoValidStructure
* rest.operation[=] insert WrongStatusParameter
* rest.operation[=] insert EMPChronologyIdMismatch
* rest.operation[=] insert ResourceIsNotKnown
* rest.operation[=] insert ResourceWasDeleted
* rest.operation[=] insert EMPEntryAlreadyExists


// RuleSet: SystemLevelPostEMPByMedicationReferenceOperation
// * insert SystemLevelPostOperation
// * rest.operation[=] insert ResourceIsNotKnown
// * rest.operation[=] insert ResourceWasDeleted
// * rest.operation[=] insert DosageInvalid
// * rest.operation[=] insert NoValidStructure
// * rest.operation[=] insert WrongStatusParameter
// * rest.operation[=] insert EMPChronologyIdMismatch


RuleSet: SystemLevelUpdateEMPOperation
* insert SystemLevelPostOperation
* rest.operation[=] insert VersionAwareConflict
* rest.operation[=] insert ResourceIsNotKnown
* rest.operation[=] insert DosageInvalid
* rest.operation[=] insert NoValidStructure
* rest.operation[=] insert WrongStatusParameter
* rest.operation[=] insert EMPChronologyIdMismatch


RuleSet: SystemLevelPostBatchEMPOperation
* rest.operation[=] insert X-Requesting-Organization(true)
* rest.operation[=] insert SuccessfulWithBundle
* rest.operation[=] insert InvalidRequest
* rest.operation[=] insert EMPChronologyIdMismatch
* rest.operation[=] insert DosageInvalid
* rest.operation[=] insert NoValidStructure
* rest.operation[=] insert OrgHeaderProfileMismatch
* rest.operation[=] insert WrongStatusParameter
* rest.operation[=] insert VersionAwareConflict
* rest.operation[=] insert ResourceIsNotKnown


RuleSet: SystemLevelPostEMPCommitOperation
// * rest.operation[=] insert X-Requesting-Organization(true)
* rest.operation[=] insert SuccessfulWithParameters
* rest.operation[=] insert OperationOutsideBatch
* rest.operation[=] insert EMPChronologyIdMismatch

// Operations on Type and Instance Level ([base]/Medication/$operation or [base]/Medication/[resId]/$operation)

RuleSet: TypeLevelPostOperation
* rest.resource[=].operation[=] insert X-Requesting-Organization(true)
* rest.resource[=].operation[=] insert SuccessfulWithParameters
* rest.resource[=].operation[=] insert IDTokenCheck
* rest.resource[=].operation[=] insert OrgHeaderProfileMismatch


RuleSet: TypeLevelPostEMLOperation
* insert TypeLevelPostOperation
* rest.resource[=].operation[=] insert NoValidStructure
* rest.resource[=].operation[=] insert DosageInvalid
* rest.resource[=].operation[=] insert WrongStatusParameter


RuleSet: TypeLevelCancelEMLOperation
* insert TypeLevelPostOperation
* rest.resource[=].operation[=] insert ResourceIsNotKnown
* rest.resource[=].operation[=] insert OpNotAllowed


RuleSet: TypeLevelLinkEMPOperation
* insert TypeLevelPostOperation
* rest.resource[=].operation[=] insert NoValidStructure
* rest.resource[=].operation[=] insert ResourceIsNotKnown
* rest.resource[=].operation[=] insert ResourceWasDeleted
* rest.resource[=].operation[=] insert WrongStatusParameter
* rest.resource[=].operation[=] insert EMPLinkingNotSuccessful
* rest.resource[=].operation[=] insert AlreadyLinked


RuleSet: TypeLevelUnlinkEMPOperation
* insert TypeLevelPostOperation
* rest.resource[=].operation[=] insert NoValidStructure
* rest.resource[=].operation[=] insert ResourceIsNotKnown
* rest.resource[=].operation[=] insert ResourceWasDeleted
* rest.resource[=].operation[=] insert OpNotAllowed
* rest.resource[=].operation[=] insert EMPUnlinkingNotSuccessful