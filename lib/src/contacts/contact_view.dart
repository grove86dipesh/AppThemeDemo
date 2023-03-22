import 'package:flutter/material.dart';
import '../data/contact_data.dart';
import 'contact_presenter.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: "Contacts".label(),
        ),
        body: const ContactList());
  }
}

extension CuttomText on String {
  Widget label() {
    return Text(this);
  }
}

///
///   Contact List
///
class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  ContactListState createState() => ContactListState();
}

class ContactListState extends State<ContactList>
    implements ContactListViewContract {
  late ContactListPresenter _presenter;

  late List<Contact> _contacts;

  late bool _isSearching;

  ContactListState() {
    _presenter = ContactListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isSearching = true;
    _presenter.loadContacts();
  }

  @override
  void onLoadContactsComplete(List<Contact> items) {
    setState(() {
      _contacts = items;
      _isSearching = false;
    });
  }

  @override
  void onLoadContactsError({Widget? error}) {
    // TODO: implement onLoadContactsError
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;

    if (_isSearching) {
      widget = const Center(
          child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: CircularProgressIndicator()));
    } else {
      widget = ListView(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          children: _buildContactList());
    }

    return widget;
  }

  List<_ContactListItem> _buildContactList() {
    return _contacts.map((contact) => _ContactListItem(contact)).toList();
  }
}

///
///   Contact List Item
///
class _ContactListItem extends ListTile {
  _ContactListItem(Contact contact)
      : super(
            title: Text(contact.fullName ?? ''),
            subtitle: Text(contact.email ?? ''),
            leading: CircleAvatar(child: Text(contact.fullName![0])));
}
