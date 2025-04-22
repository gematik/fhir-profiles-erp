Profile: GEM_ERP_PR_PAR_T_Prescription_cc
Id: gem-erp-pr-par-t-prescription-cc
Parent: Parameters
Description: "Parameters to send t-prescription Data to BfArM"
* insert Profile(GEM_ERP_PR_PAR_T_Prescription)

* parameter MS

* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains prescriptionSignatureDate 1..1 MS 
and rxPrescription 1..1 
and rxDispensation 1..1 

* parameter[prescriptionSignatureDate]
  * name MS
  * name = "prescriptionSignatureDate"
  * value[x] 1..1 MS
  * value[x] only instant
  * resource 0..0
  * part 0..0

* parameter[rxPrescription]
  * name MS
  * name = "rxPrescription" (exactly)
  * value[x] 0..0
  * resource 0..0
  * part MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "name"
    * ^slicing.rules = #open
  * part contains
    prescriptionId 1..1 and
    authoredOn 1..1 and
    medicationRequest 1..1 and
    medication 1..1

  * part[prescriptionId]
    * name MS
    * name = "prescriptionId"
    * value[x] 1..1
    * value[x] only GEM_ERP_PR_PrescriptionId
    * resource 0..0
    * part 0..0 
  * part[authoredOn]
    * name MS
    * name = "authoredOn"
    * value[x] 1..1
    * value[x] only date
    * resource 0..0
    * part 0..0 
  * part[medicationRequest]
    * name MS
    * name = "medicationRequest"
    * value[x] 0..0
    * resource 1..1
    * resource only MedicationRequest //TODO: BfArM MedicationRequest
    * part 0..0 
  * part[medication]
    * name MS
    * name = "medication"
    * value[x] 0..0
    * resource 1..1
    * resource only Medication //TODO: BfArM Medication
    * part 0..0 

* parameter[rxDispensation]
  * name MS
  * name = "rxDispensation" (exactly)
  * value[x] 0..0
  * resource 0..0
  * part MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "name"
    * ^slicing.rules = #open
  * part contains
    medicationDispense 1.. and
    medication 1.. and
    organization 1..1
  * part[medicationDispense]
    * name MS
    * name = "medicationDispense"
    * value[x] 0..0
    * resource 1..1
    * resource only MedicationDispense //TODO: BfArM MedicationDispense
    * part 0..0 
  * part[medication]
    * name MS
    * name = "medication"
    * value[x] 0..0
    * resource 1..1
    * resource only Medication //TODO: BfArM Medication
    * part 0..0 
  * part[organization]
    * name MS
    * name = "organization"
    * value[x] 0..0
    * resource 1..1
    * resource only Organization //TODO: BfArM Organization
    * part 0..0








