import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tama_app/component/text_box.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Data pengguna disimpan dalam memori
  late Map<String, String> userData;

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    // Inisialisasi data pengguna
    userData = {
      'username':
          user?.email ?? 'Unknown User', // Default username adalah email
      'bio': 'This is a default bio',
    };
  }

  // Fungsi untuk mengedit field tertentu
  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Edit $field",
          style: const TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          // Tombol Cancel
          TextButton(
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          // Tombol Save
          TextButton(
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
              if (newValue.trim().isNotEmpty) {
                setState(() {
                  userData[field] = newValue;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Ambil pengguna yang sedang login
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Scaffold(
        body: const Center(
          child: Text("No user logged in. Please log in first."),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          "Profile Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[800],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 50),
          // Ikon profil
          const Icon(Icons.person, size: 72),
          const SizedBox(height: 10),
          // Tampilkan email pengguna
          Text(
            "Logged in as: ${user.email}",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 50),
          // Detail pengguna
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "My Details",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          // Username
          MyTextBox(
            text: userData['username']!,
            sectionName: 'username',
            onPressed: () => editField("username"),
          ),
          // Bio
          MyTextBox(
            text: userData['bio']!,
            sectionName: 'bio',
            onPressed: () => editField("bio"),
          ),
        ],
      ),
    );
  }
}
