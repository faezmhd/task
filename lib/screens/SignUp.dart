import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'input_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeToPolicy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWithIcon(
                      controller: firstNameController,
                      hintText: 'First Name',
                      icon: Icons.person,
                      borderColor: Colors.red,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFieldWithIcon(
                      controller: lastNameController,
                      hintText: 'Last Name',
                      icon: Icons.person,
                      borderColor: Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFieldWithIcon(
                controller: emailController,
                hintText: 'Email',
                icon: Icons.email,
                borderColor: Colors.red,
              ),
              const SizedBox(height: 16),
              TextFieldWithIcon(
                controller: passwordController,
                hintText: 'Password',
                icon: Icons.lock,
                isPassword: true,
                obscureText: _obscurePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                ),
                borderColor: Colors.red,
              ),
              const SizedBox(height: 16),
              TextFieldWithIcon(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                icon: Icons.lock,
                isPassword: true,
                obscureText: _obscureConfirmPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                  icon: Icon(
                    _obscureConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.white,
                  ),
                ),
                borderColor: Colors.red,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: _agreeToPolicy,
                    onChanged: (value) {
                      setState(() {
                        _agreeToPolicy = value ?? false;
                      });
                    },
                    checkColor: Colors.red,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: 'I agree with ',
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: 'privacy',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: 'policy',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Save entered details
                  saveDetails();

                  // Navigate to login screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('firstName', firstNameController.text);
    prefs.setString('lastName', lastNameController.text);
    prefs.setString('email', emailController.text);
    prefs.setString('password', passwordController.text);
    prefs.setString('confirmPassword', confirmPasswordController.text);
    prefs.setBool('agreeToPolicy', _agreeToPolicy);
  }
}

class TextFieldWithIcon extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final bool obscureText;
  final Widget? suffixIcon;
  final Color borderColor;
  final TextEditingController? controller;

  const TextFieldWithIcon({
    Key? key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.obscureText = false,
    this.suffixIcon,
    required this.borderColor,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor),
        ),
        filled: true,
        fillColor: Colors.transparent,
      ),
    );
  }
}
