import 'package:flutter/material.dart';
import 'package:reels_app_demo/data/user_data.dart';
import 'package:reels_app_demo/widgets/custom_textFormField.dart';
import 'package:reels_app_demo/widgets/custom_wave_clipper.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final signupFormKey = GlobalKey<FormState>();

  signup(context) {
    if (signupFormKey.currentState!.validate()) {
      users.add(
        User(
          email: emailController.text.trim(),
          username: usernameController.text.trim(),
          password: passwordController.text,
        ),
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Signup successful!')));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(color: Colors.deepOrangeAccent, height: 220),
            ),
          ),
          ClipPath(
            clipper: WaveClipper(),
            child: Container(color: Colors.deepOrangeAccent, height: 200),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: signupFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up to your Reels App",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    customTextFormField(
                      controller: usernameController,
                      labelText: "Username",
                      hintText: 'Enter your username',
                      prefixIcon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    customTextFormField(
                      controller: emailController,
                      labelText: "Email",
                      hintText: 'Enter your email',
                      prefixIcon: Icons.email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }

                        if (users.any((user) => user.email == value)) {
                          return 'Email already exists';
                        }

                        if (value.contains('@') == false) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    customTextFormField(
                      controller: passwordController,
                      labelText: "Password",
                      hintText: 'Enter your Password',
                      prefixIcon: Icons.lock,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Password';
                        }
                        if (value.length <= 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    customTextFormField(
                      controller: confirmPasswordController,
                      labelText: "Confirm Password",
                      hintText: 'Re-enter your Password',
                      prefixIcon: Icons.lock,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your Password';
                        }
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        signup(context);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                          double.infinity,
                          50,
                        ), // Full width, fixed height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor:
                            Colors.deepOrangeAccent, // Button color
                      ),
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontWeight: FontWeight.w600,
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
