import 'package:flutter/material.dart';

class CommonLoadingScreen extends StatelessWidget {
  const CommonLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
