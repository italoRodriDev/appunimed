class ProtocolModel {
  int? id;
  String? protocolNumber;
  String? userName;
  String? beneficiaryName;
  String? status;
  String? occurrenceType;
  String? openDate;
  String? closeDate;
  String? occurrence;
  String? internalStatus;

  ProtocolModel({
    this.id,
    this.protocolNumber,
    this.userName,
    this.beneficiaryName,
    this.status,
    this.occurrenceType,
    this.openDate,
    this.closeDate,
    this.occurrence,
    this.internalStatus,
  });

  ProtocolModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    protocolNumber = json['protocolNumber'];
    userName = json['userName'];
    beneficiaryName = json['beneficiaryName'];
    status = json['status'];
    occurrenceType = json['occurrenceType'];
    openDate = json['openDate'];
    closeDate = json['closeDate'];
    occurrence = json['occurrence'];
    internalStatus = json['internalStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['protocolNumber'] = protocolNumber;
    data['userName'] = userName;
    data['beneficiaryName'] = beneficiaryName;
    data['status'] = status;
    data['occurrenceType'] = occurrenceType;
    data['openDate'] = openDate;
    data['closeDate'] = closeDate;
    data['occurrence'] = occurrence;
    data['internalStatus'] = internalStatus;
    return data;
  }
}
