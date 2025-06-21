import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:priya/Auth/auth_services.dart';
import 'package:priya/component/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpwController = TextEditingController();
  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context) async {
    final _auth = AuthServices();
    if (_passwordController.text == _confirmpwController.text) {
      try {
        _auth.signUpWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString(), style: GoogleFonts.poppins()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Passwords do not match", style: GoogleFonts.poppins()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          // Background top gradient circle
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

          // Main content
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    const SizedBox(height: 190),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Create account",
                        style: GoogleFonts.poppins(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.tertiary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            "Already have an account? ",

                            style: GoogleFonts.poppins(
                              fontSize: 19,
                              color: colorScheme.tertiary,
                            ),
                          ),
                          GestureDetector(
                            onTap: onTap,
                            child: Text(
                              "sign in",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                                color: colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 64),

                    // Fields
                    MyTextfield(
                      hinttext: "Email",
                      obscureText: false,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 20),
                    MyTextfield(
                      hinttext: "Password",
                      obscureText: true,
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 20),
                    MyTextfield(
                      hinttext: "Confirm password",
                      obscureText: true,
                      controller: _confirmpwController,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom-right Sign Up Button
          Positioned(
            bottom: 30,
            right: 25,
            child: ElevatedButton.icon(
              onPressed: () => register(context),
              icon: const Icon(Icons.arrow_forward),
              label: Text(
                "Sign up",
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
