import 'package:flutter/material.dart';
import 'package:frontend/modules/main_screen/main_screen.dart';
import 'package:frontend/shared/components/adding_customer_dialog.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MainScreen(),
    );
  }
}
