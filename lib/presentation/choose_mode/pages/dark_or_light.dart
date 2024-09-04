import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoti/common/widgets/button/basic_app_button.dart';
import 'package:spoti/core/configs/assets/app_vectors.dart';
import 'package:spoti/core/configs/theme/app_colors.dart';
import 'package:spoti/presentation/choose_mode/bloc/theme_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile_picture.png'),
            ),
            const SizedBox(height: 20),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'john.doe@example.com',
              style: TextStyle(fontSize: 16, color: AppColors.grey),
            ),
            const SizedBox(height: 30),
            _buildProfileOption(
              icon: Icons.person,
              title: 'Edit Profile',
              onTap: () {
                // TODO: Implement edit profile functionality
              },
            ),
            _buildProfileOption(
              icon: Icons.lock,
              title: 'Change Password',
              onTap: () {
                // TODO: Implement change password functionality
              },
            ),
            _buildProfileOption(
              icon: Icons.notifications,
              title: 'Notifications',
              onTap: () {
                // TODO: Implement notifications settings
              },
            ),
            _buildThemeSwitcher(context),
            const SizedBox(height: 30),
            BasicAppButton(
              onPressed: () {
                // TODO: Implement logout functionality
              },
              title: 'Logout',
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  Widget _buildThemeSwitcher(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return SwitchListTile(
          title: const Text('Dark Mode'),
          secondary: SvgPicture.asset(
            themeMode == ThemeMode.dark ? AppVectors.moon : AppVectors.sun,
            width: 24,
            height: 24,
          ),
          value: themeMode == ThemeMode.dark,
          onChanged: (bool value) {
            context.read<ThemeCubit>().updateTheme(
                  value ? ThemeMode.dark : ThemeMode.light,
                );
          },
        );
      },
    );
  }
}
