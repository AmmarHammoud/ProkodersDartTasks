import 'dart:io';
import '../constants.dart';
import '../shared/components.dart';
import 'task_model.dart';

List<Task> tasks = [];

///A function to append several task (possible 1) to the end of the [tasks] list
///It promotes the user to input the required number of tasks
///then promotes him to input the text of each of them
void addTasks() {
  printYellow('Please enter the number of tasks you want to add: ');
  int numberOfTasks = inputInteger();
  for (int i = 1; i <= numberOfTasks; i++) {
    printYellow('Please enter the task ');
    printCyan('#$i');
    printYellow(': ');
    String task = readInput();
    tasks.add(Task(text: task));
  }
}

///A function to display the tasks in a simple manner
///Another function [formattedDisplay] performs the same but it provides more understandable output
void display() {
  int cnt = 1;
  for (var task in tasks) {
    stdout.write('Task ${cnt++}: ${task.text} ');
    task.completed
        ? printGreen('\u2713 completed')
        : printRed('\u2717 not completed');
    stdout.write('\n');
  }
}

///A helper function to receive the input from the user
int _enterId() {
  int taskId = inputInteger();
  if (--taskId < 0 || taskId > tasks.length) {
    throw Exception('Out of range');
  }
  return taskId;
}

///A function to mark a given task as completed
///It promotes the user to input the id of the required task
///It checks that the given id is in the range of the [tasks] list
///If so, mark it as completed, otherwise it throws an Exception
void markAsCompleted() {
  printYellow(
      'Please enter the id of the task you want to mark as completed: ');
  int taskId = _enterId();
  tasks.elementAt(taskId).markAsCompleted();
  formattedDisplay();
}

///A function to delete a task from [tasks] list
///it promotes the user to input the id of the required task
///then it deletes it from the list
deleteTask() {
  printYellow('Please enter the id of the task you want to delete: ');
  int taskId = _enterId();
  tasks.removeAt(taskId);
  formattedDisplay();
}

///A function to display the tasks in an understandable, beautiful, and well-structured manner
///It firstly looks up for the longest task in [tasks] list to organize the prefix and suffex '|' character
///Then it output the first row which contains the 'TASK #', 'Text', and 'Status'
///Afterwards, it formats every row as follows:
///It outputs the task number, task's text, and its status
///If the status is 'completed' then it outputs it in red color suffexed with x icon
///otherwise it outputs it in green color suffexed with tick icon
formattedDisplay({bool justCompleted = false}) {
  if (tasks.isEmpty) {
    printYellow('There is no tasks at the moment');
    return;
  }

  //get the longest task id;
  int longestTask = 0;
  for (int i = 0; i < tasks.length; i++) {
    if (tasks[i].text.length > tasks.elementAt(longestTask).text.length) {
      longestTask = i;
    }
  }

  int lengthOfLongestTask = tasks[longestTask].text.length;

  //print the horizontal dashes
  void printDashes() {
    for (int i = 0; i < lengthOfLongestTask; i++) {
      stdout.write('_');
    }
    stdout.write('______________________________\n');
  }

  printCyan('Task #    | ');
  int spaces = lengthOfLongestTask - 4;
  spaces = (spaces / 2).ceil();
  int spaces2 = spaces;

  while (spaces-- > 0) {
    stdout.write(' ');
  }
  printCyan('Text');
  while (spaces2-- > 0) {
    stdout.write(' ');
  }

  printCyan(' |     Status\n');

  printDashes();

  //print the tasks
  for (int i = 0; i < tasks.length; i++) {
    if (justCompleted && tasks[i].completed == false) continue;

    //print 'Task' with number
    printCyan('Task #${i + 1}:  | ');

    //print the task with spaces
    stdout.write(tasks[i].text);
    for (int j = 0; j < lengthOfLongestTask - tasks[i].text.length; j++) {
      stdout.write(' ');
    }

    printCyan(' | ');

    //print the task's status
    tasks[i].completed
        ? printGreen('\u2713 completed')
        : printRed('\u2717 not completed');

    stdout.write('\n');

    printDashes();
  }
}

///A function to display completed tasks
displayCompletedTasks() {
  formattedDisplay(justCompleted: true);
}

void executeTask2() {
  printCyan('Please consider these options, then select the desired one: \n');
  printCyan('0: end\n');
  printCyan('1: add a task\n');
  printCyan('2: mark a task as completed\n');
  printCyan('3: delete a task\n');
  printCyan('4: display the completed tasks\n');
  printCyan('5: display all tasks\n');
  printCyan('input your option: ');
  int option = inputInteger();
  switch (option) {
    case 0:
      return;
    case 1:
      addTasks();
      break;
    case 2:
      markAsCompleted();
      break;
    case 3:
      deleteTask();
      break;
    case 4:
      displayCompletedTasks();
      break;
    case 5:
      formattedDisplay();
      break;
    default:
      printYellow('invalid option\n');
  }
  if(option != 0) executeTask2();
}
