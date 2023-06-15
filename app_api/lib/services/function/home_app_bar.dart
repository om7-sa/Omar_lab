import 'package:app_api/services/extensions/navigitor/pushEXT.dart';
import 'package:flutter/material.dart';

import '../../views/GetID_screen.dart';
import '../../views/Login_screen.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        context.pushAndRemove(view: LoginScreen());
      },
      icon: const Icon(Icons.arrow_back),
    ),
    title: const Text("Home Screen"),
    backgroundColor: const Color.fromARGB(255, 22, 66, 136),
    actions: [
      IconButton(
          onPressed: () {
            context.pushAndRemove(view: const GetScreenID());
          },
          icon: const Icon(Icons.move_down))
    ],
  );
}
