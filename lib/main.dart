import 'package:contact_app/screen/addContactScreen.dart';
import 'package:flutter/material.dart';

void main (){
 runApp(const ContactApp());
}

class ContactApp extends StatelessWidget {
  const ContactApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AddContact.routeName,
      routes: {
        AddContact.routeName:(context) => const AddContact(),


      },
    );
  }
}
