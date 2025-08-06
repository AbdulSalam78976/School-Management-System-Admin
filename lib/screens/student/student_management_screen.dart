import 'package:flutter/material.dart';
import 'package:school_management_system_admin/resources/theme/app_pallete.dart';
import 'package:school_management_system_admin/screens/student/student_model.dart';

class StudentManagementScreen extends StatefulWidget {
  const StudentManagementScreen({super.key});

  @override
  State<StudentManagementScreen> createState() =>
      _StudentManagementScreenState();
}

class _StudentManagementScreenState extends State<StudentManagementScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Student> students = [
    Student(
      id: '2023001',
      name: 'Sophia Chen',
      grade: 'Grade 10',
      email: 'sophia.chen@email.com',
      gender: 'Female',
    ),
    Student(
      id: '2023002',
      name: 'Ethan Morales',
      grade: 'Grade 11',
      email: 'ethan.morales@gmail.com',
      gender: 'Male',
    ),
    Student(
      id: '2023003',
      name: 'Olivia Johnson',
      grade: 'Grade 9',
      email: 'olivia.johnson@gmail.com',
      gender: 'Female',
    ),
    Student(
      id: '2023004',
      name: 'Liam Patel',
      grade: 'Grade 12',
      email: 'liam.patel@gmail.com',
      gender: 'Male',
    ),
    Student(
      id: '2023005',
      name: 'Ava Kim',
      grade: 'Grade 10',
      email: 'ava.kim@gmail.com',
      gender: 'Female',
    ),
    Student(
      id: '2023006',
      name: 'Noah González',
      grade: 'Grade 11',
      email: 'noah.gonzalez@gmail.com',
      gender: 'Male',
    ),
    Student(
      id: '2023007',
      name: 'Isabella Smith',
      grade: 'Grade 9',
      email: 'isabella.smith@gmail.com',
      gender: 'Female',
    ),
    Student(
      id: '2023008',
      name: 'Jackson Williams',
      grade: 'Grade 12',
      email: 'jackson.williams@gmail.com',
      gender: 'Male',
    ),
    Student(
      id: '2023009',
      name: 'Mia Rodriguez',
      grade: 'Grade 10',
      email: 'mia.rodriguez@email.com',
      gender: 'Female',
    ),
    Student(
      id: '2023010',
      name: 'Lucas Brown',
      grade: 'Grade 11',
      email: 'lucas.brown@gmail.com',
      gender: 'Male',
    ),
    Student(
      id: '2023011',
      name: 'Emma Nguyen',
      grade: 'Grade 9',
      email: 'emma.nguyen@email.com',
      gender: 'Female',
    ),
    Student(
      id: '2023012',
      name: 'Aiden Garcia',
      grade: 'Grade 10',
      email: 'aiden.garcia@gmail.com',
      gender: 'Male',
    ),
    Student(
      id: '2023013',
      name: 'Charlotte Wilson',
      grade: 'Grade 11',
      email: 'charlotte.wilson@gmail.com',
      gender: 'Female',
    ),
    Student(
      id: '2023014',
      name: 'James Martinez',
      grade: 'Grade 12',
      email: 'james.martinez@gmail.com',
      gender: 'Male',
    ),
    Student(
      id: '2023015',
      name: 'Amelia Anderson',
      grade: 'Grade 9',
      email: 'amelia.anderson@gmail.com',
      gender: 'Female',
    ),
    Student(
      id: '2023016',
      name: 'Benjamin Taylor',
      grade: 'Grade 10',
      email: 'benjamin.taylor@gmail.com',
      gender: 'Male',
    ),
    Student(
      id: '2023017',
      name: 'Harper Thomas',
      grade: 'Grade 11',
      email: 'harper.thomas@gmail.com',
      gender: 'Female',
    ),
    Student(
      id: '2023018',
      name: 'Mason Hernandez',
      grade: 'Grade 12',
      email: 'mason.hernandez@gmail.com',
      gender: 'Male',
    ),
    Student(
      id: '2023019',
      name: 'Evelyn Lee',
      grade: 'Grade 9',
      email: 'evelyn.lee@email.com',
      gender: 'Female',
    ),
    Student(
      id: '2023020',
      name: 'Elijah Walker',
      grade: 'Grade 10',
      email: 'elijah.walker@gmail.com',
      gender: 'Male',
    ),
    Student(
      id: '2023021',
      name: 'Abigail Perez',
      grade: 'Grade 11',
      email: 'abigail.perez@gmail.com',
      gender: 'Female',
    ),
    Student(
      id: '2023022',
      name: 'Logan Hall',
      grade: 'Grade 12',
      email: 'logan.hall@gmail.com',
      gender: 'Male',
    ),
    Student(
      id: '2023023',
      name: 'Emily Young',
      grade: 'Grade 9',
      email: 'emily.young@gmail.com',
      gender: 'Female',
    ),
    Student(
      id: '2023024',
      name: 'Alexander Allen',
      grade: 'Grade 10',
      email: 'alexander.allen@gmail.com',
      gender: 'Male',
    ),
    Student(
      id: '2023025',
      name: 'Elizabeth King',
      grade: 'Grade 11',
      email: 'elizabeth.king@gmail.com',
      gender: 'Female',
    ),
    Student(
      id: '2023026',
      name: 'Daniel Wright',
      grade: 'Grade 12',
      email: 'daniel.wright@gmail.com',
      gender: 'Male',
    ),
    Student(
      id: '2023027',
      name: 'Sofia Lopez',
      grade: 'Grade 9',
      email: 'sofia.lopez@email.com',
      gender: 'Female',
    ),
    Student(
      id: '2023028',
      name: 'Matthew Scott',
      grade: 'Grade 10',
      email: 'matthew.scott@gmail.com',
      gender: 'Male',
    ),
    Student(
      id: '2023029',
      name: 'Avery Green',
      grade: 'Grade 11',
      email: 'avery.green@gmail.com',
      gender: 'Female',
    ),
    Student(
      id: '2023030',
      name: 'David Adams',
      grade: 'Grade 12',
      email: 'david.adams@gmail.com',
      gender: 'Male',
    ),
  ];

  List<Student> filteredStudents = [];
  String? selectedGender;
  String? selectedGrade;
  bool filtersActive = false;

  @override
  void initState() {
    super.initState();
    filteredStudents = students;
    _searchController.addListener(_filterStudents);
  }

  void _filterStudents() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredStudents = students.where((student) {
        final matchesSearch =
            student.name.toLowerCase().contains(query) ||
            student.id.toLowerCase().contains(query) ||
            student.grade.toLowerCase().contains(query) ||
            student.email.toLowerCase().contains(query);

        final matchesGender =
            selectedGender == null ||
            student.gender.toLowerCase() == selectedGender!.toLowerCase();

        final matchesGrade =
            selectedGrade == null ||
            student.grade.toLowerCase() == selectedGrade!.toLowerCase();

        return matchesSearch && matchesGender && matchesGrade;
      }).toList();

      filtersActive = selectedGender != null || selectedGrade != null;
    });
  }

  void _applyFilters(String? gender, String? grade) {
    setState(() {
      selectedGender = gender;
      selectedGrade = grade;
      _filterStudents();
    });
  }

  void _clearFilters() {
    setState(() {
      selectedGender = null;
      selectedGrade = null;
      filtersActive = false;
      _filterStudents();
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
        title: const Text('Student Management'),
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
                        hintText: 'Search by name, ID, class...',
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

            // Student count
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                children: [
                  Text(
                    '${filteredStudents.length} Students',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // Student list
            Expanded(
              child: filteredStudents.isEmpty
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
                                width: 120,
                                child: Text(
                                  'Student ID',
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
                                width: 100,
                                child: Text(
                                  'Gender',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: 100,
                                child: Text(
                                  'Class',
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
                          rows: filteredStudents.map((student) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  SizedBox(
                                    width: 120,
                                    child: Text(
                                      student.id,
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
                                      student.name,
                                      style: TextStyle(
                                        color: AppPalette.textPrimaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  SizedBox(
                                    width: 100,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: student.gender == 'Male'
                                            ? Colors.blue.withOpacity(0.2)
                                            : Colors.pink.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        student.gender,
                                        style: TextStyle(
                                          color: AppPalette.textPrimaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  SizedBox(
                                    width: 100,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: _getGradeColor(student.grade),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        student.grade,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      student.email,
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
                                              _viewStudent(student),
                                          splashRadius: 30,
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                        ),
                                        const SizedBox(width: 8),
                                        IconButton(
                                          icon: Icon(Icons.edit, size: 20),
                                          onPressed: () =>
                                              _editStudent(student),
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
                                              _deleteStudent(student),
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
          // Add new student
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
          Icon(Icons.school, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No students found',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(
            filtersActive
                ? 'Try adjusting your filters'
                : 'Add new students to get started',
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
              title: const Text('Filter Students'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Gender Filter
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Gender',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      FilterChip(
                        label: const Text('All'),
                        selected: selectedGender == null,
                        onSelected: (selected) {
                          setState(() {
                            selectedGender = selected ? null : selectedGender;
                          });
                        },
                      ),
                      FilterChip(
                        label: const Text('Male'),
                        selected: selectedGender == 'Male',
                        onSelected: (selected) {
                          setState(() {
                            selectedGender = selected ? 'Male' : null;
                          });
                        },
                      ),
                      FilterChip(
                        label: const Text('Female'),
                        selected: selectedGender == 'Female',
                        onSelected: (selected) {
                          setState(() {
                            selectedGender = selected ? 'Female' : null;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Class Filter
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Class',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      FilterChip(
                        label: const Text('All'),
                        selected: selectedGrade == null,
                        onSelected: (selected) {
                          setState(() {
                            selectedGrade = selected ? null : selectedGrade;
                          });
                        },
                      ),
                      ...['Grade 9', 'Grade 10', 'Grade 11', 'Grade 12'].map((
                        grade,
                      ) {
                        return FilterChip(
                          label: Text(grade),
                          selected: selectedGrade == grade,
                          onSelected: (selected) {
                            setState(() {
                              selectedGrade = selected ? grade : null;
                            });
                          },
                        );
                      }).toList(),
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
                    _applyFilters(selectedGender, selectedGrade);
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

  Color _getGradeColor(String grade) {
    switch (grade) {
      case 'Grade 9':
        return Colors.blue;
      case 'Grade 10':
        return Colors.green;
      case 'Grade 11':
        return Colors.orange;
      case 'Grade 12':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  void _viewStudent(Student student) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Student: ${student.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${student.id}'),
            Text('Gender: ${student.gender}'),
            Text('Class: ${student.grade}'),
            Text('Email: ${student.email}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _editStudent(Student student) {
    // Implement edit student
  }

  void _deleteStudent(Student student) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Student'),
        content: Text('Are you sure you want to delete ${student.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                students.remove(student);
                filteredStudents.remove(student);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Deleted ${student.name}')),
              );
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
