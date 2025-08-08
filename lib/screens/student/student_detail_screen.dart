import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system_admin/resources/theme/app_pallete.dart';
import 'package:school_management_system_admin/screens/student/student_model.dart';

class StudentDetailScreen extends StatelessWidget {
  const StudentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get student data from arguments
    final Student student = Get.arguments as Student;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${student.name}'),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Navigate to edit screen with student data
                Get.toNamed('/edit-student', arguments: student);
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Overview'),
              Tab(text: 'Academic History'),
              Tab(text: 'Attendance'),
              Tab(text: 'Extracurricular'),
            ],
            labelColor: AppPalette.primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppPalette.primaryColor,
          ),
        ),
        body: TabBarView(
          children: [
            // Overview Tab
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  Center(
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage(
                            'assets/images/student.png',
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          student.name,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Student ID: ${student.id}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          'Class: ${student.grade}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Personal Details Section
                  _buildSectionTitle(context, 'Personal Details'),
                  const SizedBox(height: 8),
                  _buildDetailCard([
                    _buildDetailRow('Full Name', student.name),
                    _buildDetailRow(
                      'Date of Birth',
                      student.dob ?? 'January 15, 2004',
                    ),
                    _buildDetailRow('Gender', student.gender),
                    _buildDetailRow(
                      'Address',
                      student.address ?? '123 Elm Street, Anytown, USA',
                    ),
                  ]),
                  const SizedBox(height: 8),

                  // Contact Information Section
                  _buildSectionTitle(context, 'Contact Information'),
                  const SizedBox(height: 8),
                  _buildDetailCard([
                    _buildDetailRow('Phone', student.phone ?? '(555) 123-4567'),
                    _buildDetailRow('Email', student.email),
                  ]),
                  const SizedBox(height: 8),

                  // Academic Information Section
                  _buildSectionTitle(context, 'Academic Information'),
                  const SizedBox(height: 8),
                  _buildDetailCard([
                    _buildDetailRow('Class', student.grade),
                    _buildDetailRow('GPA', student.gpa ?? '3.8'),
                  ]),
                  const SizedBox(height: 8),

                  // Other Information Section
                  _buildSectionTitle(context, 'Other Information'),
                  const SizedBox(height: 8),
                  _buildDetailCard([
                    _buildDetailRow(
                      'Extracurricular Activities',
                      student.extracurricular ?? 'Debate Club, Soccer Team',
                    ),
                  ]),
                ],
              ),
            ),

            // Placeholder tabs
            const Center(child: Text('Academic History Content')),
            const Center(child: Text('Attendance Content')),
            const Center(child: Text('Extracurricular Content')),
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
}
