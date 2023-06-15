import 'dart:convert';
import 'package:app_api/services/api/User/create_order.dart';
import 'package:app_api/services/api/User/get_orders.dart';
import 'package:app_api/services/extensions/navigitor/pushEXT.dart';
import 'package:app_api/services/function/functions.dart';
import 'package:app_api/views/Login_screen.dart';
import 'package:app_api/views/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../component/home/card_orders.dart';
import '../services/function/home_app_bar.dart';
import '../component/home/home_fields.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  List listOrders = [];
  @override
  void initState() {
    super.initState();
    displayOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: ListView(
        children: [
          HomeFields(
              titleController: titleController,
              contentController: contentController),
          Center(
              child: ElevatedButton(
            style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 27, 86, 137))),
            child: const Text("Add Order"),
            onPressed: () async {
              final result = await createOrder(context: context, body: {
                "title": titleController.text,
                "content": contentController.text
              });

              print(result.statusCode);
              displayOrders();
              contentController.clear();
              titleController.clear();
            },
          )),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Orders",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          //-------------- display orders ---------------

          for (var item in listOrders.reversed)
            InkWell(
                onTap: () {
                  context.pushPage(page: OrderScreen(order: item));
                },
                child: CardOrders(order: item)),
        ],
      ),
    );
  }

  displayOrders() async {
    if ((await getOrders()).statusCode == 200) {
      if (context.mounted) {
        lodingPage(context: context);
      }

      setState(() {});

      listOrders = json.decode((await getOrders()).body)["data"];
    } else {
      final box = GetStorage();
      box.remove("token");
      if (context.mounted) {
        context.pushAndRemove(view: LoginScreen());
      }
    }
    if (context.mounted) {
      Navigator.pop(context);
    }

    setState(() {});
  }
}
