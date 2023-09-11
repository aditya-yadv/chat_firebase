import 'package:chat_firebase/components/my_button.dart';
import 'package:chat_firebase/components/my_textfield.dart';
import 'package:chat_firebase/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text field controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // signin user
  void signIn() {
    // get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      authService.signInWithEmailandPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                SizedBox(height: 30),
                Icon(
                  Icons.message,
                  size: 100,
                  color: Colors.grey[800],
                ),

                // welcome back message
                SizedBox(height: 30),
                Text(
                  "Welcome back you\'ve been missed!",
                  style: TextStyle(fontSize: 16),
                ),

                // email field
                SizedBox(height: 20),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                // password field
                SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                // signin button
                SizedBox(height: 20),
                MyButton(onTab: signIn, text: 'SignIn'),

                //not a member?
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member? '),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Register Now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
