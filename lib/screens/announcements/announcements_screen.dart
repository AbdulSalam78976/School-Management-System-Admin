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
      message: 'Reminder: School event on August 10th.',
    ),
    AnnouncementModel(
      title: 'Important Update',
      audience: 'Parents',
      date: '2024-07-25',
      message: 'Important update regarding school policies.',
    ),
    AnnouncementModel(
      title: 'Class Schedule Change',
      audience: 'Grade 10',
      date: '2024-07-24',
      message: 'Changes to the Grade 10 class schedule.',
    ),
    AnnouncementModel(
      title: 'Staff Meeting',
      audience: 'Staff',
      date: '2024-07-23',
      message: 'Staff meeting scheduled for July 30th.',
    ),
    AnnouncementModel(
      title: 'Holiday Announcement',
      audience: 'All',
      date: '2024-07-22',
      message: 'School holiday on August 15th.',
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
      appBar: AppBar(
        backgroundColor: AppPalette.backgroundColor,
        title: const Text('Announcements'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.filter_alt,
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
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                    ),
                  ),
                  if (_selectedFilter != 'All')
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Chip(
                        label: Text(_selectedFilter),
                        backgroundColor: _getAudienceColor(_selectedFilter),
                        deleteIcon: const Icon(Icons.close, size: 16),
                        onDeleted: () {
                          setState(() {
                            _selectedFilter = 'All';
                          });
                        },
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Announcements count
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                children: [
                  Text(
                    '${filteredAnnouncements.length} Announcements',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppPalette.textPrimaryColor,
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
                      itemCount: filteredAnnouncements.length,
                      separatorBuilder: (context, index) =>
                          const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final announcement = filteredAnnouncements[index];
                        return _buildAnnouncementCard(announcement);
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppPalette.primaryColor,
        onPressed: () {
          showAddAnnouncementDialog();
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildAnnouncementCard(AnnouncementModel announcement) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          // Show announcement details
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      announcement.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getAudienceColor(announcement.audience),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      announcement.audience,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                announcement.message,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 14, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    announcement.date,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      size: 20,
                      color: Colors.grey[600],
                    ),
                    onPressed: () {
                      _showAnnouncementOptions(announcement);
                    },
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
          Icon(Icons.announcement, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No announcements found',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your search or filter',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filter Announcements'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: const Text('All'),
                value: 'All',
                groupValue: _selectedFilter,
                onChanged: (value) {
                  setState(() {
                    _selectedFilter = value!;
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text('All Students'),
                value: 'All Students',
                groupValue: _selectedFilter,
                onChanged: (value) {
                  setState(() {
                    _selectedFilter = value!;
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text('Parents'),
                value: 'Parents',
                groupValue: _selectedFilter,
                onChanged: (value) {
                  setState(() {
                    _selectedFilter = value!;
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text('Staff'),
                value: 'Staff',
                groupValue: _selectedFilter,
                onChanged: (value) {
                  setState(() {
                    _selectedFilter = value!;
                  });
                  Navigator.pop(context);
                },
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
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Announcement'),
              onTap: () {
                Navigator.pop(context);
                // Implement edit functionality
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text(
                'Delete Announcement',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pop(context);
                _confirmDelete(announcement);
              },
            ),
          ],
        );
      },
    );
  }

  void _confirmDelete(AnnouncementModel announcement) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Announcement?'),
          content: Text(
            'Are you sure you want to delete "${announcement.title}"?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  announcements.remove(announcement);
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Deleted "${announcement.title}"'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  Color _getAudienceColor(String audience) {
    switch (audience) {
      case 'All Students':
        return Colors.blue;
      case 'Parents':
        return Colors.green;
      case 'Grade 10':
        return Colors.orange;
      case 'Staff':
        return Colors.purple;
      case 'All':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
