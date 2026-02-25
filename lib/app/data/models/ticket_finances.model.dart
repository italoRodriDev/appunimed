

class TicketFinancesModel {
  final int? id;
  final String status;
  final String dueDate;
  final String paymentDate;
  final String value;

  TicketFinancesModel({
    this.id,
    required this.status,
    required this.dueDate,
    required this.paymentDate,
    required this.value,
  });

  factory TicketFinancesModel.fromJson(Map<String, dynamic> json) {
    return TicketFinancesModel(
      id: json['id'],
      status: json['status'] ?? '',
      dueDate: json['dueDate'],
      paymentDate: json['paymentDate'],
      value: json['value'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'dueDate': dueDate,
      'paymentDate': paymentDate,
      'value': value,
    };
  }
}
