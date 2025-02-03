import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Add Provider for state management
import 'package:todoapp/screens/llogiin.dart';

import '../theme/darkandlight.dart'; // Replace with the correct import path

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the current theme mode
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Profile Section
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: const NetworkImage(
                      'https://via.placeholder.com/150'), // Replace with user image URL
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Malak Idrissi", // Replace with user name
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Rabat, Morocco", // Replace with user location
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.grey),
                  onPressed: () {
                    // Add edit profile functionality here
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Hi! My name is Malak, I'm a community manager from Rabat, Morocco.", // Replace with user bio
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 32),
            // Settings Options
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.grey[600]),
              title: const Text("Notifications"),
              onTap: () {
                // Add navigation to Notifications page
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.grey[600]),
              title: const Text("General"),
              onTap: () {
                // Add navigation to General settings page
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.account_circle, color: Colors.grey[600]),
              title: const Text("Account"),
              onTap: () {
                // Add navigation to Account page
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.dark_mode, color: Colors.grey[600]),
              title: const Text("Dark Mode"),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  // Use Provider to toggle the theme
                  Provider.of<ThemeNotifier>(context, listen: false)
                      .toggleTheme();
                },
              ),
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.grey[600]),
              title: const Text("LogOut"),
              onTap: () async {
                // Logout logic
                await FirebaseAuth.instance.signOut();
                // Navigate back to login page
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.info, color: Colors.grey[600]),
              title: const Text("About"),
              onTap: () {
                // Add navigation to About page
              },
            ),
          ],
        ),
      ),
    );
  }
}
