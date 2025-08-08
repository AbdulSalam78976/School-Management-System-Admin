import 'package:flutter/material.dart';
import 'package:school_management_system_admin/resources/theme/app_pallete.dart';
import 'package:school_management_system_admin/screens/announcements/add_announcement.dart';
import 'package:school_management_system_admin/screens/announcements/announcement_model.dart';

class AnnouncementsScreen extends StatefulWidget {
  const AnnouncementsScreen({super.key});

  @override
  State<AnnouncementsScreen> createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  List<AnnouncementModel> announcements = [
    AnnouncementModel(
      title: 'School Event',
      audience: 'All Students',
      date: '2024-07-26',
      message:
          'Reminder: School event on August 10th. All students must attend the annual science fair showcasing projects from grades 6-12.',
    ),
    AnnouncementModel(
      title: 'Class Schedule Change',
      audience: 'Grade 10',
      date: '2024-07-24',
      message:
          'Changes to the Grade 10 class schedule starting next week. Math classes will now be held in Room 205 instead of 203.',
    ),
    AnnouncementModel(
      title: 'Holiday Announcement',
      audience: 'All',
      date: '2024-07-22',
      message:
          'School will be closed on August 15th for Independence Day celebrations. Classes resume on August 16th.',
    ),
  ];

  String _searchQuery = '';
  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    final filteredAnnouncements = announcements.where((announcement) {
      final matchesSearch =
          announcement.title.toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ) ||
          announcement.message.toLowerCase().contains(
            _searchQuery.toLowerCase(),
          );
      final matchesFilter =
          _selectedFilter == 'All' || announcement.audience == _selectedFilter;
      return matchesSearch && matchesFilter;
    }).toList();

    return Scaffold(
      backgroundColor: AppPalette.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Announcements',
          style: TextStyle(color: AppPalette.textPrimaryColor),
        ),
        backgroundColor: AppPalette.surfaceColor,
        iconTheme: const IconThemeData(color: AppPalette.textPrimaryColor),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: _showFilterDialog,
            tooltip: 'Filter Announcements',
          ),
        ],
      ),
      body: Column(
        children: [
          // Search and filter bar
          Padding(
            padding: const EdgeInsets.all(AppPalette.defaultPadding),
            child: Card(
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
                        style: TextStyle(color: AppPalette.textPrimaryColor),
                        decoration: InputDecoration(
                          hintText: 'Search announcements...',
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
                        onChanged: (value) =>
                            setState(() => _searchQuery = value),
                      ),
                    ),
                    if (_selectedFilter != 'All')
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Chip(
                          label: Text(
                            _selectedFilter,
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: _getAudienceColor(_selectedFilter),
                          deleteIcon: const Icon(
                            Icons.close,
                            size: 16,
                            color: Colors.white,
                          ),
                          onDeleted: () =>
                              setState(() => _selectedFilter = 'All'),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),

          // Announcements count
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPalette.defaultPadding,
            ),
            child: Row(
              children: [
                Text(
                  '${filteredAnnouncements.length} ${filteredAnnouncements.length == 1 ? 'Announcement' : 'Announcements'}',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppPalette.textSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Announcements list
          Expanded(
            child: filteredAnnouncements.isEmpty
                ? _buildEmptyState()
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPalette.defaultPadding,
                    ),
                    itemCount: filteredAnnouncements.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return _buildAnnouncementCard(
                        filteredAnnouncements[index],
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppPalette.primaryColor,
        onPressed: showAddAnnouncementDialog,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildAnnouncementCard(AnnouncementModel announcement) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppPalette.borderColor),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showAnnouncementDetails(announcement),
        child: Padding(
          padding: const EdgeInsets.all(AppPalette.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      announcement.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppPalette.textPrimaryColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getAudienceColor(announcement.audience),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      announcement.audience,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                announcement.message,
                style: TextStyle(
                  color: AppPalette.textPrimaryColor.withOpacity(0.8),
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: AppPalette.textSecondaryColor,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    announcement.date,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppPalette.textSecondaryColor,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      size: 20,
                      color: AppPalette.textSecondaryColor,
                    ),
                    onPressed: () => _showAnnouncementOptions(announcement),
                  ),
                ],
              ),
            ],
          ),
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
            Icons.announcement_outlined,
            size: 64,
            color: AppPalette.textDisabledColor,
          ),
          const SizedBox(height: AppPalette.defaultPadding),
          Text(
            'No announcements found',
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
              _searchQuery.isNotEmpty || _selectedFilter != 'All'
                  ? 'Try adjusting your search or filter criteria'
                  : 'Create your first announcement using the + button',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppPalette.textSecondaryColor),
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog() {
    final options = ['All', 'All Students', 'Grade 10', 'Parents', 'Staff'];

    showDialog(
      context: context,
      builder: (context) {
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
                  'Filter By Audience',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppPalette.textPrimaryColor,
                  ),
                ),
                const SizedBox(height: AppPalette.defaultPadding),
                ...options.map((option) {
                  return RadioListTile<String>(
                    title: Text(
                      option,
                      style: TextStyle(color: AppPalette.textPrimaryColor),
                    ),
                    value: option,
                    groupValue: _selectedFilter,
                    activeColor: AppPalette.primaryColor,
                    onChanged: (value) {
                      setState(() => _selectedFilter = value!);
                      Navigator.pop(context);
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAnnouncementDetails(AnnouncementModel announcement) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppPalette.surfaceColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(AppPalette.defaultPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    announcement.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppPalette.textPrimaryColor,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getAudienceColor(announcement.audience),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      announcement.audience,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                announcement.message,
                style: TextStyle(
                  fontSize: 16,
                  color: AppPalette.textPrimaryColor.withOpacity(0.9),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: AppPalette.textSecondaryColor,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Posted on ${announcement.date}',
                    style: TextStyle(color: AppPalette.textSecondaryColor),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppPalette.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Close',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAnnouncementOptions(AnnouncementModel announcement) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppPalette.surfaceColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.edit, color: AppPalette.textPrimaryColor),
                title: Text(
                  'Edit Announcement',
                  style: TextStyle(color: AppPalette.textPrimaryColor),
                ),
                onTap: () {
                  Navigator.pop(context);
                  // Implement edit functionality
                },
              ),
              ListTile(
                leading: Icon(Icons.delete, color: AppPalette.errorColor),
                title: Text(
                  'Delete Announcement',
                  style: TextStyle(color: AppPalette.errorColor),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _confirmDelete(announcement);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _confirmDelete(AnnouncementModel announcement) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppPalette.surfaceColor,
          title: Text(
            'Delete Announcement?',
            style: TextStyle(color: AppPalette.textPrimaryColor),
          ),
          content: Text(
            'Are you sure you want to delete "${announcement.title}"?',
            style: TextStyle(color: AppPalette.textPrimaryColor),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(color: AppPalette.textSecondaryColor),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() => announcements.remove(announcement));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Deleted "${announcement.title}"'),
                    backgroundColor: AppPalette.errorColor,
                  ),
                );
              },
              child: Text(
                'Delete',
                style: TextStyle(color: AppPalette.errorColor),
              ),
            ),
          ],
        );
      },
    );
  }

  Color _getAudienceColor(String audience) {
    switch (audience) {
      case 'All Students':
        return AppPalette.infoColor;
      case 'Parents':
        return AppPalette.successColor;
      case 'Grade 10':
        return AppPalette.accentColor;
      case 'Staff':
        return AppPalette.primaryColor;
      case 'All':
        return AppPalette.secondaryColor;
      default:
        return Colors.grey;
    }
  }
}
