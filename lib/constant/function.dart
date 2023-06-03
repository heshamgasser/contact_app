import '../widgets/contactWidget.dart';

class UsedFunction {

  static void addNewContact (String name , phone , List<ContactWidget> general) {
    if (name.isNotEmpty && phone.isNotEmpty) {
      general.add(
        ContactWidget(name, phone),
      );
    }
  }

  static void delete (List<ContactWidget> general){
    general.last = ContactWidget('', '');
    general.length = general.length - 1;
  }





}