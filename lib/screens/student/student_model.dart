class Student {
  final String id;
  final String name;
  final String grade;
  final String email;
  final String gender;
  final String? dob;
  final String? address;
  final String? phone;
  final String? gpa;
  final String? extracurricular;

  const Student({
    required this.id,
    required this.name,
    required this.grade,
    required this.email,
    required this.gender,
    this.dob,
    this.address,
    this.phone,
    this.gpa,
    this.extracurricular,
  });
}
