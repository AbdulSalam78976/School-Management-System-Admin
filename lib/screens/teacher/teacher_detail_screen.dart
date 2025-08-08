import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system_admin/resources/theme/app_pallete.dart';
import 'package:school_management_system_admin/screens/teacher/teacher_model.dart';

class TeacherDetailScreen extends StatelessWidget {
  const TeacherDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get teacher data from arguments
    final Teacher teacher = Get.arguments as Teacher;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigate to edit screen
              Get.toNamed('/edit-teacher', arguments: teacher);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/images/teacher_placeholder.png',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    teacher.name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'ID: ${teacher.id}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Divider(),

            // Basic Information
            _buildSectionTitle(context, 'Basic Information'),
            _buildDetailCard([
              _buildDetailRow('Date of Birth', '1988-05-15'),
              _buildDetailRow('Gender', 'Female'),
              _buildDetailRow('Address', '123 Oak Street, Anytown, USA'),
            ]),
            const SizedBox(height: 16),

            // Contact Information
            _buildSectionTitle(context, 'Contact Information'),
            _buildContactTable(
              phone: '(555) 123-4567',
              email: 'emily.carter@school.edu',
            ),
            const SizedBox(height: 16),

            // Subject Specialization
            _buildSectionTitle(context, 'Subject Specialization'),
            _buildSubjectCard('Mathematics'),
            const SizedBox(height: 16),

            // Classes Taught
            _buildSectionTitle(context, 'Classes Taught'),
            _buildClassesTable([
              {'class': 'Algebra I', 'grade': '9th', 'section': 'A'},
              {'class': 'Geometry', 'grade': '10th', 'section': 'B'},
              {'class': 'Pre-Calculus', 'grade': '11th', 'section': 'A'},
            ]),
            const SizedBox(height: 16),

            // Qualifications
            _buildSectionTitle(context, 'Qualifications'),
            _buildDetailCard([
              _buildDetailRow(
                'Education',
                'Master of Science in Mathematics Education, University of Anytown',
              ),
            ]),
            const SizedBox(height: 16),

            // Professional Development
            _buildSectionTitle(context, 'Professional Development'),
            _buildDetailCard([
              _buildDetailRow(
                'Workshops',
                'Advanced Teaching Techniques Workshop (2022)',
              ),
              _buildDetailRow(
                'Seminars',
                'Curriculum Development Seminar (2023)',
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: AppPalette.textPrimaryColor,
        ),
      ),
    );
  }

  Widget _buildDetailCard(List<Widget> children) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: children),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
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

  Widget _buildContactTable({required String phone, required String email}) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Table(
          columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(3)},
          children: [
            TableRow(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Phone',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(phone),
                ),
              ],
            ),
            TableRow(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(email),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectCard(String subject) {
    return Card(
      elevation: 2,
      color: _getSubjectColor(subject).withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            subject,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: _getSubjectColor(subject),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildClassesTable(List<Map<String, String>> classes) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Table(
          border: TableBorder.all(color: Colors.grey.shade300),
          columnWidths: const {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(1),
          },
          children: [
            const TableRow(
              decoration: BoxDecoration(color: AppPalette.hoverColor),
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Class',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Grade',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Section',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            ...classes
                .map(
                  (cls) => TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(cls['class']!),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(cls['grade']!),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(cls['section']!),
                      ),
                    ],
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  Color _getSubjectColor(String subject) {
    // Assign colors based on subject
    final colors = {
      'Mathematics': Colors.blue,
      'Science': Colors.green,
      'English': Colors.orange,
      'History': Colors.purple,
      'Art': Colors.pink,
      'Physical Education': Colors.red,
      'Music': Colors.teal,
      'Computer Science': Colors.indigo,
      'Foreign Languages': Colors.amber,
      'Social Studies': Colors.brown,
    };
    return colors[subject] ?? Colors.grey;
  }
}
