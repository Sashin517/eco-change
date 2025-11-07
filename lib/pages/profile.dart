import 'package:flutter/material.dart';
import '../colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        toolbarHeight: 64,
        backgroundColor: AppColors.primary,
        automaticallyImplyLeading: true, // back button
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.text,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Profile Header
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: AppColors.primary,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      // Avatar
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.secondary,
                        child: const Icon(
                          Icons.person,
                          size: 48,
                          color: AppColors.text,
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Name + Points
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Sashin Deemantha",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.text,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Eco Points: 1400",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.text,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Info Section
              ListTile(
                leading: const Icon(Icons.email, color: AppColors.olive),
                title: const Text("Email"),
                subtitle: const Text("sashin@gmail.com"),
                trailing: IconButton(
                  icon: const Icon(Icons.edit, color: AppColors.text),
                  onPressed: () {},
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.phone, color: AppColors.olive),
                title: const Text("Phone"),
                subtitle: const Text("+94 77 123 4567"),
                trailing: IconButton(
                  icon: const Icon(Icons.edit, color: AppColors.text),
                  onPressed: () {},
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.home, color: AppColors.olive),
                title: const Text("Address"),
                subtitle: const Text("62/A, Gamameda road, Mathammana, Minuwangoda"),
                trailing: IconButton(
                  icon: const Icon(Icons.edit, color: AppColors.text),
                  onPressed: () {},
                ),
              ),

              const SizedBox(height: 20),

              // Settings
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: AppColors.secondary,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.settings, color: AppColors.text),
                      title: const Text("Settings"),
                      onTap: () {},
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.security, color: AppColors.text),
                      title: const Text("Privacy Policy"),
                      onTap: () {},
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.info_outline, color: AppColors.text),
                      title: const Text("About"),
                      onTap: () {},
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.logout, color: AppColors.error),
                      title: const Text(
                        "Logout",
                        style: TextStyle(color: AppColors.error),
                      ),
                      onTap: () {
                        // 👉 Handle logout here
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
