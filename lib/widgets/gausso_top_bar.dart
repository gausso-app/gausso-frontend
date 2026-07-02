import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'stat_badge.dart';

class GaussoTopBar extends StatelessWidget implements PreferredSizeWidget {
  const GaussoTopBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        height: preferredSize.height,
        color: AppColors.backgroundWhite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.flag_rounded, color: AppColors.greyBorder, size: 32),
            const StatBadge(
              icon: Icons.local_fire_department_rounded,
              value: "2",
              color: AppColors.primaryOrange,
            ),
            const StatBadge(
              icon: Icons.diamond_rounded,
              value: "500",
              color: AppColors.primaryBlue,
            ),
            const StatBadge(
              icon: Icons.favorite_rounded,
              value: "5",
              color: AppColors.primaryRed,
            ),
          ],
        ),
      ),
    );
  }
}
