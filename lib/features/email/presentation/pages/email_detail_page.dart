import 'package:flutter/material.dart';

class EmailDetailPage extends StatelessWidget {
  final String emailId;

  const EmailDetailPage({super.key, required this.emailId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Email')),
      body: Center(child: Text('Detalhes do email: $emailId')),
    );
  }
}