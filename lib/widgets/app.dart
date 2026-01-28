import 'package:flutter/material.dart';
import 'contact_list.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contacts App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContactList(),
    );
  }
}