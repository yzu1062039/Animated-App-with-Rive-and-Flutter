import 'package:flutter/material.dart';

class Course {
  final String title, description, iconScr;
  final Color bgColor;

  Course({
    required this.title,
    this.description = "Build and animate ana IOS app from scratch",
    this.iconScr = "assets/icons/ios.svg",
    this.bgColor = const Color(0xFF7553F6),
  });
}

List<Course> courses = [
  Course(title: "Animation in SwiftUI"),
  Course(
    title: "Animation in Flutter",
    iconScr: "assets/icons/code.svg",
    bgColor: const Color(0xFF80A4FF),
  ),
];

List<Course> recentCourses = [
  Course(title: "State Machine"),
  Course(
    title: "Animation Menu",
    iconScr: "assets/icons/code.svg",
    bgColor: const Color(0xFF9CC5FF),
  ),
  Course(
    title: "Animation Menu",
    iconScr: "assets/icons/code.svg",
    bgColor: const Color(0xFF80A4FF),
  ),
  Course(
    title: "Animation Menu",
    iconScr: "assets/icons/code.svg",
    bgColor: const Color(0xFF80A4FF),
  ),
];
