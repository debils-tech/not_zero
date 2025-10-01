import 'package:flutter/material.dart';

class CommonLoadingScreen extends StatelessWidget {
  const CommonLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
