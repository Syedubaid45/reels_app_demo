import 'package:flutter/material.dart';
import 'package:reels_app_demo/data/user_data.dart';
import 'package:reels_app_demo/reels/reels_view.dart';
import 'package:reels_app_demo/screens/Forget_Password_Screen.dart';
import 'package:reels_app_demo/screens/Singup_screen.dart';
import 'package:reels_app_demo/widgets/custom_textFormField.dart';
import 'package:reels_app_demo/widgets/custom_wave_clipper.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  login(context) {
    if (loginFormKey.currentState!.validate()) {
      final email = usernameController.text;
      final password = passwordController.text;

      if (users.any(
        (user) => user.email == email && user.password == password,
      )) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ReelsView()),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Invalid email or password')));
      }
    }
  }

  signup(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupScreen()),
    );
  }

  forgot(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
    );
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
              child: Container(color: Colors.deepOrangeAccent, height: 250),
            ),
          ),
          ClipPath(
            clipper: WaveClipper(),
            child: Container(color: Colors.deepOrangeAccent, height: 220),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login to Reels App",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    customTextFormField(
                      controller: usernameController,
                      labelText: "Email",
                      hintText: 'Enter your email',
                      prefixIcon: Icons.email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
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
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 10),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          forgot(context);
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.deepOrangeAccent),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        login(context);
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
                        "Login",
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
                        Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            signup(context);
                          },
                          child: Text(
                            "Signup",
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
