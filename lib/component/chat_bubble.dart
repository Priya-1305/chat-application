import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:priya/themes/theme_provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const ChatBubble({
    super.key,
    required this.isCurrentUser,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Container(
      margin: EdgeInsets.only(
        top: 8,
        bottom: 8,
        left: isCurrentUser ? 50 : 10,
        right: isCurrentUser ? 10 : 50,
      ),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isCurrentUser
            ? (isDarkMode ? Colors.deepPurple : Colors.purple)
            : (isDarkMode ? Colors.grey.shade700 : Colors.grey.shade300),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
          bottomLeft: Radius.circular(isCurrentUser ? 20 : 0),
          bottomRight: Radius.circular(isCurrentUser ? 0 : 20),
        ),
      ),
      child: Text(
        message,
        style: GoogleFonts.poppins(
          color: isCurrentUser ? Colors.white : Colors.black87,
          fontSize: 15,
        ),
      ),
    );
  }
}
