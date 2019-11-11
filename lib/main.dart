import 'package:contact_simple/Model/contact.dart';
import 'package:contact_simple/Screen/contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Contacts>(
      builder: (context) => Contacts(),
      child: MaterialApp(
        title: 'Contact',
        home: Contact(),
      ),
    );
  }
}
