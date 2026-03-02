import 'package:flutter/material.dart';
import 'package:loginnotebad/screens/notes_home_screen.dart';
import 'package:loginnotebad/screens/register_screen.dart';
import 'package:loginnotebad/shared_preference_helper.dart';
import 'package:loginnotebad/widgets/custom_elevatedbutton.dart';
import 'package:loginnotebad/widgets/custom_textfiled.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
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
                const Row(
                  children: [
                    Icon(Icons.arrow_back_ios, color: Colors.black, size: 24),
                    Expanded(
                      child: Center(
                        child: Text('Login',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff191D31))),
                      ),
                    ),
                    SizedBox(width: 24),
                  ],
                ),
                const SizedBox(height: 25),
                Center(
                  child: Image.asset(
                      "assets/image/Female Profile.png",
                      width: 100,
                      height: 100),
                ),
                const SizedBox(height: 10),
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
                const SizedBox(height: 25),
                CustomElevatedButton(
                  backgroundColor: Colors.black,
                  text: 'Login',
                  width: double.infinity,
                  height: 56,
                  onpressed: () async {
                    // Save login state
                    await SharedPrefHelper.setUsername(usernameController.text);
                    await SharedPrefHelper.setLoggedIn(true);

                    // Go to NotesHome
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const NotesHome()));
                  },
                ),
                const SizedBox(height: 15),
                CustomElevatedButton(
                  backgroundColor: Colors.grey,
                  text: 'Register',
                  width: double.infinity,
                  height: 56,
                  onpressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const RegisterScreen()));
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
