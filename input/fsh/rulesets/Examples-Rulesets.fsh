RuleSet: RenderedDosageText(dosagetext)
* extension[renderedDosageInstruction].valueMarkdown = {dosagetext}
* extension[generatedDosageInstructionsMeta]
  * url = $generatedMeta
  * extension[+].url = "algorithmVersion"
  * extension[=].valueString = "1.0.1"
  * extension[+].url = "language"
  * extension[=].valueCode = #de-DE