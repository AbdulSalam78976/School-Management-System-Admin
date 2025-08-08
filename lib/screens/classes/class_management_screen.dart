import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system_admin/resources/routes/route_names.dart';
import 'package:school_management_system_admin/resources/theme/app_pallete.dart';
import 'package:school_management_system_admin/screens/classes/add_class.dart';
import 'package:school_management_system_admin/screens/classes/class_model.dart';

class ClassManagementScreen extends StatefulWidget {
  const ClassManagementScreen({super.key});

  @override
  State<ClassManagementScreen> createState() => _ClassManagementScreenState();
}

class _ClassManagementScreenState extends State<ClassManagementScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<SchoolClass> classes = [
    SchoolClass(
      className: 'Class 1',
      section: 'A',
      classTeacher: 'Ms. Sarah Johnson',
      subjectTeachers: {
        'Mathematics': 'Mr. Robert Smith',
        'English': 'Ms. Emily Chen',
        'Science': 'Dr. David Lee',
      },
      studentCount: 30,
      classroom: 'Room 101',
      schedule: 'Mon-Fri, 8:00 AM - 2:00 PM',
      academicYear: '2023-2024',
    ),
    SchoolClass(
      className: 'Class 2',
      section: 'B',
      classTeacher: 'Mr. Michael Brown',
      subjectTeachers: {
        'Mathematics': 'Ms. Lisa Wang',
        'English': 'Mr. James Wilson',
        'Science': 'Dr. Patricia Kim',
      },
      studentCount: 28,
      classroom: 'Room 102',
      schedule: 'Mon-Fri, 8:30 AM - 2:30 PM',
      academicYear: '2023-2024',
    ),
    SchoolClass(
      className: 'Class 3',
      section: 'A',
      classTeacher: 'Ms. Jessica Davis',
      subjectTeachers: {
        'Mathematics': 'Mr. Andrew Taylor',
        'English': 'Ms. Olivia Martin',
        'Science': 'Dr. Brian Clark',
      },
      studentCount: 32,
      classroom: 'Room 103',
      schedule: 'Mon-Fri, 9:00 AM - 3:00 PM',
      academicYear: '2023-2024',
    ),
    SchoolClass(
      className: 'Class 4',
      section: 'C',
      classTeacher: 'Mr. Daniel Wilson',
      subjectTeachers: {
        'Mathematics': 'Ms. Sophia Rodriguez',
        'English': 'Mr. Ethan Anderson',
        'Science': 'Dr. Jennifer White',
      },
      studentCount: 25,
      classroom: 'Room 104',
      schedule: 'Mon-Fri, 8:00 AM - 2:00 PM',
      academicYear: '2023-2024',
    ),
    SchoolClass(
      className: 'Class 5',
      section: 'A',
      classTeacher: 'Ms. Emma Thompson',
      subjectTeachers: {
        'Mathematics': 'Mr. Christopher Lee',
        'English': 'Ms. Ava Harris',
        'Science': 'Dr. Kevin Martinez',
      },
      studentCount: 29,
      classroom: 'Room 105',
      schedule: 'Mon-Fri, 8:30 AM - 2:30 PM',
      academicYear: '2023-2024',
    ),
  ];

  List<SchoolClass> filteredClasses = [];
  String? selectedSection;
  bool filtersActive = false;

  @override
  void initState() {
    super.initState();
    filteredClasses = classes;
    _searchController.addListener(_filterClasses);
  }

  void _filterClasses() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredClasses = classes.where((cls) {
        final matchesSearch =
            cls.className.toLowerCase().contains(query) ||
            cls.classTeacher.toLowerCase().contains(query) ||
            cls.classroom.toLowerCase().contains(query);

        final matchesSection =
            selectedSection == null ||
            cls.section.toLowerCase() == selectedSection!.toLowerCase();

        return matchesSearch && matchesSection;
      }).toList();
    });
  }

  void _applySectionFilter(String? section) {
    setState(() {
      selectedSection = section;
      _filterClasses();
    });
  }

  void _clearFilters() {
    setState(() {
      selectedSection = null;
      filtersActive = false;
      _filterClasses();
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
      backgroundColor: AppPalette.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Class Management',
          style: TextStyle(color: AppPalette.textPrimaryColor),
        ),
        backgroundColor: AppPalette.surfaceColor,
        iconTheme: const IconThemeData(color: AppPalette.textPrimaryColor),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.filter_alt,
              color: AppPalette.textPrimaryColor,
            ),
            onPressed: _showFilterDialog,
            tooltip: 'Filter Classes',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPalette.defaultPadding),
        child: Column(
          children: [
            // Search and filter bar
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: AppPalette.borderColor),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPalette.defaultPadding,
                  vertical: AppPalette.smallPadding,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        style: TextStyle(color: AppPalette.textPrimaryColor),
                        decoration: InputDecoration(
                          hintText: 'Search classes...',
                          hintStyle: TextStyle(
                            color: AppPalette.textSecondaryColor,
                          ),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppPalette.textSecondaryColor,
                          ),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    if (filtersActive)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: InkWell(
                          onTap: _clearFilters,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
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
            ),
            const SizedBox(height: AppPalette.defaultPadding),

            // Class list
            Expanded(
              child: filteredClasses.isEmpty
                  ? _buildEmptyState()
                  : Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: AppPalette.borderColor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                          AppPalette.defaultPadding,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: MediaQuery.of(context).size.width,
                            ),
                            child: DataTable(
                              dividerThickness: 0.5,
                              headingRowColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                    (states) => AppPalette.containerColor,
                                  ),
                              columnSpacing: 24,
                              horizontalMargin: 12,
                              columns: [
                                _buildDataColumn('Class'),
                                _buildDataColumn('Section'),
                                _buildDataColumn('Teacher'),
                                _buildDataColumn('Students', numeric: true),
                                _buildDataColumn('Room'),
                                _buildDataColumn('Actions'),
                              ],
                              rows: filteredClasses.map((cls) {
                                return DataRow(
                                  cells: [
                                    _buildDataCell(
                                      Text(
                                        cls.className,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    _buildDataCell(
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: _getSectionColor(cls.section),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Text(
                                          cls.section,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    _buildDataCell(Text(cls.classTeacher)),
                                    _buildDataCell(
                                      Text(cls.studentCount.toString()),
                                    ),
                                    _buildDataCell(Text(cls.classroom)),
                                    _buildDataCell(
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                              Icons.visibility,
                                              size: 20,
                                            ),
                                            color:
                                                AppPalette.textSecondaryColor,
                                            onPressed: () =>
                                                _viewClassDetails(cls),
                                            splashRadius: 20,
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.edit,
                                              size: 20,
                                            ),
                                            color:
                                                AppPalette.textSecondaryColor,
                                            onPressed: () => _editClass(cls),
                                            splashRadius: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddClassDialog,
        backgroundColor: AppPalette.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  DataColumn _buildDataColumn(String label, {bool numeric = false}) {
    return DataColumn(
      label: Text(
        label,
        style: TextStyle(
          color: AppPalette.textPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      numeric: numeric,
    );
  }

  DataCell _buildDataCell(Widget child) {
    return DataCell(
      DefaultTextStyle.merge(
        style: TextStyle(color: AppPalette.textPrimaryColor),
        child: child,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.class_outlined,
            size: 64,
            color: AppPalette.textDisabledColor,
          ),
          const SizedBox(height: AppPalette.defaultPadding),
          Text(
            'No classes found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppPalette.textPrimaryColor,
            ),
          ),
          const SizedBox(height: AppPalette.smallPadding),
          Text(
            filtersActive
                ? 'Try adjusting your filters'
                : 'Add new classes to get started',
            style: TextStyle(color: AppPalette.textSecondaryColor),
          ),
          if (filtersActive) ...[
            const SizedBox(height: AppPalette.defaultPadding),
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
            return Dialog(
              backgroundColor: AppPalette.surfaceColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppPalette.defaultPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Filter Classes',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppPalette.textPrimaryColor,
                      ),
                    ),
                    const SizedBox(height: AppPalette.defaultPadding),
                    // Section Filter
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Section',
                        style: TextStyle(
                          color: AppPalette.textPrimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppPalette.smallPadding),
                    Wrap(
                      spacing: 8,
                      children: [
                        FilterChip(
                          label: Text(
                            'All',
                            style: TextStyle(
                              color: selectedSection == null
                                  ? Colors.white
                                  : AppPalette.textPrimaryColor,
                            ),
                          ),
                          selected: selectedSection == null,
                          selectedColor: AppPalette.primaryColor,
                          backgroundColor: AppPalette.containerColor,
                          onSelected: (selected) {
                            setState(() {
                              selectedSection = selected
                                  ? null
                                  : selectedSection;
                            });
                          },
                        ),
                        ...['A', 'B', 'C', 'D'].map((section) {
                          return FilterChip(
                            label: Text(
                              section,
                              style: TextStyle(
                                color: selectedSection == section
                                    ? Colors.white
                                    : AppPalette.textPrimaryColor,
                              ),
                            ),
                            selected: selectedSection == section,
                            selectedColor: AppPalette.primaryColor,
                            backgroundColor: AppPalette.containerColor,
                            onSelected: (selected) {
                              setState(() {
                                selectedSection = selected ? section : null;
                              });
                            },
                          );
                        }).toList(),
                      ],
                    ),
                    const SizedBox(height: AppPalette.defaultPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: AppPalette.textSecondaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppPalette.smallPadding),
                        ElevatedButton(
                          onPressed: () {
                            _applySectionFilter(selectedSection);
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppPalette.primaryColor,
                          ),
                          child: const Text('Apply Filters'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Color _getSectionColor(String section) {
    switch (section) {
      case 'A':
        return Colors.blue;
      case 'B':
        return Colors.green;
      case 'C':
        return Colors.orange;
      case 'D':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  void _viewClassDetails(SchoolClass cls) {
    // Navigate to class details screen
    Get.toNamed(RouteName.classDetailScreen, arguments: cls);
  }

  void _editClass(SchoolClass cls) {
    // Navigate to edit class screen
    // Get.toNamed(RouteName.editClassScreen, arguments: cls);
  }
}
