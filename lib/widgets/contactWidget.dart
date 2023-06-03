import 'package:flutter/material.dart';

class ContactWidget extends StatefulWidget {
  String name;
  String phone;


  ContactWidget(this.name, this.phone, {super.key});



  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  // ContactWidget(this.name, this.phone, this.onTapped, this.index);
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.name.isNotEmpty && widget.phone.isNotEmpty ? true : false,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          tileColor: Colors.white,
          contentPadding: const EdgeInsets.all(20),
          isThreeLine: true,
          iconColor: Colors.red,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              'Name: ${widget.name}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          subtitle: Text(
            'Phone: ${widget.phone}',
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          trailing: Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.name = '';
                    widget.phone = '';
                  });
                },
                icon: const Icon(Icons.delete_rounded),
              ),
            ],
          ),
        ),
      ),


    );
  }
}
