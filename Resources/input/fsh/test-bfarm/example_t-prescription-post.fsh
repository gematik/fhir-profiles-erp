Instance: Example-T-Prescription-CC-Post
InstanceOf: GEM_ERP_PR_PAR_T_Prescription_cc
Usage: #example

* parameter[prescriptionSignatureDate].valueInstant = "2026-04-01T12:43:23Z"

* parameter[rxPrescription]
  * name = "rxPrescription"
  * part[prescriptionId]
    * name = "prescriptionId"
    * valueIdentifier
      * system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
      * value = "160.153.303.257.459"
  * part[authoredOn]
    * name = "authoredOn"
    * valueDate = "2026-04-01"
  * part[medicationRequest]
    * name = "medicationRequest"
    * resource = ExampleMedicationRequest-T
  * part[medication]
    * name = "medication"
    * resource = ExampleMedication1-Paracetamol-T

* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = ExampleMedicationDispense-T
  * part[medication]
    * name = "medication"
    * resource = ExampleMedication2-Ibuprofen-T
  * part[organization]
    * name = "organization"
    * resource = ExampleOrganization-T