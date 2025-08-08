import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system_admin/resources/theme/app_pallete.dart';
import 'package:school_management_system_admin/screens/fees%20management/fees_model.dart';

class FeeManagementScreen extends StatefulWidget {
  const FeeManagementScreen({super.key});

  @override
  State<FeeManagementScreen> createState() => _FeeManagementScreenState();
}

class _FeeManagementScreenState extends State<FeeManagementScreen> {
  String? _selectedClass;
  String? _selectedMonth;
  int? _selectedYear;
  bool _isLoading = false;
  List<StudentFeeRecord> _students = [];
  final DateFormat _dateFormat = DateFormat('dd MMM yyyy');
  final TextEditingController _searchController = TextEditingController();

  final List<String> _classes = [
    'Class 1A',
    'Class 2B',
    'Class 3C',
    'Class 4A',
    'Class 5B',
  ];
  final List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  final List<int> _years = List.generate(
    5,
    (index) => DateTime.now().year - index,
  );

  @override
  void initState() {
    super.initState();
    _selectedYear = DateTime.now().year;
    _searchController.addListener(_filterStudents);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterStudents() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Fee Management',
          style: TextStyle(color: AppPalette.textPrimaryColor),
        ),
        backgroundColor: AppPalette.surfaceColor,
        iconTheme: const IconThemeData(color: AppPalette.textPrimaryColor),
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: AppPalette.textPrimaryColor),
            onPressed: _viewPaymentHistory,
            tooltip: 'Payment History',
          ),
          IconButton(
            icon: const Icon(
              Icons.download,
              color: AppPalette.textPrimaryColor,
            ),
            onPressed: _exportData,
            tooltip: 'Export Data',
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Section
          _buildFilterCard(),
          const SizedBox(height: AppPalette.defaultPadding),

          // Summary Cards
          if (_students.isNotEmpty) _buildSummaryCards(),
          if (_students.isNotEmpty)
            const SizedBox(height: AppPalette.defaultPadding),

          // Student List
          Expanded(
            child: _students.isEmpty
                ? _buildEmptyState()
                : _buildStudentFeeTable(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterCard() {
    return Container(
      margin: const EdgeInsets.all(AppPalette.defaultPadding),
      padding: const EdgeInsets.all(AppPalette.defaultPadding),
      decoration: BoxDecoration(
        color: AppPalette.surfaceColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppPalette.borderColor),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildDropdown(
                  value: _selectedClass,
                  hint: 'Select Class',
                  items: _classes,
                  onChanged: (value) => setState(() {
                    _selectedClass = value;
                    _students = [];
                  }),
                ),
              ),
              const SizedBox(width: AppPalette.defaultPadding),
              Expanded(
                child: _buildDropdown(
                  value: _selectedMonth,
                  hint: 'Select Month',
                  items: _months,
                  onChanged: (value) => setState(() {
                    _selectedMonth = value;
                    _students = [];
                  }),
                ),
              ),
              const SizedBox(width: AppPalette.defaultPadding),
              Expanded(
                child: _buildDropdown(
                  value: _selectedYear,
                  hint: 'Select Year',
                  items: _years,
                  onChanged: (value) => setState(() {
                    _selectedYear = value;
                    _students = [];
                  }),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppPalette.defaultPadding),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed:
                  (_selectedClass != null &&
                      _selectedMonth != null &&
                      _selectedYear != null)
                  ? _loadStudentFeeRecords
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppPalette.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'View Records',
                      style: TextStyle(color: Colors.white),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown<T>({
    required T? value,
    required String hint,
    required List<T> items,
    required Function(T?) onChanged,
  }) {
    return DropdownButtonFormField<T>(
      value: value,
      dropdownColor: AppPalette.surfaceColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        labelText: hint,
        labelStyle: TextStyle(color: AppPalette.textSecondaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppPalette.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppPalette.borderColor),
        ),
        filled: true,
        fillColor: AppPalette.containerColor,
      ),
      style: TextStyle(color: AppPalette.textPrimaryColor),
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(
            item.toString(),
            style: TextStyle(color: AppPalette.textPrimaryColor),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildSummaryCards() {
    final paidCount = _students.where((s) => s.isPaid).length;
    final unpaidCount = _students.length - paidCount;
    final totalAmount = _students.fold(0, (sum, s) => sum + s.feeAmount);
    final collectedAmount = _students
        .where((s) => s.isPaid)
        .fold(0, (sum, s) => sum + s.feeAmount);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPalette.defaultPadding,
      ),
      child: Row(
        children: [
          _buildSummaryCard(
            title: 'Total Students',
            value: _students.length.toString(),
            icon: Icons.people,
            color: AppPalette.primaryColor,
          ),
          const SizedBox(width: AppPalette.defaultPadding),
          _buildSummaryCard(
            title: 'Paid Fees',
            value:
                '$paidCount (${(paidCount / _students.length * 100).toStringAsFixed(1)}%)',
            icon: Icons.check_circle,
            color: AppPalette.successColor,
          ),
          const SizedBox(width: AppPalette.defaultPadding),
          _buildSummaryCard(
            title: 'Pending Fees',
            value: unpaidCount.toString(),
            icon: Icons.pending_actions,
            color: AppPalette.warningColor,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppPalette.surfaceColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppPalette.borderColor),
        ),
        padding: const EdgeInsets.all(AppPalette.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 20, color: color),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: AppPalette.textSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.receipt_long,
            size: 64,
            color: AppPalette.textDisabledColor,
          ),
          const SizedBox(height: AppPalette.defaultPadding),
          Text(
            'No Fee Records Found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppPalette.textPrimaryColor,
            ),
          ),
          const SizedBox(height: AppPalette.smallPadding),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPalette.largePadding,
            ),
            child: Text(
              _selectedClass == null || _selectedMonth == null
                  ? 'Please select a class and month to view fee records'
                  : 'No records available for $_selectedClass in $_selectedMonth',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppPalette.textSecondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentFeeTable() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPalette.defaultPadding,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppPalette.surfaceColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppPalette.borderColor),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPalette.defaultPadding),
              child: Row(
                children: [
                  Text(
                    'Fee Records for $_selectedClass - $_selectedMonth $_selectedYear',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppPalette.textPrimaryColor,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: _searchController,
                      style: TextStyle(color: AppPalette.textPrimaryColor),
                      decoration: InputDecoration(
                        hintText: 'Search students...',
                        hintStyle: TextStyle(
                          color: AppPalette.textSecondaryColor,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20,
                          color: AppPalette.textSecondaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppPalette.containerColor,
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: AppPalette.borderColor),
            Expanded(
              child: SingleChildScrollView(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: AppPalette.borderColor,
                    cardColor: AppPalette.surfaceColor,
                  ),
                  child: DataTable(
                    headingRowColor: MaterialStateProperty.resolveWith<Color>(
                      (states) => AppPalette.containerColor,
                    ),
                    columns: [
                      DataColumn(
                        label: Text(
                          'Student ID',
                          style: TextStyle(color: AppPalette.textPrimaryColor),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Name',
                          style: TextStyle(color: AppPalette.textPrimaryColor),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Amount',
                          style: TextStyle(color: AppPalette.textPrimaryColor),
                        ),
                        numeric: true,
                      ),
                      DataColumn(
                        label: Text(
                          'Due Date',
                          style: TextStyle(color: AppPalette.textPrimaryColor),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Status',
                          style: TextStyle(color: AppPalette.textPrimaryColor),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Paid Date',
                          style: TextStyle(color: AppPalette.textPrimaryColor),
                        ),
                      ),
                    ],
                    rows: _students.map((student) {
                      final isPaid = student.isPaid;
                      final isOverdue =
                          !isPaid && student.dueDate.isBefore(DateTime.now());
                      final statusText = isPaid
                          ? 'Paid'
                          : isOverdue
                          ? 'Overdue'
                          : 'Pending';
                      final statusColor = isPaid
                          ? AppPalette.successColor
                          : isOverdue
                          ? AppPalette.errorColor
                          : AppPalette.warningColor;

                      return DataRow(
                        cells: [
                          DataCell(
                            Text(
                              student.id,
                              style: TextStyle(
                                color: AppPalette.textPrimaryColor,
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              student.name,
                              style: TextStyle(
                                color: AppPalette.textPrimaryColor,
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              '\$${student.feeAmount}',
                              style: TextStyle(
                                color: AppPalette.textPrimaryColor,
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              _dateFormat.format(student.dueDate),
                              style: TextStyle(
                                color: AppPalette.textPrimaryColor,
                              ),
                            ),
                          ),
                          DataCell(
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: statusColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: statusColor.withOpacity(0.3),
                                ),
                              ),
                              child: Text(
                                statusText,
                                style: TextStyle(
                                  color: statusColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              isPaid
                                  ? _dateFormat.format(student.paidDate!)
                                  : '-',
                              style: TextStyle(
                                color: isPaid
                                    ? AppPalette.textPrimaryColor
                                    : AppPalette.textSecondaryColor,
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
    );
  }

  Future<void> _loadStudentFeeRecords() async {
    setState(() => _isLoading = true);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    final now = DateTime.now();
    final currentMonth = _months[now.month - 1];
    final isCurrentMonth = _selectedMonth == currentMonth;

    setState(() {
      _students = [
        StudentFeeRecord(
          id: 'STU001',
          name: 'Lucas Bennett',
          feeAmount: 1500,
          dueDate: isCurrentMonth ? now : DateTime(now.year, now.month - 1, 15),
          paidDate: isCurrentMonth
              ? null
              : DateTime(now.year, now.month - 1, 5),
        ),
        StudentFeeRecord(
          id: 'STU002',
          name: 'Sophia Carter',
          feeAmount: 1500,
          dueDate: isCurrentMonth ? now : DateTime(now.year, now.month - 1, 15),
          paidDate: isCurrentMonth
              ? now.subtract(const Duration(days: 3))
              : DateTime(now.year, now.month - 1, 10),
        ),
        StudentFeeRecord(
          id: 'STU003',
          name: 'Oliver Hayes',
          feeAmount: 1500,
          dueDate: isCurrentMonth ? now : DateTime(now.year, now.month - 1, 15),
          paidDate: null, // Not paid
        ),
        StudentFeeRecord(
          id: 'STU004',
          name: 'Isabella Foster',
          feeAmount: 1500,
          dueDate: isCurrentMonth ? now : DateTime(now.year, now.month - 1, 15),
          paidDate: isCurrentMonth
              ? null
              : DateTime(now.year, now.month - 1, 1),
        ),
        StudentFeeRecord(
          id: 'STU005',
          name: 'Henry Reed',
          feeAmount: 1500,
          dueDate: isCurrentMonth ? now : DateTime(now.year, now.month - 1, 15),
          paidDate: isCurrentMonth
              ? now.subtract(const Duration(days: 1))
              : null,
        ),
      ];
      _isLoading = false;
    });
  }

  void _viewPaymentHistory() {
    if (_selectedClass == null ||
        _selectedMonth == null ||
        _selectedYear == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please select class, month and year first'),
          backgroundColor: AppPalette.errorColor,
        ),
      );
      return;
    }

    // Implement navigation to payment history
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppPalette.surfaceColor,
        title: Text(
          'Payment History - $_selectedClass',
          style: TextStyle(color: AppPalette.textPrimaryColor),
        ),
        content: Text(
          'Complete payment history for $_selectedMonth $_selectedYear',
          style: TextStyle(color: AppPalette.textSecondaryColor),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Close',
              style: TextStyle(color: AppPalette.primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  void _exportData() {
    if (_students.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('No data to export'),
          backgroundColor: AppPalette.errorColor,
        ),
      );
      return;
    }

    // Implement export functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Exporting fee records...'),
        backgroundColor: AppPalette.successColor,
      ),
    );
  }
}
