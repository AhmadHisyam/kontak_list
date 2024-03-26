import 'package:flutter/material.dart';
import 'package:contac_list/kontak_list/contact_form.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Map<String, dynamic>> contacts = [
    {'Nama': 'Ahmad Hisyam', 'No Telpon': '08091207681'},
    {'Nama': 'Abdillah', 'No Telpon': '08030990998'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kontak'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.contact_phone),
            title: Text(contacts[index]['Nama']),
            subtitle: Text(contacts[index]['No Telpon']),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  contacts.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
        onPressed: () async {
          final newContact = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactForm()),
          );
          if (newContact != null) {
            setState(() {
              contacts.add(newContact);
            });
          }
        },
      ),
    );
  }
}
