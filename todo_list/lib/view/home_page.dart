import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/task_controller.dart';
import 'task_list_page.dart';

class HomePage extends StatelessWidget {
  final TaskController controller = Get.put(TaskController());
  final TextEditingController textController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Task'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Enter task',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              onSubmitted: (value) {
                String taskText = value.trim();
                if (taskText.isNotEmpty) {
                  controller.addTask(taskText);
                  textController.clear();
                  Get.snackbar(
                    "Success",
                    "Task added successfully!",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.purple,
                    colorText: Colors.white,
                    margin: const EdgeInsets.all(12),
                    duration: const Duration(seconds: 2),
                  );
                }
              },
            ),
            const SizedBox(height: 16),

            OutlinedButton.icon(
              onPressed: () {
                String taskText = textController.text.trim();
                if (taskText.isNotEmpty) {
                  controller.addTask(taskText);
                  textController.clear();
                  Get.snackbar(
                    "Success",
                    "Task added successfully!",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.purple,
                    colorText: Colors.white,
                    margin: const EdgeInsets.all(12),
                    duration: const Duration(seconds: 2),
                  );
                }
              },
              icon: const Icon(Icons.add, color: Colors.purple),
              label: const Text(
                'Add Task',
                style: TextStyle(color: Colors.purple),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.purple),
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 12),


            OutlinedButton.icon(
              onPressed: () => Get.to(() => TaskListPage()),
              icon: const Icon(Icons.list, color: Colors.purple),
              label: const Text(
                'View Task List',
                style: TextStyle(color: Colors.purple),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.purple),
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
