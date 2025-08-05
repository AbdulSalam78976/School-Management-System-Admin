import 'package:get/get.dart';

class PerformanceController extends GetxController {
  var chartType = 'Subject'.obs;

  @override
  void onInit() {
    super.onInit();
    setChartType('Subject');
  }

  final subjectNames = ['Math', 'Science', 'English', 'History', 'Arts'];
  final subjectAverages = [85.0, 78.0, 90.0, 65.0, 70.0];

  final classNames = ['Class 6', 'Class 7', 'Class 8', 'Class 9', 'Class 10'];
  final classAverages = [75.0, 82.0, 68.0, 85.0, 80.0];

  List<String> get labels =>
      chartType.value == 'Subject' ? subjectNames : classNames;

  List<double> get data =>
      chartType.value == 'Subject' ? subjectAverages : classAverages;

  setChartType(String type) {
    chartType.value = type;
  }
}
