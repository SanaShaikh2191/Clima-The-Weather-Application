import 'dart:io';

void main() {
  performTask();
}

void performTask() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  await Future.delayed(Duration(seconds: 3));
  return 'task 2 data';
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete $task2Data');
}
