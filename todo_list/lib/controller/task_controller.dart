import 'package:get/get.dart';
import '../model/task.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  void addTask(String title) {
    if (title.trim().isNotEmpty) {
      tasks.add(Task(title: title.trim()));
    }
  }

  void toggleDone(int index) {
    var task = tasks[index];
    tasks[index] = Task(title: task.title, done: !task.done);
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
  }
}
