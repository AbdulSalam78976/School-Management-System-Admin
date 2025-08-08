class StudentFeeRecord {
  final String id;
  final String name;
  final int feeAmount;
  final DateTime dueDate;
  final DateTime? paidDate;

  StudentFeeRecord({
    required this.id,
    required this.name,
    required this.feeAmount,
    required this.dueDate,
    this.paidDate,
  });

  bool get isPaid => paidDate != null;
}
