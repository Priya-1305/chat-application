// Refactored Homepage and ChatPage UI inspired by the reference design

// HOMEPAGE (Chat List Screen)
import 'package:flutter/material.dart';
import 'package:priya/Auth/auth_services.dart';
import 'package:priya/Auth/chat_ser.dart';
import 'package:priya/component/My_drawer.dart';
import 'package:priya/component/userTile.dart';
import 'package:priya/pages/Chat_page.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final AuthServices _auth = AuthServices();
  final ChatServices _chatService = ChatServices();

  void logout() => _auth.signOut();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        elevation: 0,
        title: Text('Chats', style: GoogleFonts.poppins(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: logout,
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: Column(children: [Expanded(child: _buildUserList())]),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return const Text("Error");
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
    Map<String, dynamic> userData,
    BuildContext context,
  ) {
    final currentUser = _auth.getCurrentUser();
    if (userData["email"] == currentUser?.email) return const SizedBox.shrink();

    return ListTile(
      leading: const CircleAvatar(
        radius: 25,
        backgroundColor: Color.fromARGB(255, 214, 152, 225),
      ),
      title: Text(userData["email"], style: GoogleFonts.poppins()),
      subtitle: const Text("Tap to chat"),
      trailing: const Icon(
        Icons.circle,
        size: 10,
        color: Color.fromARGB(255, 188, 132, 198),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatPage(
            receiverEmail: userData["email"],
            receiverID: userData["uid"],
          ),
        ),
      ),
    );
  }
}
