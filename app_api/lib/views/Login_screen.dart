import 'package:app_api/services/extensions/navigitor/pushEXT.dart';
import 'package:app_api/views/signup_screen.dart';
import 'package:flutter/material.dart';

import '../component/all/custome_text_field.dart';
import '../component/all/lable_page.dart';
import '../component/log_in/login_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const LabelScreen(
            title: "Log In",
          ),
          TextFieldCustom(
            hint: "example@gmail.com",
            label: "Email",
            icon: Icons.email,
            controller: emailController,
          ),
          TextFieldCustom(
            hint: "******",
            label: "Password",
            icon: Icons.password_rounded,
            obscureText: true,
            isPassword: true,
            controller: passwordController,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LoginButton(
              emailController: emailController,
              passwordController: passwordController,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account? ",
                style: TextStyle(
                  color: Color.fromARGB(255, 12, 19, 25),
                  fontSize: 16,
                ),
              ),
              InkWell(
                onTap: () {
                  context.pushAndRemove(view: const SignUpScreen());
                },
                child: const Text(
                  "Signup",
                  style: TextStyle(
                    color: Color.fromARGB(255, 17, 91, 152),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
