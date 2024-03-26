import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  String _nama = '';
  String _notelp = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kontak Baru'),
        backgroundColor: Colors.teal,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nama Kontak',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap Masukan Nama Kontak';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    if (value != null) {
                      _nama = value;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nomot Telpon',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap Masukan Nomor Telpon';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    if (value != null) {
                      _notelp = value;
                    }
                  },
                ),
              ),
              ElevatedButton(
                child: Text('Simpan'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    Navigator.pop(
                        context, {'Nama': _nama, 'No Telpon': _notelp});
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
