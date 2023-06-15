import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key, required this.order});

  final Map order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 22, 66, 136),
        title: Text(
          order["title"],
        ),
        elevation: 0,
        leading: IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const Icon(Icons.arrow_back)),
      ),
      body: ListView(children: [
        Card(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Order Id : ${order["id"]}",
                    style: const TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 23, 82, 130)),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                order["title"],
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 28,
              ),
              Text(
                order["content"],
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    order["create_at"],
                    style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 169, 169, 169)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
