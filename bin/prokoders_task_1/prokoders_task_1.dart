import 'dart:io';

import '../constants.dart';
import '../shared/components.dart';

double calculateAverage(List<double> marks) {
  double avg = 0;
  for (double mark in marks) {
    avg += mark;
  }
  return avg / marks.length;
}

void checkStudentMark(List<double> marks) {
  int cnt = 1;
  for (double mark in marks) {
    stdout.write('The evaluation of student number ${cnt++} is: ');
    if (mark > 89) {
      printGreen('Excellent');
    } else if (mark > 79) {
      printBlue('Very Good');
    } else if (mark > 69) {
      printCyan('Good');
    } else if (mark > 59) {
      printYellow('Passed');
    } else {
      printRed('Failure');
    }
    stdout.write('\n');
  }
}

void displayStudentsMarks(List<double> marks) {
  int cnt = 1;
  for (double mark in marks) {
    stdout.write('The mark of student number ${cnt++} is: $mark\n');
  }
}

void executeTask1() {
  stdout.write('Please enter the number of students:\n');
  int studentsCount = inputInteger();
  //List<double> studentsMarks = [95.2, 75.3, 60.1, 41.7, 81.6];
  List<double> studentsMarks = [];
  for (int i = 0; i < studentsCount; i++) {
    stdout.write('please input the mark of the student number ${i + 1}: ');
    double studentMark = inputDouble();
    if (studentMark > 100 || studentMark < 0) {
      throw Exception(
          'the mark of student number ${i + 1} must be between 0 and 100');
    }
    studentsMarks.add(studentMark);
  }
  stdout.write(
      'The average of the given marks is: ${calculateAverage(studentsMarks)}\n');
  stdout.write('The evaluation of every student:\n');
  checkStudentMark(studentsMarks);

  displayStudentsMarks(studentsMarks);
}
