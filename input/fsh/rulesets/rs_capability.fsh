RuleSet: CapSupportResource (resource, expectation)
* rest.resource[+].type = #{resource}
* rest.resource[=].versioning = #versioned-update
* rest.resource[=].readHistory = true
* rest.resource[=].extension[0].url = $capabilitystatement-expectation
* rest.resource[=].extension[0].valueCode = {expectation}

RuleSet: CapProfile (profile, expectation)
* rest.resource[=].profile = Canonical({profile})
* rest.resource[=].profile.extension[0].url = $capabilitystatement-expectation
* rest.resource[=].profile.extension[0].valueCode = {expectation}

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


RuleSet: SystemLevelOperationStatusCodes
* rest.operation[=].extension[responseInfo][+]
  * extension[statusCode].valueString = "200"
  * extension[description].valueString = "Successful operation"
* rest.operation[=].extension[responseInfo][+]
  * extension[statusCode].valueString = "403"
  * extension[description].valueString = "ID-Token or Insurant-ID mismatch"
  * extension[responseType].valueString = "OperationOutcome"
* rest.operation[=].extension[responseInfo][+]
  * extension[statusCode].valueString = "423"
  * extension[description].valueString = "If the insurant objected to the submission of prescription and dispensation data into the ePA system, the Medication Service is locked"
  * extension[responseType].valueString = "application/json"
  * extension[errorCode].valueString = "locked"


RuleSet: SystemLevelOperationWithIdTokenCheckStatusCodes
* insert SystemLevelOperationStatusCodes
* rest.operation[=].extension[responseInfo][+]
  * extension[statusCode].valueString = "403"
  * extension[description].valueString = "ID-Token or Insurant-ID mismatch"
  * extension[responseType].valueString = "OperationOutcome"

RuleSet: HistoryInteractionStatusCodes
* rest.resource[=].interaction[=].extension[responseInfo][+]
  * extension[statusCode].valueString = "200"
  * extension[description].valueString = "Successful operation"
* rest.resource[=].interaction[=].extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Invalid request"
  * extension[responseType].valueString = "OperationOutcome"
* rest.resource[=].interaction[=].extension[responseInfo][+]
  * extension[statusCode].valueString = "404"
  * extension[description].valueString = "Unknown resource type"
  * extension[responseType].valueString = "OperationOutcome"


RuleSet: SearchTypeInteractionStatusCodes
* insert HistoryInteractionStatusCodes

* rest.resource[=].interaction[=].extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Unknown search parameter"
  * extension[responseType].valueString = "OperationOutcome"
* rest.resource[=].interaction[=].extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Invalid query parameter(s)"
  * extension[responseType].valueString = "OperationOutcome"


RuleSet: ReadInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes

* rest.resource[=].interaction[=].extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Invalid request"
  * extension[responseType].valueString = "application/json"
  * extension[errorCode].valueString = "malformedRequest"
* rest.resource[=].interaction[=].extension[responseInfo][+]
  * extension[statusCode].valueString = "404"
  * extension[description].valueString = "Resource is not known"
  * extension[responseType].valueString = "OperationOutcome"
* rest.resource[=].interaction[=].extension[responseInfo][+]
  * extension[statusCode].valueString = "404"
  * extension[description].valueString = "Not found"
  * extension[responseType].valueString = "OperationOutcome"
// For ePA 3.1.2
* rest.resource[=].interaction[=].extension[responseInfo][+]
  * extension[statusCode].valueString = "410"
  * extension[description].valueString = "Resource was deleted"
  * extension[responseType].valueString = "OperationOutcome"



RuleSet: SystemLevelQueryOperationStatusCodes
* rest.operation[=].extension[responseInfo][+]
  * extension[statusCode].valueString = "200"
  * extension[description].valueString = "Successful operation"
* rest.operation[=].extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Unknown search parameter"
  * extension[responseType].valueString = "OperationOutcome"
* rest.operation[=].extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Invalid query parameter(s)"
  * extension[responseType].valueString = "OperationOutcome"
* rest.operation[=].extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Invalid request"
  * extension[responseType].valueString = "OperationOutcome"