import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../screens/quiz_screen.dart';

class LessonNode extends StatelessWidget {
  final bool isCompleted;
  final bool isLocked;

  const LessonNode({
    super.key,
    this.isCompleted = false,
    this.isLocked = false,
  });

  Color _getDarkerColor(Color color) {
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - 0.15).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  @override
  Widget build(BuildContext context) {
    final Color mainColor = isLocked 
        ? AppColors.greyBorder 
        : (isCompleted ? AppColors.primaryGreen : AppColors.primaryBlue);
    final Color shadowColor = _getDarkerColor(mainColor);
    final Color iconColor = isLocked ? Colors.grey[400]! : Colors.white;
    final IconData icon = isLocked ? Icons.lock : Icons.star_rounded;

    return GestureDetector(
      onTap: isLocked ? null : () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const QuizScreen()),
        );
      },
      child: SizedBox(
        width: 80,
        height: 88, // 80 + 8 for shadow
        child: Stack(
          children: [
            // Shadow layer
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: shadowColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Top layer
            Positioned(
              left: 0,
              right: 0,
              bottom: 8,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: mainColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
