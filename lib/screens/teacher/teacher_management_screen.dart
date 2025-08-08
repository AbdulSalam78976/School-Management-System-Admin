import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system_admin/resources/routes/route_names.dart';
import 'package:school_management_system_admin/resources/theme/app_pallete.dart';
import 'package:school_management_system_admin/screens/teacher/add_teacher.dart';
import 'package:school_management_system_admin/screens/teacher/teacher_model.dart';

class TeacherManagementScreen extends StatefulWidget {
  const TeacherManagementScreen({super.key});

  @override
  State<TeacherManagementScreen> createState() =>
      _TeacherManagementScreenState();
}

class _TeacherManagementScreenState extends State<TeacherManagementScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Teacher> teachers = [
    Teacher(
      id: 'T1001',
      name: 'Ms. Emily Carter',
      subject: 'Mathematics',
      email: 'emily.carter@email.com',
    ),
    Teacher(
      id: 'T1002',
      name: 'Mr. David Lee',
      subject: 'Science',
      email: 'david.lee@gmail.com',
    ),
    Teacher(
      id: 'T1003',
      name: 'Ms. Sarah Johnson',
      subject: 'English',
      email: 'sarah.johnson@gmail.com',
    ),
    Teacher(
      id: 'T1004',
      name: 'Mr. Michael Brown',
      subject: 'History',
      email: 'michael.brown@gmail.com',
    ),
    Teacher(
      id: 'T1005',
      name: 'Ms. Jessica Davis',
      subject: 'Art',
      email: 'jessica.davis@gmail.com',
    ),
    Teacher(
      id: 'T1006',
      name: 'Mr. Robert Wilson',
      subject: 'Physical Education',
      email: 'robert.wilson@gmail.com',
    ),
    Teacher(
      id: 'T1007',
      name: 'Ms. Olivia Taylor',
      subject: 'Music',
      email: 'olivia.taylor@gmail.com',
    ),
    Teacher(
      id: 'T1008',
      name: 'Mr. Ethan Clark',
      subject: 'Computer Science',
      email: 'ethan.clark@email.com',
    ),
    Teacher(
      id: 'T1009',
      name: 'Ms. Sophia Lewis',
      subject: 'Foreign Languages',
      email: 'sophia.lewis@gmail.com',
    ),
    Teacher(
      id: 'T1010',
      name: 'Mr. Daniel Walker',
      subject: 'Social Studies',
      email: 'daniel.walker@email.com',
    ),
  ];

  List<Teacher> filteredTeachers = [];
  String? selectedSubject;
  bool filtersActive = false;

  @override
  void initState() {
    super.initState();
    filteredTeachers = teachers;
    _searchController.addListener(_filterTeachers);
  }

  void _filterTeachers() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredTeachers = teachers.where((teacher) {
        final matchesSearch =
            teacher.name.toLowerCase().contains(query) ||
            teacher.id.toLowerCase().contains(query) ||
            teacher.subject.toLowerCase().contains(query) ||
            teacher.email.toLowerCase().contains(query);

        final matchesSubject =
            selectedSubject == null ||
            teacher.subject.toLowerCase() == selectedSubject!.toLowerCase();

        return matchesSearch && matchesSubject;
      }).toList();

      filtersActive = selectedSubject != null;
    });
  }

  void _applyFilter(String? subject) {
    setState(() {
      selectedSubject = subject;
      _filterTeachers();
    });
  }

  void _clearFilters() {
    setState(() {
      selectedSubject = null;
      filtersActive = false;
      _filterTeachers();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Management'),
        backgroundColor: AppPalette.backgroundColor,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.filter_alt_outlined,
              color: AppPalette.textPrimaryColor,
            ),
            onPressed: _showFilterDialog,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search and filter bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search by name, ID, subject...',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                  if (filtersActive)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: _clearFilters,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppPalette.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Filters Active',
                                style: TextStyle(
                                  color: AppPalette.primaryColor,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Icon(
                                Icons.close,
                                size: 16,
                                color: AppPalette.primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Teacher count
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                children: [
                  Text(
                    '${filteredTeachers.length} Teachers',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppPalette.textPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // Teacher list
            Expanded(
              child: filteredTeachers.isEmpty
                  ? _buildEmptyState()
                  : SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width,
                        ),
                        child: DataTable(
                          columnSpacing: 12,
                          horizontalMargin: 12,
                          columns: [
                            DataColumn(
                              label: SizedBox(
                                width: 100,
                                child: Text(
                                  'Teacher ID',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: 150,
                                child: Text(
                                  'Name',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: 150,
                                child: Text(
                                  'Subject',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: 200,
                                child: Text(
                                  'Contact',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: 150,
                                child: Text(
                                  'Actions',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                          rows: filteredTeachers.map((teacher) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      teacher.id,
                                      style: TextStyle(
                                        color: AppPalette.textPrimaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  SizedBox(
                                    width: 150,
                                    child: Text(
                                      teacher.name,
                                      style: TextStyle(
                                        color: AppPalette.textPrimaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  SizedBox(
                                    width: 150,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: _getSubjectColor(
                                          teacher.subject,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        teacher.subject,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      teacher.email,
                                      style: TextStyle(
                                        color: AppPalette.textPrimaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  SizedBox(
                                    width: 150,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.visibility,
                                            size: 20,
                                          ),
                                          onPressed: () =>
                                              _viewTeacher(teacher),
                                          splashRadius: 30,
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                        ),
                                        const SizedBox(width: 8),
                                        IconButton(
                                          icon: Icon(Icons.edit, size: 20),
                                          onPressed: () =>
                                              _editTeacher(teacher),
                                          splashRadius: 30,
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                        ),
                                        const SizedBox(width: 8),
                                        IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            size: 20,
                                            color: Colors.red,
                                          ),
                                          onPressed: () =>
                                              _deleteTeacher(teacher),
                                          splashRadius: 30,
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTeacherDialog();
        },
        backgroundColor: AppPalette.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No teachers found',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(
            filtersActive
                ? 'Try adjusting your filters'
                : 'Add new teachers to get started',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[500]),
          ),
          if (filtersActive) ...[
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _clearFilters,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppPalette.primaryColor,
                foregroundColor: Colors.white,
              ),
              child: const Text('Clear Filters'),
            ),
          ],
        ],
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Filter Teachers'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Subject Filter
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Subject',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      FilterChip(
                        label: const Text('All'),
                        selected: selectedSubject == null,
                        onSelected: (selected) {
                          setState(() {
                            selectedSubject = selected ? null : selectedSubject;
                          });
                        },
                      ),
                      ...teachers.map((teacher) => teacher.subject).toSet().map(
                        (subject) {
                          return FilterChip(
                            label: Text(subject),
                            selected: selectedSubject == subject,
                            onSelected: (selected) {
                              setState(() {
                                selectedSubject = selected ? subject : null;
                              });
                            },
                          );
                        },
                      ).toList(),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _applyFilter(selectedSubject);
                    Navigator.pop(context);
                  },
                  child: const Text('Apply Filters'),
                ),
              ],
            );
          },
        );
      },
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

  void _viewTeacher(Teacher teacher) {
    Get.toNamed(RouteName.teacherDetailScreen, arguments: teacher);
  }

  void _editTeacher(Teacher teacher) {
    // Implement edit teacher
  }

  void _deleteTeacher(Teacher teacher) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Teacher'),
        content: Text('Are you sure you want to delete ${teacher.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                teachers.remove(teacher);
                filteredTeachers.remove(teacher);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Deleted ${teacher.name}')),
              );
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
