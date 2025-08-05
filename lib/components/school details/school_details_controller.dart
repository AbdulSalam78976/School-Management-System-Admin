// controllers/activity_detail_controller.dart
import 'package:get/get.dart';
import 'package:school_management_system_admin/components/school%20details/school_details_model.dart';

class SchoolDetailsController extends GetxController {
  var SchoolDetails = <SchoolDetailsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDetails(); // Load initial data
  }

  void loadDetails() {
    SchoolDetails.value = [
      SchoolDetailsModel(
        image: 'assets/images/students.png',
        value: '500',
        title: 'Students',
      ),
      SchoolDetailsModel(
        image: 'assets/images/teacher.png',
        value: '35',
        title: 'Teachers',
      ),
      SchoolDetailsModel(
        image: 'assets/images/gender.png',
        value: '50:50',
        title: 'Gender Ratio',
      ),
      SchoolDetailsModel(
        image: 'assets/images/attendance.png',
        value: '92%',
        title: "Today's Attendance",
      ),
    ];
  }
}
