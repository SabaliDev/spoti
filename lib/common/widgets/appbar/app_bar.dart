import 'package:flutter/material.dart';
import 'package:spoti/common/helpers/is_dark_mode.dart';
import 'package:spoti/core/configs/theme/app_colors.dart';
import 'package:spoti/presentation/choose_mode/pages/dark_or_light.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final bool hideBack;
  final String userInitials;
  final VoidCallback? onProfileTap;

  const BasicAppbar({
    Key? key,
    this.title,
    this.hideBack = false,
    this.action,
    this.userInitials = '',
    this.onProfileTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: title ?? const Text(""),
      actions: [
        if (action != null) action!,
        if (userInitials.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                if (onProfileTap != null) {
                  onProfileTap!();
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                }
              },
              child: CircleAvatar(
                backgroundColor:
                    context.isDarkMode ? AppColors.grey : Colors.black,
                child: Text(
                  userInitials,
                  style: TextStyle(
                    color: context.isDarkMode ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? Colors.white.withOpacity(0.03)
                      : Colors.black.withOpacity(0.04),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 15,
                  color: context.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
