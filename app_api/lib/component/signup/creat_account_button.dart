import 'package:app_api/views/Login_screen.dart';
import 'package:flutter/material.dart';

import '../../services/api/Auth/createUser.dart';

class CreatAccountButton extends StatelessWidget {
  const CreatAccountButton({
    super.key,
    required this.emailController,
    required this.password,
    required this.username,
    required this.nameController,
  });

  final TextEditingController emailController;
  final String password;
  final String username;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 27, 86, 137))),
          onPressed: () async {
            final Map body = {
              "email": emailController.text,
              "password": password,
              "username": username,
              "name": nameController.text
            };
            final response = await createUser(body: body);

            if (response.statusCode == 200) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Color.fromARGB(255, 22, 66, 136),
                  content: Text("Invalid input")));
            }
          },
          child: const Text(
            "Create",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
