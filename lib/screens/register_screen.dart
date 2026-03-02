import 'package:flutter/material.dart';
import 'package:loginnotebad/screens/login_screen.dart';
import 'package:loginnotebad/shared_preference_helper.dart';
import '../widgets/custom_elevatedbutton.dart';
import '../widgets/custom_textfiled.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginScreen()),
                        );
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Create Profile',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff191D31)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    "assets/image/Female Profile.png",
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(height: 15),
                const Text("Username", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 5),
                CustomTextField(
                  labelTex: 'Enter your username',
                  fillColor: Colors.white38,
                  prefixIcon: const Icon(Icons.person, size: 25),
                  controller: usernameController,
                ),
                const SizedBox(height: 10),
                const Text("Email or Phone Number", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 5),
                CustomTextField(
                  labelTex: 'Enter your Email or phone number',
                  fillColor: Colors.white38,
                  prefixIcon: const Icon(Icons.mail_outline, size: 25),
                  controller: emailController,
                ),
                const SizedBox(height: 10),
                const Text("Password", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 5),
                CustomTextField(
                  labelTex: 'Enter your Password',
                  fillColor: Colors.white38,
                  prefixIcon: const Icon(Icons.lock, size: 25),
                  obscureText: true,
                  controller: passwordController,
                ),
                const SizedBox(height: 5),
                const Text("Confirm Password", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 5),
                CustomTextField(
                  labelTex: 'Enter your Password again',
                  fillColor: Colors.white38,
                  prefixIcon: const Icon(Icons.lock, size: 25),
                  obscureText: true,
                  controller: confirmPasswordController,
                ),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  backgroundColor: Colors.grey,
                  text: 'Register',
                  width: double.infinity,
                  height: 56,
                  onpressed: () async {
                    await SharedPrefHelper.setUsername(usernameController.text);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}