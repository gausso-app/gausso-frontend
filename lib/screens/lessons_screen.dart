import 'package:flutter/material.dart';
import 'dart:math';
import '../theme/app_colors.dart';
import '../widgets/lesson_node.dart';
import '../widgets/gausso_top_bar.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: const GaussoTopBar(),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        itemCount: 15,
        reverse: true, // Start from the bottom (like Duolingo)
        itemBuilder: (context, index) {
          final isCompleted = index < 3;
          final isLocked = index > 3;

          // Sinus wave for zigzag pattern
          final double offset = sin(index * 0.8) * 60;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                  left: offset > 0 ? offset * 2 : 0,
                  right: offset < 0 ? -offset * 2 : 0,
                ),
                child: LessonNode(
                  isCompleted: isCompleted,
                  isLocked: isLocked,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Ders ${index + 1} seçildi!')),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
