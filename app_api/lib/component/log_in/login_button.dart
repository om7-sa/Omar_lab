import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../services/api/Auth/login.dart';
import '../../views/Home_screen.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: ElevatedButton(
            style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 27, 86, 137))),
            onPressed: () async {
              final Map body = {
                "email": emailController.text,
                "password": passwordController.text,
              };
              final response = await loginUser(body: body);

              if (response.statusCode == 200) {
                final box = GetStorage();
                box.write("token", json.decode(response.body)["data"]["token"]);

                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (route) => false);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Color.fromARGB(255, 22, 66, 136),
                    content: Text("Invalid input")));
              }
            },
            child: const Text("Login")));
  }
}
