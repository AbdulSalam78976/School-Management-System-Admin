import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system_admin/screens/classes/class_model.dart';

class ClassDetailScreen extends StatelessWidget {
  const ClassDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SchoolClass schoolClass = Get.arguments as SchoolClass;

    return Scaffold(
      appBar: AppBar(
        title: Text('${schoolClass.className} - ${schoolClass.section}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Class Information
            _buildInfoCard(
              title: 'Class Information',
              children: [
                _buildInfoRow('Class Teacher', schoolClass.classTeacher),
                _buildInfoRow('Classroom', schoolClass.classroom),
                _buildInfoRow('Schedule', schoolClass.schedule),
                _buildInfoRow('Academic Year', schoolClass.academicYear),
              ],
            ),
            const SizedBox(height: 24),

            // Subjects Table
            Text(
              'Subjects',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildSubjectsTable(schoolClass.subjectTeachers),
            const SizedBox(height: 24),

            // Students Table
            Text(
              'Students (${schoolClass.studentCount})',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildStudentsTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({String? title, required List<Widget> children}) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildSubjectsTable(Map<String, String> subjectTeachers) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(3)},
          border: TableBorder.all(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
          ),
          children: [
            // Header Row
            TableRow(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
              children: const [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Subject',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Teacher',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            // Data Rows
            ...subjectTeachers.entries.map((entry) {
              return TableRow(
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey.shade300)),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(entry.key),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(entry.value),
                  ),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentsTable() {
    // Note: You'll need to add students list to your SchoolClass model
    // For now using placeholder data
    final students = [
      {'name': 'Lucas Bennett', 'id': 'STU12345', 'grade': 'A'},
      {'name': 'Sophia Carter', 'id': 'STU67890', 'grade': 'B+'},
      {'name': 'Oliver Hayes', 'id': 'STU11223', 'grade': 'A-'},
      {'name': 'Isabella Foster', 'id': 'STU44556', 'grade': 'B'},
      {'name': 'Henry Reed', 'id': 'STU77889', 'grade': 'A'},
    ];

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          columnWidths: const {
            0: FlexColumnWidth(3),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(1),
          },
          border: TableBorder.all(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
          ),
          children: [
            // Header Row
            TableRow(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
              children: const [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Student Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Student ID',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Grade',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            // Data Rows
            ...students.map((student) {
              return TableRow(
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey.shade300)),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(student['name']!),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(student['id']!),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(student['grade']!),
                  ),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
