import 'package:flutter/material.dart';
import 'package:frontend/models/customer.dart';
import 'package:frontend/shared/logic/customer_controller/handler.dart';

Widget customerListTile(Customer customer, AppHandler appHandler) {
  return ListTile(
    leading: CircleAvatar(child: Text("${customer.id}")),
    title: Text("${customer.name}"),
    subtitle: Text("${customer.email}. Age: ${customer.age}"),
    trailing: IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
        appHandler.deleteCustomer("${customer.id}");
      },
    ),
  );
}
