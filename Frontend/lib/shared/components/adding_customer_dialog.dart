import 'package:flutter/material.dart';
import 'package:frontend_customers/models/customer.dart';
import 'package:frontend_customers/shared/components/defaultFormField.dart';
import 'package:frontend_customers/shared/logic/customer_controller/handler.dart';

Widget addingCustomer(BuildContext context, AppHandler appHandler) {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  var formKey = GlobalKey<FormState>();
  return AlertDialog(
    title: Text("Adding new customer"),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Close")),
      TextButton(
          onPressed: () {
            appHandler.addCustomer(nameController.text, emailController.text,
                int.parse(ageController.text));
            Navigator.pop(context);
          },
          child: Text("Add")),
    ],
    content: Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          defaultFormField(
              context: context,
              controller: nameController,
              label: 'Customer Name'),
          SizedBox(height: 15),
          defaultFormField(
              context: context,
              controller: emailController,
              label: 'Customer Email'),
          SizedBox(height: 15),
          defaultFormField(
              context: context,
              controller: ageController,
              label: 'Customer Age'),
        ]),
      ),
    ),
  );
}
