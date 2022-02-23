// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bytebank2/database/app_database.dart';
import 'package:bytebank2/database/dao/contact_dao.dart';
import 'package:bytebank2/models/contacts.dart';
import 'package:bytebank2/screens/contact_form.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class ContactList extends StatefulWidget {

  @override
  State<ContactList> createState() => _ContactListState();
}
  final ContactDao _dao = ContactDao();

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
        ),
// inserido generics no FutureBuilder
        body: FutureBuilder<List<Contact>>(
          future: Future.delayed(Duration(seconds: 1)).then(
            (value) => _dao.findAll(),
          ),
          builder: (context, snapshot) {
            final List<Contact>? contacts = snapshot
                .data; // usado null safe na lista pois é regra da nova versão do flutter
            if (contacts != null) {
              //feito if para validar nulo
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];
                  return _ContactItem(contact);
                },
                itemCount: contacts.length,
              );
            }
            return Container();
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return ContactForm();
              },
            )).then((value) {
              setState(() {});
            });
          },
        ));
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;
  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
