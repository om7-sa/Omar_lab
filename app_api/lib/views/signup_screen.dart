import 'package:app_api/component/signup/creat_account_button.dart';
import 'package:flutter/material.dart';

import '../component/all/custome_text_field.dart';
import '../component/all/lable_page.dart';
import '../component/signup/move_to_login_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const LabelScreen(title: "Sign up"),
          TextFieldCustom(
            hint: "user123",
            label: "Username",
            icon: Icons.person,
            onChanged: (value) {
              username = value;
            },
          ),
          TextFieldCustom(
            hint: "Fahad Alazmi",
            label: "Name",
            icon: Icons.person_outline_sharp,
            controller: nameController,
          ),
          TextFieldCustom(
            hint: "example@gmail.com",
            label: "Email",
            icon: Icons.email,
            controller: emailController,
          ),
          TextFieldCustom(
            hint: "AAaa1100229933",
            label: "password",
            icon: Icons.password,
            obscureText: true,
            isPassword: true,
            onChanged: (pass) {
              password = pass;
            },
          ),
          CreatAccountButton(
              emailController: emailController,
              password: password,
              username: username,
              nameController: nameController),
          const MoveToLogin()
        ],
      ),
    );
  }
}
