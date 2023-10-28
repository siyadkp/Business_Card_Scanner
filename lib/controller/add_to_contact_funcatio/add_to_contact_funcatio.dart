import 'package:contacts_service/contacts_service.dart';

import '../permission_access_function/permission_access_function.dart';

Future<void> addToContacts(String name, String phoneNumber) async {
  await requestContactPermissionOfContacs();
  // Create a Contact object.
  final contact = Contact();
  contact.givenName = name;

  // Create a Phone object.
  final phone = Item(
    label: 'mobile', // You can choose the label as per your need.
    value: phoneNumber,
  );
  contact.phones = [phone];

  // Save the contact to the device's contact book.
  await ContactsService.addContact(contact);
}
