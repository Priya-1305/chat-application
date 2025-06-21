import 'package:flutter/material.dart';
import 'package:priya/Auth/auth_services.dart';
import 'package:priya/pages/setting_page.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final _auth = AuthServices();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [colorScheme.secondary, colorScheme.surface],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // Centered person icon
            Align(
              alignment: Alignment.topCenter,
              child: Icon(Icons.person, size: 80, color: colorScheme.primary),
            ),

            const SizedBox(height: 20),

            // Welcome text aligned left
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: GoogleFonts.poppins(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "  Let's chat",
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: colorScheme.inversePrimary,
                    ),
                  ),
                  SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(color: colorScheme.primary.withOpacity(0.3)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Drawer Items
            _buildDrawerItem(
              context: context,
              icon: Icons.home,
              text: 'H O M E',
              onTap: () => Navigator.pop(context),
            ),
            _buildDrawerItem(
              context: context,
              icon: Icons.settings,
              text: 'S E T T I N G S',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingPage()),
                );
              },
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: colorScheme.primary.withOpacity(0.3)),
            ),

            _buildDrawerItem(
              context: context,
              icon: Icons.logout,
              text: 'Logout',
              onTap: () => logout(),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        leading: Icon(icon, color: colorScheme.inversePrimary),
        title: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: colorScheme.inversePrimary,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
