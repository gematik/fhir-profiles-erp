Instance: PrescriptionBinary
InstanceOf: Binary
Title: "Binary einer Verschreibung (QES)"
Description: "Beispiel für binäre Daten einer elektronischen Verschreibung im PKCS#7-Format"
Usage: #inline
* contentType = #application/pkcs7-mime
* data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="

Instance: PrescriptionBinaryWithMeta
InstanceOf: GEM_ERP_PR_Binary
Title: "Binary einer Verschreibung (QES) mit Metadaten"
Description: "Beispiel für binäre Daten einer elektronischen Verschreibung mit erweiterten Metadaten"
Usage: #inline
* contentType = #application/pkcs7-mime
* data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="