import 'package:flutter/material.dart';
import 'package:reels_app_demo/data/user_data.dart';
import 'package:reels_app_demo/widgets/custom_textFormField.dart';
import 'package:reels_app_demo/widgets/custom_wave_clipper.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final forgotPasswordFormKey = GlobalKey<FormState>();
  final forgotPasswordController = TextEditingController();

  void forgot(BuildContext context) {
    if (forgotPasswordFormKey.currentState!.validate()) {
      final email = forgotPasswordController.text.trim();
      if (users.any((user) => user.email == email)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password reset link sent to $email')),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Email not found')));
      }
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
              child: Container(color: Colors.deepOrangeAccent, height: 320),
            ),
          ),
          ClipPath(
            clipper: WaveClipper(),
            child: Container(color: Colors.deepOrangeAccent, height: 300),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: forgotPasswordFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    customTextFormField(
                      controller: forgotPasswordController,
                      labelText: "Email",
                      hintText: 'Enter your email',
                      prefixIcon: Icons.email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => forgot(context),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.deepOrangeAccent,
                      ),
                      child: Text(
                        "Reset Password",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
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
