class SchoolClass {
  final String className;
  final String section;
  final String classTeacher;
  final Map<String, String> subjectTeachers;
  final int studentCount;
  final String classroom;
  final String schedule;
  final String academicYear;

  const SchoolClass({
    required this.className,
    required this.section,
    required this.classTeacher,
    required this.subjectTeachers,
    required this.studentCount,
    required this.classroom,
    required this.schedule,
    required this.academicYear,
  });
}
