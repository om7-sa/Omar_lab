import 'dart:convert';
import 'package:app_api/services/api/User/getByID.dart';
import 'package:app_api/services/extensions/navigitor/pushEXT.dart';
import 'package:app_api/views/Home_screen.dart';
import 'package:flutter/material.dart';
import '../component/all/custome_text_field.dart';
import '../component/order_by_id/display_order_by_id.dart';

class GetScreenID extends StatefulWidget {
  const GetScreenID({super.key});

  @override
  State<GetScreenID> createState() => _GetScreenIDState();
}

class _GetScreenIDState extends State<GetScreenID> {
  Map order = {};
  final TextEditingController idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get order By Id"),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 22, 66, 136),
        leading: IconButton(
          onPressed: () {
            context.pushAndRemove(view: const HomeScreen());
          },
          icon: const Icon(Icons.home),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          TextFieldCustom(
              controller: idController,
              hint: "enter id",
              label: "ID",
              icon: Icons.insert_drive_file),
          Center(
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 27, 86, 137))),
                  onPressed: () async {
                    try {
                      order = json
                          .decode((await getByID(id: idController.text)).body);

                      if ((order["data"] as List).isEmpty) {
                        order = {};
                      } else {
                        order = order["data"][0];
                      }

                      setState(() {});
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Color.fromARGB(255, 22, 66, 136),
                          content: Text("plase enter correct number")));
                    }
                  },
                  child: const Text("Get id"))),
          const SizedBox(
            height: 48,
          ),
          DisplayOrderByID(orderName: order)
        ]),
      ),
    );
  }
}
