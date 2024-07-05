Instance: Bundle-AcceptOperation
InstanceOf: GEM_ERP_OUT_OP_Accept_Bundle
Usage: #example
Title: "Example Accept Bundle"
Description: "This Bundle contains the Task and the qualified signed ePrescription."
* type = #collection
* link[+].relation = "self"
* link[=].url = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task/160.000.033.491.280.78/$accept/"
* entry[erxTask].resource = TaskInIn-ProgressState
* entry[erxBinary].resource = PrescriptionBinary