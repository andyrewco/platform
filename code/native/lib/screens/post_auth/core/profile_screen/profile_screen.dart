import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:heroicons/heroicons.dart';
import 'package:local/screens/post_auth/core/profile_screen/settings/edit_profile_screen.dart';
import 'package:local/screens/post_auth/core/profile_screen/settings/setting_item.dart';
import 'package:local/screens/post_auth/core/profile_screen/settings/settings_group.dart';
import 'package:local/screens/post_auth/person/person_screen.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class ProfileScreen extends HookWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TW3Colors.gray.shade600,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              _buildAppBar(context),
              SizedBox.fromSize(
                size: const Size.fromHeight(8),
              ),
              _buildProfileSettings(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildAppBar(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const PersonScreen(
          personID: 1,
        ),
      ));
    },
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.blue.shade400,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Andrew",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "View Profile",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ],
        )
      ],
    ),
  );
}

Widget _buildProfileSettings(BuildContext context) {
  return Column(
    children: [
      SettingsGroup(
        name: "Account Settings",
        settings: [
          SettingsItem(
            icon: HeroIcons.check,
            name: "Verify Account",
            action: () {},
            hasArrow: false,
          ),
          SettingsItem(
            icon: HeroIcons.user,
            name: "Edit Profile",
            action: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EditProfileScreen(),
                ),
              );
            },
            hasArrow: true,
          ),
          SettingsItem(
            icon: HeroIcons.arrowLeftOnRectangle,
            name: "Logout",
            action: () {},
            hasArrow: false,
          ),
        ],
      ),
      SizedBox.fromSize(
        size: const Size.fromHeight(8),
      ),
      SettingsGroup(
        name: "Application Settings",
        settings: [
          SettingsItem(
            icon: HeroIcons.swatch,
            name: "Theme",
            action: () {},
          ),
          SettingsItem(
            icon: HeroIcons.documentText,
            name: "Terms Of Service",
            action: () {},
          ),
          SettingsItem(
            icon: HeroIcons.eye,
            name: "Privacy Policy",
            action: () {},
          ),
        ],
      ),
    ],
  );
}
