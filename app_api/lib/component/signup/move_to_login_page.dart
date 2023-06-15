import 'package:app_api/services/extensions/navigitor/pushEXT.dart';
import 'package:flutter/material.dart';

import '../../views/Login_screen.dart';

class MoveToLogin extends StatelessWidget {
  const MoveToLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account? ",
          style: TextStyle(fontSize: 16),
        ),
        InkWell(
          onTap: () {
            context.pushAndRemove(view: LoginScreen());
          },
          child: const Text(
            "Login",
            style: TextStyle(
              color: Color.fromARGB(255, 17, 91, 152),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
