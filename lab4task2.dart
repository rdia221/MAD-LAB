import 'dart:io';

void main() {
  print("Enter your age:");

  String? input = stdin.readLineSync(); // Nullable String

  if (input == null || input.trim().isEmpty) {
    print("You entered nothing. Please enter a valid age.");
    return;
  }

  try {
    int age = int.parse(input);

    if (age < 0) {
      print("Age cannot be negative.");
      return;
    }

    int yearsLeft = 100 - age;

    if (yearsLeft > 0) {
      print("You have $yearsLeft years left until you turn 100.");
    } else if (yearsLeft == 0) {
      print("Wow! You are 100 years old!");
    } else {
      print("You are already over 100 years old!");
    }
  } catch (e) {
    print("Invalid input! Please enter a valid number.");
  }
}
