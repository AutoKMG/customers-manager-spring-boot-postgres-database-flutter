import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_customers/shared/components/adding_customer_dialog.dart';
import 'package:frontend_customers/shared/components/customer_listile.dart';
import 'package:frontend_customers/shared/logic/customer_controller/handler.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppHandler, AppState>(
      builder: (context, state) {
        AppHandler appHandler = context.read();
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          width: double.infinity,
          child: ListView(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: appHandler.customerList.length,
                itemBuilder: (context, index) {
                  if (appHandler.customerList.isEmpty) {
                    return const Center(
                        child: Text("You need to add some customers",
                            style: TextStyle(fontSize: 40)));
                  } else {
                    return customerListTile(
                        appHandler.customerList[index], appHandler);
                  }
                },
              ),
              SizedBox(height: 10,),
              IconButton(onPressed: (){
                showDialog(context: context, builder: (context) {
                  return addingCustomer(context, appHandler);
                },);
              }, icon: const Icon(Icons.add)),
            ],
          ),
        );
      },
    );
  }
}
