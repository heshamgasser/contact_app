import 'package:contact_app/constant/constant.dart';
import 'package:contact_app/widgets/buttonWidget.dart';
import 'package:contact_app/widgets/customTextFieldWidget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../widgets/contactWidget.dart';

class AddContact extends StatefulWidget {
  static const String routeName = 'Add Contact Screen';

  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  bool isVisible = false;
  int counterIndex = 0;
  List<ContactWidget> newContact = [];
  List<int> checkIndex = [];
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  GlobalKey validateText = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Contacts Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
            child: Column(
              children: [
                CustomTextFieldWidget(
                  hint: 'Enter Your Name Here',
                  suffix: const Icon(EvaIcons.edit2),
                  controller: nameController,
                  length: 20,
                ),
                const SizedBox(height: 20),
                CustomTextFieldWidget(
                  hint: 'Enter Your Phone Number',
                  suffix: const Icon(Icons.phone),
                  controller: phoneController,
                  keyboard: TextInputType.phone,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ButtonWidget(
                          buttonColor: Colors.blue,
                          buttonText: 'Add ',
                          onTapped: addContact),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: AbsorbPointer(
                        absorbing: newContact.isEmpty ? true : false,
                        child: ButtonWidget(
                            buttonColor: Colors.red,
                            buttonText: 'Delete All',
                            onTapped: deleteAll),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                return newContact[index];
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemCount: newContact.length,
            ),
          ),

          // Column(
          //   children: newContact,
          // )
        ],
      ),
    );
  }

  void addContact() {
    String name = nameController.text;
    String phone = phoneController.text;
    setState(() {
      nameController.text = '';
      phoneController.text = '';
      if (name.isNotEmpty && phone.isNotEmpty) {
        newContact.add(
          ContactWidget(name, phone),
        );

        //if want to add items always in the first index

        // newContact.insert(0,
        //   ContactWidget(
        //       name, phone, isVisible, specificDeleteContact),
        // );
      }
    });
  }

  // Not Used now

  // void deleteContact() {
  //   setState(() {
  //     newContact.last = ContactWidget('', '');
  //     newContact.length = newContact.length - 1;
  //   });
  // }

  void deleteAll() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text(
              'Are you Sure? Press Delete to Confirm, Cancel To Exit'),
          title: const Text('Delete All Items'),
          buttonPadding: const EdgeInsets.all(20),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    newContact.clear();
                    Navigator.pop(context);
                  });
                },
                child: const Text('Delete')),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
