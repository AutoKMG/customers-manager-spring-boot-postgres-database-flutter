// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/layout/main_layout.dart';
import 'package:frontend/shared/logic/customer_controller/handler.dart';
import 'package:frontend/shared/network/remote/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppHandler(),
      child: MaterialApp(
        title: "Customers Manager",
        debugShowCheckedModeBanner: false,
        home: MainLayout(),
      ),
    );
  }
}
