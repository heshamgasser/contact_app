import 'package:flutter/material.dart';

import '../widgets/contactWidget.dart';

class ContactProvider extends ChangeNotifier{
  int counterIndex = 0;
  List<ContactWidget> newContact = [];
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  void addContact() {
    String name = nameController.text;
    String phone = phoneController.text;

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
      notifyListeners();
  }

// Not Used now

// void deleteContact() {
//   setState(() {
//     newContact.last = ContactWidget('', '');
//     newContact.length = newContact.length - 1;
//   });
// }


  void deleteAll(BuildContext context) {
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

                    newContact.clear();
                    Navigator.pop(context);

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
    notifyListeners();
  }


}