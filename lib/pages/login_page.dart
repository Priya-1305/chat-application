// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:priya/Auth/auth_services.dart';
import 'package:priya/component/my_button.dart';
import 'package:priya/component/my_textfield.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  void login(BuildContext context) async {
    final authServices = AuthServices();

    try {
      await authServices.signInWithEmailPassword(
        _emailController.text,
        _passwordController.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          Positioned(
            top: -50,
            left: -80,
            child: Container(
              height: 380,
              width: 420,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.inverseSurface,
                    Theme.of(context).colorScheme.surface,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                // Wrap Column with Center
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // Important to avoid stretching vertically
                  children: [
                    SizedBox(height: 170),
                    Icon(
                      Icons.message,
                      size: 80,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(height: 30),
                    Text(
                      "You've been missed!",
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.tertiary,
                      ),
                    ),
                    SizedBox(height: 50),
                    MyTextfield(
                      hinttext: "email",
                      obscureText: false,
                      controller: _emailController,
                    ),
                    SizedBox(height: 20),
                    MyTextfield(
                      hinttext: "password",
                      obscureText: true,
                      controller: _passwordController,
                    ),

                    SizedBox(height: 20),
                    MyButton(text: 'Login', OnTap: () => login(context)),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not a member? ",

                          style: GoogleFonts.poppins(
                            fontSize: 19,
                            color: colorScheme.tertiary,
                          ),
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: Text(
                            " Register now!",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                              color: colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
