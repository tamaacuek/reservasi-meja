import 'package:flutter/material.dart';
import 'package:tama_app/component/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOut;
  const MyDrawer({
    super.key,
    required this.onProfileTap,
    required this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[800],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Bagian atas drawer
          Column(
            children: [
              // Header
              DrawerHeader(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 64,
                ),
              ),

              // Home list tile
              MyListTile(
                icon: Icons.home,
                text: 'H O M E',
                onTap: () => Navigator.pop(context),
              ),

              // Profile list tile
              MyListTile(
                icon: Icons.person,
                text: 'P R O F I L E',
                onTap: onProfileTap,
              ),
            ],
          ),

          // Bagian bawah drawer
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: MyListTile(
              icon: Icons.logout,
              text: 'L O G O U T',
              onTap: onSignOut,
            ),
          ),
        ],
      ),
    );
  }
}
