import 'package:flutter/material.dart';

class DisplayOrderByID extends StatelessWidget {
  const DisplayOrderByID({super.key, required this.orderName});
  final Map<dynamic, dynamic> orderName;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: orderName.isNotEmpty,
      child: Container(
        // decoration:
        //     BoxDecoration(borderRadius: BorderRadiusDirectional.circular(18)),
        color: const Color.fromARGB(255, 24, 64, 113),
        height: 200,
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(orderName["id"].toString(),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 24)),
              const SizedBox(
                height: 24,
              ),
              Text(
                orderName["title"].toString(),
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(orderName["content"].toString(),
                    style: const TextStyle(color: Colors.white)),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(orderName["create_at"].toString(),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 182, 182, 182))),
            ],
          ),
        ),
      ),
    );
  }
}
